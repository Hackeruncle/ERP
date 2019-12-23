package com.ruozedata.erp.datasource.mappers;

import com.ruozedata.erp.datasource.entities.Role;
import com.ruozedata.erp.datasource.entities.RoleExample;
import com.ruozedata.erp.datasource.entities.Role;
import org.apache.ibatis.annotations.Param;

import java.util.Date;
import java.util.List;

public interface RoleMapperEx {

    List<Role> selectByConditionRole(
            @Param("name") String name,
            @Param("offset") Integer offset,
            @Param("rows") Integer rows);

    Long countsByRole(
            @Param("name") String name);

    int batchDeleteRoleByIds(@Param("updateTime") Date updateTime, @Param("updater") Long updater, @Param("ids") String ids[]);
}