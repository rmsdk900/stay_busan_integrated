package net.koreate.staybusan.common.task;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import net.koreate.staybusan.common.dao.TaskDAO;
import net.koreate.staybusan.common.dto.MoneyDTO;
import net.koreate.staybusan.user.vo.UserVO;

@Component
public class RoomTask {
	
	@Inject
	TaskDAO dao;
	
	@Scheduled(cron="0 0 9 * * *")
//	@Scheduled(cron="0/20 * * * * *")
	public void roomTask() throws Exception{
		System.out.println("예약->지나간 바꾸는 Task");
		
		// 돈 넘겨주기... 
		List<Integer> buys = dao.getBuyNos();
//		System.out.println(buys);
		
		List<MoneyDTO> moneys = new ArrayList<>();
		for(int i : buys) {
			MoneyDTO money = dao.getMoney(i);
			moneys.add(money);
		}
//		System.out.println(moneys);
		
		for(MoneyDTO money : moneys) {
			dao.transfer(money);
			
//			UserVO u = dao.getResult(money.getM_u_h_no());
//			System.out.println(u);
		}
		
		// 상태 바꾸기.
		dao.getPastList();	//이름 바꾸기
		
		System.out.println("실행 완료?");
	}
}
