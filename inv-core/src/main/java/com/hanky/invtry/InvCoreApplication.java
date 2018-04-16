package com.hanky.invtry;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
@MapperScan("com.hanky.invtry.repo.mapper")
public class InvCoreApplication {

	public static void main(String[] args) {
		SpringApplication.run(InvCoreApplication.class, args);
	}
}
