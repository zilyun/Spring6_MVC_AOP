package com.naver.myhome.common;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

//@Service
//@Aspect
public class AroundAdvice2 {
	private static final Logger logger = LoggerFactory.getLogger(AroundAdvice2.class);
	
	//@Around("execution(* com.naver.myhome..*Impl.get*(..))")
	public Object aroundLog(ProceedingJoinPoint proceeding) throws Throwable {
		logger.info("============================================");
		logger.info("[Around Advice의 before] 비즈니스 메서드 수행 전입니다.");
		logger.info("============================================");
		
		// 이 코드의 이전과 이후에 공통 기능을 위한 코드를 위치 시키면 됩니다.
		// 대상 객체의 메서드 public BoardVO get_whereid(int id)를 호출합니다.
		Object result = proceeding.proceed();
		
		logger.info("============================================");
		logger.info("[Around Advice의 after] 비즈니스 메서드 수행 후입니다.");
		logger.info("============================================");
		
		return result;
	}
}
