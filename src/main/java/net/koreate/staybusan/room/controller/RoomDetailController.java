package net.koreate.staybusan.room.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import net.koreate.staybusan.room.service.RoomDetailService;
import net.koreate.staybusan.room.vo.AmenityVO;
import net.koreate.staybusan.room.vo.BuyVO;
import net.koreate.staybusan.room.vo.ModifyRoomImgDTO;
import net.koreate.staybusan.room.vo.ModifyRoomPrimaryDTO;
import net.koreate.staybusan.room.vo.RoomVO;

@Controller
@RequestMapping("/room/*")
public class RoomDetailController {
	@Inject
	RoomDetailService rds;
	
	@GetMapping("detail")
	public String roomDetail(int r_no, Model model)throws Exception{
		System.out.println("방 상세 페이지 호출");
		System.out.println("가져올 방 번호 : "+r_no);
		
		Map<String, Object> roomInfo = rds.readRoom(r_no);
		
		model.addAttribute("roomInfo", roomInfo);
		
		return "room/detail";
	}
	
	@PostMapping("bookingRoom")
	public String bookingRoom( 
			@ModelAttribute BuyVO vo,
			RedirectAttributes rttr) throws Exception{
		String convent_from = vo.getDate_from_dummy();
		String convent_to = vo.getDate_to_dummy();
		
		SimpleDateFormat convert = new SimpleDateFormat("yyyy-MM-dd");
		Date from = convert.parse(convent_from);
		Date to = convert.parse(convent_to);
		
		vo.setB_date_from(from);
		vo.setB_date_to(to);
		
		System.out.println(vo);
		
		if(rds.bookingRoom(vo)) {
			rttr.addFlashAttribute("message", "y");
		}else {
			rttr.addFlashAttribute("message", "n");
		}
		
		return "redirect:/";
	}
	
	@PostMapping("/modify")
	@ResponseBody
	public RoomVO modifyRoomPrimary(ModifyRoomPrimaryDTO dto) throws Exception{
		System.out.println("입력받은 녀석 : "+dto);
		
		RoomVO vo = rds.modifyRoomPrimary(dto);
		System.out.println(vo);
		
		return vo;
	}
	
	@PostMapping("/amenities")
	@ResponseBody
	public AmenityVO modifyRoomAmenities(AmenityVO vo)throws Exception{
		
		AmenityVO result = rds.modifyRoomAmenities(vo);
		System.out.println("변경 결과 : "+result);
		
		return result;
	}
	
	@PostMapping("modRoomImgs")
	public String modifyRoomImgs(
			ModifyRoomImgDTO dto,
			RedirectAttributes rttr
			) throws Exception{
		System.out.println(dto);
		
		rds.modRoomImgs(dto);
		
		
		return "redirect:/room/detail?r_no="+dto.getR_no();
	}
	// 방 임시 삭제
	@PostMapping("/hide")
	@ResponseBody
	public RoomVO hideRoom(int r_no) throws Exception{
		System.out.println("받은 방 번호 :"+r_no);
		RoomVO vo = rds.hideRoom(r_no);
		System.out.println("변경 결과 : "+vo);
		
		return vo;
	}
	// 찜하기
	@PostMapping("/like")
	@ResponseBody
	public BuyVO likeRoom(int u_no, int r_no)throws Exception{
//		System.out.println("받은 유저 : "+u_no+" 받은 방 번호 : "+r_no);
		
		BuyVO vo = rds.likeRoom(u_no, r_no);
		System.out.println("찜 정보 : "+vo);
		return vo;
	}
	
	// 찜 취소하기
	@PostMapping("/dislike")
	@ResponseBody
	public String dislikeRoom(int u_no, int r_no)throws Exception{
//		System.out.println("받은 유저 : "+u_no+" 받은 방 번호 : "+r_no);
		
		String message = rds.dislikeRoom(u_no, r_no);
		
		return message;
	}
	// 찜 상태 받기
	@PostMapping("/isLike")
	@ResponseBody
	public String isLike(int u_no, int r_no)throws Exception{
		
		String message = rds.isLike(u_no, r_no);
		
		return message;
	}
	
	//테스트
	@GetMapping("transfer")
	public String transfer() {
		return "user/transfer";
	}
	
	
}
