package net.koreate.staybusan.common.task;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.ServletContext;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import net.koreate.staybusan.common.dao.TaskDAO;
import net.koreate.staybusan.common.util.FileUtils;
import net.koreate.staybusan.room.dao.RoomImgDAO;
import net.koreate.staybusan.room.vo.RoomImgVO;

@Component
public class ImageCheckTask {
	
	@Inject
	RoomImgDAO roomImgDAO;
	
	@Inject
	TaskDAO dao;
	
	@Inject
	ServletContext context;
	
	@Scheduled(cron="0/10 * * * * *")
	public void checkRoomFiles(){
		System.out.println("없는 방 이미지 삭제 로직 시작");
		
		// DB 파일 리스트 가져오기
		List<RoomImgVO> fileList = roomImgDAO.uploadedRoomFiles();
		System.out.println("DB 파일들 : "+fileList);
		
		// FileUtils에서 처리해보자
		FileUtils.getInstance(context).removeRoomImgs(fileList);
		
		System.out.println("없는 방 이미지 삭제 로직 종료");
	}
	
	@Scheduled(cron="0/20 * * * * *")
	public void checkUserImgs() {
		System.out.println("없는 유저 프로필 삭제 로직 시작");
		
		// DB 유저 프로필 리스트 가져오기
		List<String> userList = dao.existedUserProfiles();
		System.out.println("DB 프로필들 : "+userList);
		
		// FileUtils에서 처리
		FileUtils.getInstance(context).removeUserProfiles(userList);
		
		System.out.println("없는 유저 프로필 삭제 로직 종료");
	}
	
	@Scheduled(cron="0/30 * * * * *")
	public void removeFakeFolder() {
		System.out.println("큰 fake 폴더 삭제 시작");
		
		// FileUtils에서 처리
		FileUtils.getInstance(context).removeFakeFolder();
		
		System.out.println("큰 fake 폴더 삭제 종료");
	}
	
}
