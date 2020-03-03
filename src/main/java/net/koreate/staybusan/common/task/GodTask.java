package net.koreate.staybusan.common.task;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.ServletContext;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import net.koreate.staybusan.common.dao.TaskDAO;


@Component
public class GodTask {
	
	@Inject
	TaskDAO dao;
	
	@Inject
	ServletContext context;
	// upload 폴더랑 db랑 비교해서 없는거 지우기?(fake폴더 - 다 지우기)?
	
		@Scheduled(cron="59 59 23 * * *")
		public void gogod() throws Exception{
		// u_type = 2 로 
		// rooms 에서 
		
		double score = 0;
		
		float uScore = 0;
		
		List<Integer> hostUno = dao.getHostUno();
		int hostCnt = hostUno.size();
		int buyCnt = 0;
		
		for(int i=0; i<hostCnt; i++) {	// 각 호스트별로
			buyCnt = 0;
			
			System.out.println("================다음 호스트 계산 =================");
			score = 0;
			int hostUnoi = hostUno.get(i);
			System.out.println("호스트 "+hostUnoi+"번의 방 : ");
			List<Integer> roomRno = dao.getRoomRno(hostUnoi);
			System.out.println(roomRno);
			double rscore=0;			// 각 방당 score
			int roomCnt = roomRno.size();
			int commentCnt = 0;
			int commentCntPlus = 0;
			
			for(int j=0; j<roomCnt; j++) {	// 각 호스트의 room별로
				
				int r_no = roomRno.get(j);
				double star = dao.getStar(r_no);
				double starCnt = dao.getStarCount(r_no);
				
				int buyCntPlus = dao.getBuyCount(r_no);
				
				buyCnt += buyCntPlus;
				
				
				rscore = star * starCnt;
				score += rscore;
				commentCntPlus = dao.getCommentCount(r_no);
				commentCnt += commentCntPlus;
				System.out.println("comment count : "+commentCnt);
				System.out.println("hostUnoi : "+hostUnoi+"- r_no : "+r_no+" : "+rscore);
				
			}
			if(commentCnt != 0) {
				System.out.println("score"+score+"  commentCnt"+commentCnt);
				uScore = (float) (score/commentCnt);
				System.out.println("uScore : "+uScore);
				if(uScore >= 4) {
					System.out.println("4.5 넘은 uScore : "+uScore);
					// buy이 10 이상이면 b_status 를 2로
					if(buyCnt >= 10) {
						// buy가 10건 이상인 u_no 는
						System.out.println("buyCnt 가 10건 이상인 hostUno : "+hostUnoi);
						dao.upgradeGrade(hostUnoi);
					}
					
				}
			}
			
			
			
		}
		
	}

}
