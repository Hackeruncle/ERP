package com.ruozedata.erp.datasource.mappers;

import com.ruozedata.erp.datasource.entities.Person;
import com.ruozedata.erp.datasource.entities.PersonExample;
import com.ruozedata.erp.datasource.entities.Person;
import org.apache.ibatis.annotations.Param;

import java.util.Date;
import java.util.List;

public interface PersonMapperEx {

    List<Person> selectByConditionPerson(
            @Param("name") String name,
            @Param("type") String type,
            @Param("offset") Integer offset,
            @Param("rows") Integer rows);

    Long countsByPerson(
            @Param("name") String name,
            @Param("type") String type);

    int batchDeletePersonByIds(@Param("updateTime") Date updateTime, @Param("updater") Long updater, @Param("ids") String ids[]);
}