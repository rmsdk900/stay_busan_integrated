package net.koreate.staybusan.room.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import net.koreate.staybusan.room.dao.RoomDetailDAO;
import net.koreate.staybusan.room.dao.RoomReservationDAO;
import net.koreate.staybusan.room.vo.BookRoomDTO;
import net.koreate.staybusan.room.vo.BuyVO;
import net.koreate.staybusan.room.vo.RoomImgVO;
import net.koreate.staybusan.room.vo.RoomVO;

@Service
public class RoomReservationServiceImpl implements RoomReservationService {
	
	@Inject
	RoomReservationDAO dao;
	
	@Inject
	RoomDetailDAO rdd;
	
	@Override
	public List<String> howMany(BuyVO vo) throws Exception {
		List<String> message = new ArrayList<>();
		
		List<String> bookingList = new ArrayList<>(); 
		makeDateList(bookingList, vo.getB_date_from(), vo.getB_date_to());
		System.out.println(bookingList);
		
		for(String date : bookingList) {
			
			RoomVO isFull = dao.canBook(vo.getR_no(), vo.getB_guest(), date);
			// 값이 있으면 예약 불가 
			if(isFull != null) {
				String msg = date+"에는 해당 인원으로 숙박이 불가능합니다.";
				message.add(msg);
				
			}else {
				String msg = date+"에는 해당 인원으로 숙박이 가능합니다.";
				message.add(msg);
			}
		}
		
		return message;
	}
	
	
	
	
	@Override
	public Integer checkPeople(BuyVO vo) throws Exception {
		Integer people = 0;
		
		// 하루하루 총 예약자 수를 구하고, 최댓값을 전달하자.
		
		List<String> peopleList = new ArrayList<>();
		makeDateList(peopleList, vo.getB_date_from(), vo.getB_date_to());
		System.out.println(peopleList);
		
		for(String date : peopleList) {
			Integer booked = dao.checkPeople(vo.getR_no(), date);
//			System.out.println("몇 명 예약? "+booked);
			if(booked != null) {
				if(people < booked) people = booked;
			}
		}
		
		System.out.println("해당 기간 중 최대 예약자 수 : "+people);
		return people;
	}
	
	@Transactional
	@Override
	public boolean bookingRoom(BuyVO vo) throws Exception {
		boolean isBooked = false;
		
		System.out.println("구매 정보 : "+vo);
		
		if(dao.bookingRoom(vo)) {
			Integer b_no = rdd.getLastB_no();
			System.out.println("마지막 구매 번호 : "+b_no);
			 Integer host = rdd.getRoomOwner(vo.getR_no()).getU_no();
			 System.out.println("그 방의 호스트 번호 : "+host);
			 if(host != null && b_no != null) {
				 // 돈 예치하기
				 dao.deposit(b_no, vo.getU_no(), host, vo.getB_total_price());
				 // 방 산 사람 돈 빼기
				 dao.pay(vo.getU_no(), vo.getB_total_price());
				 // 방 예약 건수 올리기
				 dao.updateBookedCnt(vo.getR_no());
			 }
			isBooked = true;
		}
		
		return isBooked;
	}

	@Override
	public String whoIsBooker(int u_no) throws Exception {
		return dao.whoIsBooker(u_no);
	}

	@Override
	public BookRoomDTO bookingRoomInfo(int r_no) throws Exception {
		return dao.bookingRoomInfo(r_no);
	}

	@Override
	public RoomImgVO bookingRoomImg(int r_no) throws Exception {
		return dao.bookingRoomImg(r_no);
	}

	// 달력 리스트 만드는 아주 유용한 놈.
	private void makeDateList(List<String> list, Date date_from, Date date_to) {
		
		final String DATE_PATTERN = "yyyy-MM-dd";
		SimpleDateFormat sdf = new SimpleDateFormat(DATE_PATTERN);
		
		Date currentDate = date_from;
		while(currentDate.compareTo(date_to)<=0){
			list.add(sdf.format(currentDate));
			Calendar c = Calendar.getInstance();
			c.setTime(currentDate);
			c.add(Calendar.DAY_OF_MONTH, 1);
			currentDate = c.getTime();
		}
		
	}
	
}
