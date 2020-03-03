package net.koreate.staybusan.common.task;

import javax.inject.Inject;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import net.koreate.staybusan.common.dao.TaskDAO;

@Component
public class RoomTask {
	
	@Inject
	TaskDAO dao;
	
	@Scheduled(cron="0 0 9 * * *")
	public void roomTask() throws Exception{
		System.out.println("예약->지나간 바꾸는 Task");
		
		dao.getPastList();	//이름 바꾸기
		System.out.println("실행 완료?");
	}
}
