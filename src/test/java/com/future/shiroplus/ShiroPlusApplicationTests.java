package com.future.shiroplus;

import org.apache.shiro.crypto.hash.SimpleHash;
import org.apache.shiro.util.ByteSource;
import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
class ShiroPlusApplicationTests {

	@Test
	void contextLoads() {
	}
	public static void main(String[] args) {
		String username = "student";
		String password = "123456";
		// 将用户名作为盐值
		ByteSource salt = ByteSource.Util.bytes(username);
		String passwords = new SimpleHash("MD5", password, salt, 1024).toHex();
		System.out.println(passwords);
	}
}
