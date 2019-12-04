package com.future.shiroplus;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
@MapperScan("com.future.shiroplus.mapper")
public class ShiroPlusApplication {

	public static void main(String[] args) {
		SpringApplication.run(ShiroPlusApplication.class, args);
	}

}
