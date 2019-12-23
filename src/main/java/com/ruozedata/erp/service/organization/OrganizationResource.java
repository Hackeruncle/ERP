package com.ruozedata.erp.service.organization;

import com.ruozedata.erp.service.ResourceInfo;

import java.lang.annotation.*;

/**
 * Description
 *  机构
 * @Author: cjl
 * @Date: 2019/3/6 15:10
 */
@ResourceInfo(value = "organization", type = 1574002387)
@Inherited
@Target(ElementType.TYPE)
@Retention(RetentionPolicy.RUNTIME)
public @interface OrganizationResource {
}
