package com.ruozedata.erp.service.userBusiness;

import com.alibaba.fastjson.JSONObject;
import com.ruozedata.erp.constants.BusinessConstants;
import com.ruozedata.erp.constants.ExceptionConstants;
import com.ruozedata.erp.datasource.entities.*;
import com.ruozedata.erp.datasource.mappers.UserBusinessMapper;
import com.ruozedata.erp.datasource.mappers.UserBusinessMapperEx;
import com.ruozedata.erp.exception.BusinessRunTimeException;
import com.ruozedata.erp.exception.JshException;
import com.ruozedata.erp.service.CommonQueryManager;
import com.ruozedata.erp.service.functions.FunctionsService;
import com.ruozedata.erp.service.log.LogService;
import com.ruozedata.erp.service.user.UserService;
import com.ruozedata.erp.utils.StringUtil;
import com.ruozedata.erp.constants.BusinessConstants;
import com.ruozedata.erp.datasource.entities.User;
import com.ruozedata.erp.datasource.entities.UserBusiness;
import com.ruozedata.erp.datasource.entities.UserBusinessExample;
import com.ruozedata.erp.datasource.mappers.UserBusinessMapper;
import com.ruozedata.erp.datasource.mappers.UserBusinessMapperEx;
import com.ruozedata.erp.exception.JshException;
import com.ruozedata.erp.service.functions.FunctionsService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.CollectionUtils;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.*;

@Service
public class UserBusinessService {
    private Logger logger = LoggerFactory.getLogger(UserBusinessService.class);

    @Resource
    private UserBusinessMapper userBusinessMapper;
    @Resource
    private UserBusinessMapperEx userBusinessMapperEx;
    @Resource
    private LogService logService;
    @Resource
    private UserService userService;

    @Resource
    private FunctionsService functionsService;

    @Resource
    private CommonQueryManager configResourceManager;

    public UserBusiness getUserBusiness(long id)throws Exception {
        UserBusiness result=null;
        try{
            result=userBusinessMapper.selectByPrimaryKey(id);
        }catch(Exception e){
            JshException.readFail(logger, e);
        }
        return result;
    }

    public List<UserBusiness> getUserBusiness()throws Exception {
        UserBusinessExample example = new UserBusinessExample();
        example.createCriteria().andDeleteFlagNotEqualTo(BusinessConstants.DELETE_FLAG_DELETED);
        List<UserBusiness> list=null;
        try{
            list=userBusinessMapper.selectByExample(example);
        }catch(Exception e){
            JshException.readFail(logger, e);
        }
        return list;
    }

    @Transactional(value = "transactionManager", rollbackFor = Exception.class)
    public int insertUserBusiness(String beanJson, HttpServletRequest request) throws Exception {
        UserBusiness userBusiness = JSONObject.parseObject(beanJson, UserBusiness.class);
        int result=0;
        try{
            result=userBusinessMapper.insertSelective(userBusiness);
            logService.insertLog("关联关系", BusinessConstants.LOG_OPERATION_TYPE_ADD, request);
        }catch(Exception e){
            JshException.writeFail(logger, e);
        }
        return result;
    }

    @Transactional(value = "transactionManager", rollbackFor = Exception.class)
    public int updateUserBusiness(String beanJson, Long id, HttpServletRequest request) throws Exception {
        UserBusiness userBusiness = JSONObject.parseObject(beanJson, UserBusiness.class);
        userBusiness.setId(id);
        int result=0;
        try{
            result=userBusinessMapper.updateByPrimaryKeySelective(userBusiness);
            logService.insertLog("关联关系",
                    new StringBuffer(BusinessConstants.LOG_OPERATION_TYPE_EDIT).append(id).toString(), request);
        }catch(Exception e){
            JshException.writeFail(logger, e);
        }
        return result;
    }

    @Transactional(value = "transactionManager", rollbackFor = Exception.class)
    public int deleteUserBusiness(Long id, HttpServletRequest request)throws Exception {
        int result=0;
        try{
            result=userBusinessMapper.deleteByPrimaryKey(id);
            logService.insertLog("关联关系",
                    new StringBuffer(BusinessConstants.LOG_OPERATION_TYPE_DELETE).append(id).toString(), request);
        }catch(Exception e){
            JshException.writeFail(logger, e);
        }
        return result;
    }

    @Transactional(value = "transactionManager", rollbackFor = Exception.class)
    public int batchDeleteUserBusiness(String ids, HttpServletRequest request)throws Exception {
        List<Long> idList = StringUtil.strToLongList(ids);
        UserBusinessExample example = new UserBusinessExample();
        example.createCriteria().andIdIn(idList);
        int result=0;
        try{
            result=userBusinessMapper.deleteByExample(example);
            logService.insertLog("关联关系", "批量删除,id集:" + ids, request);
        }catch(Exception e){
            JshException.writeFail(logger, e);
        }
        return result;
    }

    public int checkIsNameExist(Long id, String name)throws Exception {
        return 1;
    }

    public List<UserBusiness> getBasicData(String keyId, String type)throws Exception{
        UserBusinessExample example = new UserBusinessExample();
        example.createCriteria().andKeyidEqualTo(keyId).andTypeEqualTo(type)
                .andDeleteFlagNotEqualTo(BusinessConstants.DELETE_FLAG_DELETED);
        List<UserBusiness> list=null;
        try{
            list= userBusinessMapper.selectByExample(example);
        }catch(Exception e){
            JshException.readFail(logger, e);
        }
        return list;
    }

    public Long checkIsValueExist(String type, String keyId)throws Exception {
        UserBusinessExample example = new UserBusinessExample();
        example.createCriteria().andTypeEqualTo(type).andKeyidEqualTo(keyId)
                .andDeleteFlagNotEqualTo(BusinessConstants.DELETE_FLAG_DELETED);
        List<UserBusiness> list=null;
        try{
            list= userBusinessMapper.selectByExample(example);
        }catch(Exception e){
            JshException.readFail(logger, e);
        }
        Long id = null;
        if(list!=null&&list.size() > 0) {
            id = list.get(0).getId();
        }
        return id;
    }

    public Boolean checkIsUserBusinessExist(String TypeVale, String KeyIdValue, String UBValue)throws Exception {
        UserBusinessExample example = new UserBusinessExample();
        String newVaule = "%" + UBValue + "%";
        if(TypeVale !=null && KeyIdValue !=null) {
            example.createCriteria().andTypeEqualTo(TypeVale).andKeyidEqualTo(KeyIdValue).andValueLike(newVaule)
                    .andDeleteFlagNotEqualTo(BusinessConstants.DELETE_FLAG_DELETED);
        } else {
            example.createCriteria().andValueLike(newVaule)
                    .andDeleteFlagNotEqualTo(BusinessConstants.DELETE_FLAG_DELETED);
        }
        List<UserBusiness> list=null;
        try{
            list=  userBusinessMapper.selectByExample(example);
        }catch(Exception e){
            JshException.readFail(logger, e);
        }
        if(list!=null&&list.size() > 0) {
            return true;
        } else {
            return false;
        }
    }

    @Transactional(value = "transactionManager", rollbackFor = Exception.class)
    public int updateBtnStr(Long userBusinessId, String btnStr) throws Exception{
        logService.insertLog("关联关系",
                new StringBuffer(BusinessConstants.LOG_OPERATION_TYPE_EDIT).append(userBusinessId).toString(),
                ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest());
        UserBusiness userBusiness = new UserBusiness();
        userBusiness.setBtnstr(btnStr);
        UserBusinessExample example = new UserBusinessExample();
        example.createCriteria().andIdEqualTo(userBusinessId);
        int result=0;
        try{
            result=  userBusinessMapper.updateByExampleSelective(userBusiness, example);
        }catch(Exception e){
            JshException.writeFail(logger, e);
        }
        return result;
    }

    public List<UserBusiness> findRoleByUserId(String userId)throws Exception{
        UserBusinessExample example = new UserBusinessExample();
        example.createCriteria().andKeyidEqualTo(userId).andTypeEqualTo("UserRole")
                .andDeleteFlagNotEqualTo(BusinessConstants.DELETE_FLAG_DELETED);
        List<UserBusiness> list=null;
        try{
            list=  userBusinessMapper.selectByExample(example);
        }catch(Exception e){
            JshException.readFail(logger, e);
        }
        return list;
    }

    public List<UserBusiness> findAppByRoles(String roles)throws Exception{
        List<String> rolesList = StringUtil.strToStringList(roles);
        UserBusinessExample example = new UserBusinessExample();
        example.createCriteria().andKeyidIn(rolesList).andTypeEqualTo("RoleAPP")
                .andDeleteFlagNotEqualTo(BusinessConstants.DELETE_FLAG_DELETED);
        List<UserBusiness> list=null;
        try{
            list=  userBusinessMapper.selectByExample(example);
        }catch(Exception e){
            JshException.readFail(logger, e);
        }
        return list;
    }

    @Transactional(value = "transactionManager", rollbackFor = Exception.class)
    public int batchDeleteUserBusinessByIds(String ids) throws Exception{
        logService.insertLog("关联关系",
                new StringBuffer(BusinessConstants.LOG_OPERATION_TYPE_DELETE).append(ids).toString(),
                ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest());
        User userInfo=userService.getCurrentUser();
        String [] idArray=ids.split(",");
        int result=0;
        try{
            result=  userBusinessMapperEx.batchDeleteUserBusinessByIds(new Date(),userInfo==null?null:userInfo.getId(),idArray);
        }catch(Exception e){
            JshException.writeFail(logger, e);
        }
        return result;
    }
}
