package com.ruozedata.erp.service.user;

import com.ruozedata.erp.service.ResourceInfo;

import java.lang.annotation.*;

/**
 * @author
 */
@ResourceInfo(value = "user", type = 1574002461)
@Inherited
@Target(ElementType.TYPE)
@Retention(RetentionPolicy.RUNTIME)
public @interface UserResource {
}
