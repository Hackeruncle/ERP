package com.ruozedata.erp.datasource.mappers;

import com.ruozedata.erp.datasource.entities.Functions;
import com.ruozedata.erp.datasource.entities.FunctionsExample;
import com.ruozedata.erp.datasource.entities.Functions;
import org.apache.ibatis.annotations.Param;

import java.util.Date;
import java.util.List;

public interface FunctionsMapperEx {

    List<Functions> selectByConditionFunctions(
            @Param("name") String name,
            @Param("type") String type,
            @Param("offset") Integer offset,
            @Param("rows") Integer rows);

    Long countsByFunctions(
            @Param("name") String name,
            @Param("type") String type);

    int batchDeleteFunctionsByIds(@Param("updateTime") Date updateTime, @Param("updater") Long updater, @Param("ids") String ids[]);
}