package com.ruozedata.erp.controller;

import com.ruozedata.erp.datasource.entities.Msg;
import com.ruozedata.erp.service.msg.MsgService;
import com.ruozedata.erp.utils.BaseResponseInfo;
import com.ruozedata.erp.datasource.entities.Msg;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * @author ji sheng hua ERP
 */
@RestController
@RequestMapping(value = "/msg")
public class MsgController {
    private Logger logger = LoggerFactory.getLogger(MsgController.class);

    @Resource
    private MsgService msgService;

    @GetMapping("/getMsgByStatus")
    public BaseResponseInfo getMsgByStatus(@RequestParam("status") String status,
                                           HttpServletRequest request)throws Exception {
        BaseResponseInfo res = new BaseResponseInfo();
        try {
            List<Msg> list = msgService.getMsgByStatus(status);
            res.code = 200;
            res.data = list;
        } catch(Exception e){
            e.printStackTrace();
            res.code = 500;
            res.data = "获取数据失败";
        }
        return res;
    }

    @PostMapping("/batchUpdateStatus")
    public BaseResponseInfo batchUpdateStatus(@RequestParam("ids") String ids,
                                              @RequestParam("status") String status,
                                              HttpServletRequest request)throws Exception {
        BaseResponseInfo res = new BaseResponseInfo();
        try {
            msgService.batchUpdateStatus(ids, status);
            res.code = 200;
            res.data = "更新成功";
        } catch(Exception e){
            e.printStackTrace();
            res.code = 500;
            res.data = "获取数据失败";
        }
        return res;
    }
}
