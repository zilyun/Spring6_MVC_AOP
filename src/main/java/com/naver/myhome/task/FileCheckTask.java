package com.naver.myhome.task;

import java.io.File;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import com.naver.myhome.service.BoardService;

@Service
public class FileCheckTask {
	
	private static final Logger logger = LoggerFactory.getLogger(FileCheckTask.class);
	
	@Value("${my.savefolder}")
	private String saveFolder;
	
	private BoardService boardService;
	
	@Autowired
	public FileCheckTask(BoardService boardService) {
		this.boardService = boardService;
	}
	/*
	 * 스케줄러는주어진 시간에 작업을 실행하도록 예약하는 시스템 또는 소프트웨어입니다.
	 * 이는 주기적인 작업이나 일회성 작업을 자동으로 실행하게 해줍니다.
	 * 주로 운영 체제나 응용 프로그램에서 사용되며, 시스템 관리, 데이터베이스 유지 보수, 백업 등의 작업을 자동화하는데 유용합니다. 
	 * */
	// 스케줄러를 이용해서 주기적으로 매일, 매주, 매월 프로그램 실행을 위한 작업을 실시합니다.
	//@Scheduled(fixedDelay = 1000) // 밀리세컨드 단위를 사용하며 1초 마다 "test"라는 로그를 남깁니다.
	public void test() throws Exception {
		logger.info("test");
	}
	
	// "cron"은 유닉스 및 리눅스 시스템에서 주기적인 작업을 예약하기 위해 사용되는 시스템 스케쥴러입니다.
	// seconds(초:0~59) minutes(분:0~59) hours(시:0~23) day(일:1~31)
	// months(달:1~12) day of week(요일:0~6) year(optional)
	//					초 분 시 일 달 요일
	@Scheduled(cron="10 * * * * *")
	//@Scheduled(cron="* 10 * * * *")
	public void checkFiles() throws Exception {
		logger.info("checkFiles");
		List<String> deleteFileList = boardService.getDeleteFileList(); // 삭제할 파일 리스트
		
		//for(String filename : deleteFileList) {
		for(int i = 0; i < deleteFileList.size(); i++) {
			String filename = deleteFileList.get(i);
			File file = new File(saveFolder + filename);
			 if (file.exists()) { // 파일이 존재한다면 
				 if (file.delete()) { // 파일을 삭제
					logger.info(file.getPath() + " 삭제되었습니다.");
					boardService.deleteFileList(filename); // DB에서도 기록을 삭제 
				 }
			 } else {
				 logger.info(file.getPath() + " 파일이 존재하지 않습니다.");
			 }
		}
	}
}
