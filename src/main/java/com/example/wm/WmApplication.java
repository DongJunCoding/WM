package com.example.wm;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
@ComponentScan(basePackages = { "com.example.controller", "com.example.config", "com.example.model" } ) 
public class WmApplication {

	public static void main(String[] args) {
		SpringApplication.run(WmApplication.class, args);
	}

}
