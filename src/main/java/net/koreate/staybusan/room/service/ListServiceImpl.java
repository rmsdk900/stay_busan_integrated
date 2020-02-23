package net.koreate.staybusan.room.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import net.koreate.staybusan.room.dao.ListDAO;
import net.koreate.staybusan.room.util.PageMaker;
import net.koreate.staybusan.room.util.RoomSearchCri;
import net.koreate.staybusan.room.vo.RoomListDTO;

@Service
public class ListServiceImpl implements ListService{
	
	@Inject
	ListDAO ldao;
	
	List<RoomListDTO> list = new ArrayList<>();
	
	int guRnoListCnt = 0;
	
	
	@Override
	public List<RoomListDTO> listCriteria(RoomSearchCri rcri) throws Exception {
		System.out.println("listCriteria 서비스");
		list.clear();
		
		List<RoomListDTO> listedSortedCondition= ldao.getSearchRoomList(rcri);
		if(rcri.getG_area() != null && rcri.getG_area() != "" ) {
			System.out.println("검색 실행 ");
			String g_area;
			g_area = rcri.getG_area();
			int g_guests = rcri.getG_guests();	// 더해줘야 함
			
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			
			Date g_date_from = sdf.parse(rcri.getStartDate());
			Date g_date_to = sdf.parse(rcri.getEndDate());
			
			List<String> dateList = new ArrayList<>();
			makeDateList(dateList, g_date_from, g_date_to);
			
			List<Integer> roomOpenToCloseR_noList = ldao.getRoomOpenToCloseR_noList(g_date_from, g_date_to, g_area);	// 체크인 체크아웃에 열려있는 방 리스트
			
			List<Integer> roomClosedR_noList =ldao.getRoomClosedR_noList(g_date_from, g_date_to);	// 그 날짜에 닫혀있는 r_no

			for(int i=0; i<roomOpenToCloseR_noList.size(); i++) {
				Integer r_no = roomOpenToCloseR_noList.get(i);
				for(int j=0; j<roomClosedR_noList.size(); j++) {
					Integer r_noClo = roomClosedR_noList.get(j);
					if(r_no == r_noClo) {
						roomOpenToCloseR_noList.remove(r_no);	// 날짜별로 고른 r_no
					}
				}
			}
			
			for(int i=0; i<roomOpenToCloseR_noList.size();i++) {
				Integer r_no = roomOpenToCloseR_noList.get(i);
				int totalGuests = ldao.getTotalGuests(r_no);
				for(String dates : dateList) {
					int bookedGuestsPerDate;
					try {
						bookedGuestsPerDate = ldao.getBookedGuestsPerDate(r_no, dates);
					} catch (Exception e) {
						bookedGuestsPerDate = 0;
					}
					if(totalGuests - bookedGuestsPerDate -g_guests <= 0) {	// 최종 r_no 골라내는
						roomOpenToCloseR_noList.remove(r_no);
					}
				}
			}
			for(int i=0; i<listedSortedCondition.size(); i++) {
				int realR_no = listedSortedCondition.get(i).getR_no();
				for(Integer r_no : roomOpenToCloseR_noList) {
					if(realR_no == r_no) {
						list.add(listedSortedCondition.get(i));
					}
				}
			}
			
			
		}else if(rcri.getR_gu() != null && rcri.getR_gu() != "" ) {
			// 구별 검색
			String r_gu = rcri.getR_gu();
			List<Integer> guRnoList = ldao.getGuRnoList(r_gu);
			
			List<RoomListDTO> guRnoListDTO = new ArrayList();
			
			
			//???? 수정필요?
			guRnoListCnt = guRnoList.size();
			for(int i=0; i<listedSortedCondition.size(); i++) {
				int realR_no = listedSortedCondition.get(i).getR_no();
				for(Integer r_no : guRnoList) {
					if(realR_no == r_no) {
						list.add(listedSortedCondition.get(i));
					}
				}
			}
			
		}else {
//			 전체리스트?
			System.out.println("dao.listCriteria 로 보내자");
			list = ldao.listCriteria(rcri);
			
		}
		System.out.println("list 145번줄"+list);
		for(int i=0;i<list.size();i++) {
			// 별점, 코멘트, 이미지
			int rno = list.get(i).getR_no();
			System.out.println("NPE rno"+rno);
			int commentNum = 0;
			Float star = ldao.calcStar(rno);
			String roomImg = ldao.getImgs(rno);
			if(star == null) {
				star = 0.0f;
			}else {
				commentNum = ldao.commentNum(rno);
			}
			list.get(i).setC_star(star);
			list.get(i).setCommentNum(commentNum);
			list.get(i).setR_i_fullName(roomImg);
		}
		System.out.println("listCriteria 서비스 끝: " +list);
		
		return list;
		
	}

	@Override
	public PageMaker getPageMaker(RoomSearchCri rcri) {
		int totalCount = ldao.searchListCount(rcri);
		if(rcri.getR_gu() != null && rcri.getR_gu() != "" ) {
			totalCount = guRnoListCnt;
		}
		PageMaker pm = new PageMaker();
		pm.setCri(rcri);
		pm.setTotalCount(totalCount);
		return pm;
	}

	@Override
	public List<RoomListDTO> getPositions(RoomSearchCri rcri) {
		System.out.println("getPositions 서비스");
		List<RoomListDTO> mapList = new ArrayList<>();
		mapList = list;
		System.out.println(mapList);
		return mapList;
	}
	
	
	// 시작날짜, 끝날짜 넣으면 하루하루 list에 넣어줌
	private void makeDateList(List<String> list, Date date_from, Date date_to) {
		
		final String DATE_PATTERN = "yyyy-MM-dd";
		SimpleDateFormat sdf = new SimpleDateFormat(DATE_PATTERN);
		
		Date currentDate = date_from;
		while(currentDate.compareTo(date_to)<=0) {
			list.add(sdf.format(currentDate));
			Calendar c = Calendar.getInstance();
			c.setTime(currentDate);
			c.add(Calendar.DAY_OF_MONTH, 1);
			currentDate = c.getTime();
		}
	}

	@Override
	public List<RoomListDTO> infiniteScrollDown(Integer roomToEnd) {
		System.out.println("스크롤 서비스");
		System.out.println("roomToEnd : "+roomToEnd);
		List<RoomListDTO> nextRooms = new ArrayList<>();

		for(int i=0; i<list.size()-4;i++) {
			Integer containedRno = list.get(i).getR_no();
			System.out.println("containedRno : "+containedRno);
			if(roomToEnd == containedRno) {
				System.out.println("roomToEnd, containedRno 같을때");
				for(int j=1; j<=5; j++) {
					if(i+j>list.size()+1) {
						System.out.println("마지막인가요?");
						break;
					}
					nextRooms.add(list.get(i+j-1));
					
				}
			}
		}
		System.out.println("nextRooms : "+nextRooms);
		list = nextRooms;
		return list;
	}


}
