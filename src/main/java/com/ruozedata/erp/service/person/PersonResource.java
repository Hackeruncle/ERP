package com.ruozedata.erp.service.person;

import com.ruozedata.erp.service.ResourceInfo;

import java.lang.annotation.*;

/**
 * @author
 */
@ResourceInfo(value = "person", type = 1574002402)
@Inherited
@Target(ElementType.TYPE)
@Retention(RetentionPolicy.RUNTIME)
public @interface PersonResource {
}
