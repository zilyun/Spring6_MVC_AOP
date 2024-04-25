package com.naver.myhome.common;

import org.aspectj.lang.annotation.AfterThrowing;
import org.aspectj.lang.annotation.Aspect;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

//AfterThrowin (예외 발생 이후)
//타겟 메소드가 수행 중 예외를 던지게 되면 어드바이스 기능을 수행
@Service
@Aspect
public class AfterThrowingAdvice {
	private static final Logger logger = LoggerFactory.getLogger(AfterThrowingAdvice.class);
	// throwing = "exp"의 exp와 Throwable exp의 매개변수 이름을 일치시켜야 합니다.
	//@AfterThrowing(
	//		pointcut = "execution(* com.naver.myhome..*Impl.get*(..))",
	//		throwing = "exp")
	public void afterThrowingLog(Throwable exp) {
		logger.info("============================================");
		logger.info("[AfterThrowing] : 비즈니스 로직 수행 중 오류가 발생하면 동작입니다.");
		logger.info("ex : " + exp.toString());
		if (exp instanceof Exception) {
			logger.info("예외가 발생했습니다.");
		}
		logger.info("============================================");
	}
	
	//o.s.jdbc.support.JdbcTransactionManager : Initiating transaction rollback
	//o.s.jdbc.support.JdbcTransactionManager : Initiating transaction commit
	@AfterThrowing(
			pointcut = "execution(* com.naver.myhome..*Impl.boardReply(..))",
			throwing = "exp")
	public void afterThrowingLogTransaction(Throwable exp) {
		logger.info("===================loggin.level.root=debug=========================");
		logger.info("[AfterThrowing] : 비즈니스 로직 수행 중 오류가 발생하면 동작입니다.");
		logger.info("ex : " + exp.toString());
		if (exp instanceof Exception) {
			logger.info("예외가 발생했습니다.");
		}
		logger.info("===================================================================");
	}
	
}
