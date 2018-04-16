package com.hanky.invtry.message;

import lombok.Data;

import javax.xml.bind.annotation.XmlRootElement;

@Data
@XmlRootElement
public class User {
    private String name;
    private String password;
}
