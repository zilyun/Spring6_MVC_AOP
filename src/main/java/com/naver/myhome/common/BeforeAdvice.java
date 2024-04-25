package com.naver.myhome.common;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

/*
 * Advice : 횡단 관심에 해당하는 공통 기능의 의미하며 독립된 클래스의 메서드로 작성됩니다.
 * Advice 클래스는 @Service annotation을 사용합니다.
 * @Aspect가 설정된 클래스에는 Pointcut과 Advice를 결합하는 설정이 있어야 합니다.
 */
//@Service
//@Aspect
public class BeforeAdvice {
	
	private static final Logger logger = LoggerFactory.getLogger(BeforeAdvice.class);
	//Advice : 공통으로 처리할 로직을 beforeLog()메서드로 구현합니다.
	//@Before("execution(* com.naver.myhome..*Impl.get*(..))")
	public void afterLog(JoinPoint proceeding) {
		logger.info("====================================");
		logger.info("[BeforeAdvice]:" + proceeding.getTarget().getClass().getName() + "의 "
				+ proceeding.getSignature().getName() + "() 호출 후 입니다.");
		logger.info("[BeforeAdvice]: 비즈니스 로직 수행 전 동작입니다.");
		logger.info("====================================");
	}
	
}
