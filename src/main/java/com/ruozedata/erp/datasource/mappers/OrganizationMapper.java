package com.ruozedata.erp.datasource.mappers;

import com.ruozedata.erp.datasource.entities.Organization;
import com.ruozedata.erp.datasource.entities.OrganizationExample;
import java.util.List;

import com.ruozedata.erp.datasource.entities.Organization;
import com.ruozedata.erp.datasource.entities.OrganizationExample;
import org.apache.ibatis.annotations.Param;

public interface OrganizationMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table ruozedata_organization
     *
     * @mbggenerated
     */
    int countByExample(OrganizationExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table ruozedata_organization
     *
     * @mbggenerated
     */
    int deleteByExample(OrganizationExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table ruozedata_organization
     *
     * @mbggenerated
     */
    int deleteByPrimaryKey(Long id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table ruozedata_organization
     *
     * @mbggenerated
     */
    int insert(Organization record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table ruozedata_organization
     *
     * @mbggenerated
     */
    int insertSelective(Organization record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table ruozedata_organization
     *
     * @mbggenerated
     */
    List<Organization> selectByExample(OrganizationExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table ruozedata_organization
     *
     * @mbggenerated
     */
    Organization selectByPrimaryKey(Long id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table ruozedata_organization
     *
     * @mbggenerated
     */
    int updateByExampleSelective(@Param("record") Organization record, @Param("example") OrganizationExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table ruozedata_organization
     *
     * @mbggenerated
     */
    int updateByExample(@Param("record") Organization record, @Param("example") OrganizationExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table ruozedata_organization
     *
     * @mbggenerated
     */
    int updateByPrimaryKeySelective(Organization record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table ruozedata_organization
     *
     * @mbggenerated
     */
    int updateByPrimaryKey(Organization record);
}