package com.hanky.invtry.message;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper = true)
public class RegisterResponse extends Response {
    public RegisterResponse() {
    }

    public RegisterResponse(String code,String msg){
        super(code,msg);
    }

}
