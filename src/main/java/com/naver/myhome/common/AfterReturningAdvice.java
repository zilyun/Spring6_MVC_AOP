package com.naver.myhome.common;

import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.Aspect;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

//@Service
//@Aspect
public class AfterReturningAdvice {
	private static final Logger logger = LoggerFactory.getLogger(AfterReturningAdvice.class);
	
	// 타겟 메서드가 성공적으로 결과값을 반환 후에 어드바이스 기능을 수행 
	// reuturning="obj"에서 사용된 obj와 afterReturningLog(Object obj)의 매개변수 이름을 일치시켜야 합니다.
	//@AfterReturning(
	//		pointcut ="execution(* com.naver.myhome..*Impl.get*(..))",
	//		returning="obj")
	public void afterReturningLog(Object obj) {
		logger.info("============================================");
		logger.info("[AfterReturningAdvice] 비즈니스 로직 수행 후 동작입니다.");
		logger.info("[AfterReturningAdvice] obj : " + obj.toString());
		logger.info("============================================");
	}
}
