package com.ruozedata.erp.exception;

import lombok.Getter;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Getter
public class BusinessRunTimeException extends RuntimeException {

    private static final long serialVersionUID = 1L;
    private int code;

    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public String getReason() {
        return reason;
    }

    public void setReason(String reason) {
        this.reason = reason;
    }

    private String reason;

    public BusinessRunTimeException(int code, String reason) {
        super(reason);
        this.code = code;
        this.reason = reason;
    }

    public BusinessRunTimeException(int code, String reason, Throwable throwable) {
        super(reason, throwable);
        this.code = code;
        this.reason = reason;
    }
}
