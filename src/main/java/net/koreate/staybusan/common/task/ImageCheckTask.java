package net.koreate.staybusan.common.task;

import java.io.IOException;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;
import java.util.stream.Collectors;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.ResourceLoader;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import net.koreate.staybusan.room.dao.RoomImgDAO;
import net.koreate.staybusan.room.vo.RoomImgVO;

@Component
public class ImageCheckTask {
	
	@Inject
	RoomImgDAO roomImgDAO;
	
	@Inject
	ResourceLoader resourceLoader;
	
//	@Scheduled(cron="* * * * * *")
	public void checkRoomFiles(){
		System.out.println("없는 파일 삭제 로직 시작");
		
		// DB 파일 리스트 가져오기
		List<RoomImgVO> fileList = roomImgDAO.uploadedRoomFiles();
		
		// 경로 안에 있는 파일 체크 준비 (DB file 들과 함께)
		List<Path> fileListPaths = fileList.stream()
				.map(vo -> Paths.get(getUploadPath(), vo.getR_i_fullName()))
				.collect(Collectors.toList());
		
		fileListPaths.forEach(p->System.out.println(p.toString()));
		
		System.out.println("없는 파일 삭제 로직 종료");
	}
	
	// upload path 불러오기
	public String getUploadPath() {
		try {
			return resourceLoader.getResource("upload").getURI().getPath();
		} catch (IOException e) {
			e.printStackTrace();
			return null;
		}
	}
}
