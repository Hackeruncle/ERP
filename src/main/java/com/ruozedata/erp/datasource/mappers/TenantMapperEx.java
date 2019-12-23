package com.ruozedata.erp.datasource.mappers;

import com.ruozedata.erp.datasource.entities.Tenant;
import com.ruozedata.erp.datasource.entities.Tenant;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface TenantMapperEx {

    List<Tenant> selectByConditionTenant(
            @Param("loginName") String loginName,
            @Param("offset") Integer offset,
            @Param("rows") Integer rows);

    Long countsByTenant(
            @Param("loginName") String loginName);
}