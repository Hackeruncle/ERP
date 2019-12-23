package com.ruozedata.erp.service.tenant;

import com.ruozedata.erp.service.ResourceInfo;

import java.lang.annotation.*;

/**
 * @author jishenghua qq752718920  2019-6-27 22:56:56
 */
@ResourceInfo(value = "tenant", type = 1574002444)
@Inherited
@Target(ElementType.TYPE)
@Retention(RetentionPolicy.RUNTIME)
public @interface TenantResource {
}
