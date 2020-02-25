package net.koreate.staybusan.room.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import net.koreate.staybusan.room.service.RoomDateService;
import net.koreate.staybusan.room.service.RoomReservationService;
import net.koreate.staybusan.room.vo.AvailableDateDTO;
import net.koreate.staybusan.room.vo.BookRoomDTO;
import net.koreate.staybusan.room.vo.BuyVO;
import net.koreate.staybusan.room.vo.RoomImgVO;

@Controller
@RequestMapping("/book/*")
public class RoomReservationController {
	
	@Inject
	RoomReservationService rrs;
	
	@Inject
	RoomDateService rbds;
	
	@GetMapping("/getAvailableDate/{r_no}")
	@ResponseBody
	public ResponseEntity<Map<String, Object>> getAvailableDate(
			@PathVariable("r_no") int r_no)throws Exception{
		System.out.println("디테일 날짜 가져오기!");
		ResponseEntity<Map<String, Object>> entity = null;
		
		Map<String, Object> map = new HashMap<>();
		
		try {
			AvailableDateDTO dto = rbds.getAvailableDate(r_no);
			List<String> list = rbds.getTestDate(r_no);
			map.put("availableDate", dto);
			map.put("closedDate", list);
			
//		System.out.println(dto);
			entity = new ResponseEntity<>(map, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	// 날짜 입력했을 때 숙박 가능 인원 뿌려주기
	@PostMapping("/checkPeople")
	@ResponseBody
	public ResponseEntity<Integer> checkPeople(
			@RequestBody BuyVO vo)throws Exception{
		ResponseEntity<Integer> entity = null;
		
		try {
			Integer bookedPeople = rrs.checkPeople(vo);
			System.out.println(bookedPeople);
			entity = new ResponseEntity<>(bookedPeople, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	// 인원 입력했을 때 불가하게 하기
	@PostMapping("/people")
	@ResponseBody
	public ResponseEntity<List<String>> howMany(
			@RequestBody BuyVO vo)throws Exception{
		ResponseEntity<List<String>> entity = null;
		
		System.out.println(vo);
		List<String> message = rrs.howMany(vo);
		
		
		
		
		return entity;
	}
	// 예약 화면으로!
	@PostMapping("bookingRoom")
	public String bookingRoom( 
			@ModelAttribute BuyVO vo,
			Model model) throws Exception{
		String convent_from = vo.getDate_from_dummy();
		String convent_to = vo.getDate_to_dummy();
		
		SimpleDateFormat convert = new SimpleDateFormat("yyyy-MM-dd");
		Date from = convert.parse(convent_from);
		Date to = convert.parse(convent_to);
		
		vo.setB_date_from(from);
		vo.setB_date_to(to);
		
//		System.out.println("예약 정보 : "+vo);
		// 마스터 맵
		Map<String, Object> map = new HashMap<>();
		
		// 구매자 이름 
		String u_name = rrs.whoIsBooker(vo.getU_no());
//		System.out.println("예약자 이름 : "+u_name);
		map.put("booker", u_name);
		// 예약 관련 방 정보 가져오기
		BookRoomDTO dto = rrs.bookingRoomInfo(vo.getR_no());
//		System.out.println("예약한 방 정보 : "+dto);
		map.put("room", dto);
		// 예약한 방 사진 가져오기
		RoomImgVO img = rrs.bookingRoomImg(vo.getR_no());
//		System.out.println("예약한 방의 첫번째 이미지 : "+img);
		map.put("roomImg", img);
		
		// 나머지 정보
		map.put("yeyag", vo);
		
		
		model.addAttribute("AllInfo", map);
		
		// 이부분 수정
//		if(rrs.bookingRoom(vo)) {
//			rttr.addFlashAttribute("message", "y");
//		}else {
//			rttr.addFlashAttribute("message", "n");
//		}
		
		return "room/reservation";
	}
	
	// 예약하기
	@PostMapping("bookingRoomSubmit")
	public String bookingRoomSubmit(HttpServletRequest req, @ModelAttribute BuyVO vo, RedirectAttributes rttr) throws Exception{
//		System.out.println("확인 : "+vo);
		
		String convent_from = vo.getDate_from_dummy();
		String convent_to = vo.getDate_to_dummy();
		
		SimpleDateFormat convert = new SimpleDateFormat("yyyy-MM-dd");
		Date from = convert.parse(convent_from);
		Date to = convert.parse(convent_to);
		
		vo.setB_date_from(from);
		vo.setB_date_to(to);
		
		System.out.println("찐 예약 정보 : "+vo);
		
		String msg = null;
		if(rrs.bookingRoom(vo)) {
			msg = "P"; 
		}else {
			msg ="F";
		}
		// 메시지 담고
		rttr.addFlashAttribute("msg", msg);
		
		return "redirect:/user/show?u_no="+vo.getU_no();
	}
	
	
}
