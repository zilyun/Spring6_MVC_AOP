package com.naver.myhome;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;

@EnableWebSecurity // Spring Security 활성화시켜 모든 요청이 스프링 시큐리티의 제어를 받도록 합니다.
@Configuration // 스프링 IOC Container에게 해당 클래스를 Bean 구성 Class 임을 알려주는 것입니다.
public class SecurityConfig { // POJO
	/*
	 * 개발자가 직접 제어가 불가능한 외부 라이브러리 등을 Bean으로 만들려할 때 사용됩니다.
	 * @Configuration 붙어 있는 클래스 안에서 사용합니다. 
	 * */
	@Bean
	public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
		
		http.csrf((csrf) -> csrf.disable());
		
		// 내가 만든 로그인 페이지로 이동합니다.
		http.formLogin((formLogin) -> formLogin.loginPage("/member/login"));
		
		return http.build();
	}
	
	/*
	 * 1. 스프링 시큐리티(Spring Security)란 자바 서버 개발을 위해 필요로 한 인증, 권한 부여 및 기타 보안 기능을 제공하는 
	 * 	  프레임워크(클래스와 인터페이스 모임)입니다. 
	 * 2. BCryptPasswordEncoder는 스프링 시큐리티(Spring Security) 프레임워크에서 제공하는 클래스 중 하나로 
	 * 	  BCrypt 해싱 함수(BCrypt hashing function)를 사용해서 비밀번호를 인코딩해주는 메서드와 
	 *    데이터 베이스에 저장된 비밀번호와 일치하는지를 알려주는 메서드를 가진 클래스입니다.
	 * 3. BCryptPasswordEncoder란 PasswordEncoder 인터페이스를 구현한 클래스입니다.
	 */
	@Bean
	public BCryptPasswordEncoder encodePassword() {
		return new BCryptPasswordEncoder();
	}
}
