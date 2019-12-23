package com.ruozedata.erp.datasource.mappers;

import com.ruozedata.erp.datasource.entities.MaterialProperty;
import com.ruozedata.erp.datasource.entities.MaterialPropertyExample;
import com.ruozedata.erp.datasource.entities.MaterialProperty;
import org.apache.ibatis.annotations.Param;

import java.util.Date;
import java.util.List;

public interface MaterialPropertyMapperEx {

    List<MaterialProperty> selectByConditionMaterialProperty(
            @Param("name") String name,
            @Param("offset") Integer offset,
            @Param("rows") Integer rows);

    Long countsByMaterialProperty(@Param("name") String name);

    int batchDeleteMaterialPropertyByIds(@Param("updateTime") Date updateTime, @Param("updater") Long updater, @Param("ids") String ids[]);
}