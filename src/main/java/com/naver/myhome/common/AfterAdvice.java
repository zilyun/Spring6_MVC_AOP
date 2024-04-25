package com.naver.myhome.common;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.Aspect;
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
public class AfterAdvice {
	
	private static final Logger logger = LoggerFactory.getLogger(AfterAdvice.class);
	
	/*
	 1. "execution(* com.naver.myhome..*Impl.get*(..))" 는 포인트 컷을 표현하는 부분입니다.
	 	com.naver.myhome 패키지로 시작하는 클래스 중에서 Impl로 끝나는 클래스의 
	 	get으로 시작하는 모든 메서드만 pointcut으로 설정합니다.
	 2. @After는 동작 시점을 의미합니다. pointcut으로 정한 메서드 실행 후 동작하도록 합니다.
	 */
	//@After("execution(* com.naver.myhome..*Impl.get*(..))")
	public void afterLog(JoinPoint proceeding) {
		logger.info("====================================");
		logger.info("[AfterAdvice]:" + proceeding.getTarget().getClass().getName() + "의 "
				+ proceeding.getSignature().getName() + "() 호출 후 입니다.");
		logger.info("[AfterAdvice]: 비즈니스 로직 수행 후 동작입니다.");
		logger.info("====================================");
	}
	
}
