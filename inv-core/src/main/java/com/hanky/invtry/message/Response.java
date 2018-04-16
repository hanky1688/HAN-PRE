package com.hanky.invtry.message;

import lombok.Data;

@Data
public abstract class Response {
    private String retCode;
    private String retMsg;

    public Response(String retCode, String retMsg) {
        this.retCode = retCode;
        this.retMsg = retMsg;
    }

    public Response() {
    }

    public void setResult(String retCode, String retMsg) {
        this.retCode = retCode;
        this.retMsg = retMsg;
    }
}
