package com.ruozedata.erp.datasource.mappers;

import com.ruozedata.erp.datasource.entities.Supplier;
import com.ruozedata.erp.datasource.entities.SupplierExample;
import com.ruozedata.erp.datasource.entities.Supplier;
import org.apache.ibatis.annotations.Param;

import java.util.Date;
import java.util.List;

public interface SupplierMapperEx {

    List<Supplier> selectByConditionSupplier(
            @Param("supplier") String supplier,
            @Param("type") String type,
            @Param("phonenum") String phonenum,
            @Param("telephone") String telephone,
            @Param("description") String description,
            @Param("offset") Integer offset,
            @Param("rows") Integer rows);

    Long countsBySupplier(
            @Param("supplier") String supplier,
            @Param("type") String type,
            @Param("phonenum") String phonenum,
            @Param("telephone") String telephone,
            @Param("description") String description);

    List<Supplier> findByAll(
            @Param("supplier") String supplier,
            @Param("type") String type,
            @Param("phonenum") String phonenum,
            @Param("telephone") String telephone,
            @Param("description") String description);

    int batchDeleteSupplierByIds(@Param("updateTime") Date updateTime, @Param("updater") Long updater, @Param("ids") String ids[]);
}