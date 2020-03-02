package net.koreate.staybusan.common.task;

import java.io.IOException;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;
import java.util.stream.Collectors;

import javax.inject.Inject;
import javax.servlet.ServletContext;

import org.springframework.stereotype.Component;

import net.koreate.staybusan.room.dao.RoomImgDAO;
import net.koreate.staybusan.room.vo.RoomImgVO;

@Component
public class ImageCheckTask {
	
	@Inject
	RoomImgDAO roomImgDAO;
	
	@Inject
	ServletContext context;
	
//	@Scheduled(cron="* * * * * *")
	public void checkRoomFiles(){
		System.out.println("없는 파일 삭제 로직 시작");
		
		// DB 파일 리스트 가져오기
		List<RoomImgVO> fileList = roomImgDAO.uploadedRoomFiles();
		System.out.println("DB 파일들 : ");
		
		System.out.println("없는 파일 삭제 로직 종료");
	}
	
	
}
