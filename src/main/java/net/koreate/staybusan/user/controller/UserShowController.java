package net.koreate.staybusan.user.controller;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.ServletContext;

import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import net.koreate.staybusan.common.util.FileUtils;
import net.koreate.staybusan.room.vo.CommentVO;
import net.koreate.staybusan.user.service.GuestPageService;
import net.koreate.staybusan.user.service.UserShowService;
import net.koreate.staybusan.user.vo.CommentDTO;
import net.koreate.staybusan.user.vo.GuestMyPageDTO;
import net.koreate.staybusan.user.vo.HistoryDTO;
import net.koreate.staybusan.user.vo.ModIntroDTO;
import net.koreate.staybusan.user.vo.UserVO;

@Controller
@RequestMapping("/user/*")
public class UserShowController {
	
	@Inject
	UserShowService uss;
	
	@Inject
	GuestPageService gs;
	
	@Inject
	ServletContext context;
	
	// 마이페이지
	@GetMapping("show")
	public void showMyPage(int u_no, Model model) throws Exception{
		// 유저 공통 정보
		System.out.println("프로필 불러올 유저 번호 : "+u_no);
		Map<String, Object> myAllInfo = uss.getMyInfo(u_no);
		model.addAttribute("myAllInfo", myAllInfo);
		
		// 게스트 마이페이지 정보
		List<GuestMyPageDTO> likeList = gs.getLikeList(u_no);
		model.addAttribute("likeList", likeList);
		List<GuestMyPageDTO> bookedList = gs.getBookedList(u_no);
		model.addAttribute("bookedList", bookedList);
		List<GuestMyPageDTO> pastList = gs.getPastList(u_no);
		model.addAttribute("pastList", pastList);
		
		List<CommentDTO> comment = gs.getComment(u_no);
		model.addAttribute("comment", comment);
	}
	// 호스팅
	@GetMapping("hosting")
	public void showHosting(int u_no, Model model) throws Exception{
		System.out.println("방 관리 불러올 유저 번호 : "+u_no);
		
		Map<String, Object> myAllInfo = uss.getMyInfo(u_no);
		
		model.addAttribute("myAllInfo", myAllInfo);
	}
	
	
	// 유저 소개 수정
	@PostMapping("mod")
	@ResponseBody
	public ResponseEntity<String> modIntro(ModIntroDTO dto) throws Exception{
//		System.out.println(dto);
		
		ResponseEntity<String> entity = null;
		
		UserVO vo;
		try {
			vo = uss.modIntro(dto);
			System.out.println("변경 후 : "+vo);
			
			HttpHeaders header = new HttpHeaders();
			header.add("Content-Type", "text/plain;charset=UTF-8");
			
			entity = new ResponseEntity<>(vo.getU_introduce(), header, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	// 유저 프로필 수정
	@PostMapping("updateProfile/{u_no}")
	@ResponseBody
	public List<String> updateProfile(@PathVariable("u_no")int u_no,
			@RequestParam("file") MultipartFile[] files)throws Exception{
//		System.out.println("프로필 수정할 유저 : "+u_no);
//		System.out.println("업데이트할 파일 : "+files);
		
		// 파일 수정하기 - 원래 파일 삭제 후 업로드!
		// 원래 파일 삭제
		String originProfile = uss.getOriginProfile(u_no);
		System.out.println(originProfile);
		FileUtils.getInstance(context).removeProfile(originProfile);

		// 이제 새 파일 올리자.  
		String newProfile = null;
		newProfile = FileUtils.getInstance(context).updateProfile(u_no, files[0]);
		System.out.println("등록한 프로필 확인");
		System.out.println(newProfile);
//		
		// db 수정하기
		return uss.updateProfile(u_no, newProfile);
	
	}
	
	// 예약 목록 페이지 호출
	@GetMapping("bookedHistory")
	public void bookedHistory(int b_no, Model model) throws Exception{
		System.out.println("postHistory controller");
		System.out.println("b_no : "+b_no);
		HistoryDTO history = gs.getHistory(b_no);
		model.addAttribute("history", history);
		System.out.println(history);
	}
	
	// 지나간 목록 페이지 호출
	@GetMapping("pastHistory")
	public void pastHistory(
			int b_no, Model model) throws Exception{
		System.out.println("postHistory controller");
		System.out.println("b_no : "+b_no);
		HistoryDTO history = gs.getHistory(b_no);
		model.addAttribute("history", history);
		System.out.println(history);
		List<CommentDTO> comment = gs.getb_noComment(b_no);
		model.addAttribute("comment", comment);
	}
	// 예약 취소하기
	@GetMapping("cancelRoom")
	public String cancelRoom(
			int b_no
			) throws Exception{
		gs.cancelRoom(b_no);
		// money 에서 돈 정보 지우고, guest한테 돈 돌려주기
		return "/home";
	}
	
	// 후기 작성 
	@PostMapping("writeComment")
	public String writeComment(int b_no, CommentVO comment) throws Exception{
		gs.writeComment(comment);
		return "redirect:/user/pastHistory?b_no="+b_no;
	}
	// 후기 수정 화면 호출
	@GetMapping("commentModify")
	public String updateComment(CommentVO comment, Model model) {
		HistoryDTO history = gs.getHistory(comment.getB_no());
		model.addAttribute("history", history);
		List<CommentDTO> commentOri = gs.getb_noComment(comment.getB_no());
		System.out.println("오리"+commentOri);
		model.addAttribute("comment", commentOri);
		return "user/pastHistoryCommentUpdate";
	}
	
	// 후기 수정
	@PostMapping("commentModify")
	public String commentModify(CommentVO comment, Model model) throws Exception{
		System.out.println("commentModify 컨트롤러");
		System.out.println(comment);
		gs.commentModify(comment);
		
		return "redirect:/user/pastHistory?b_no="+comment.getB_no();
	}
	// 후기 삭제
	@GetMapping("commentDelete")
	public String commentDelete(CommentVO comment) throws Exception{
		gs.commentDelete(comment.getC_no(), comment.getR_no());
		return "redirect:/user/pastHistory?b_no="+comment.getB_no();
	}
	// 나아아아아중에 통합 시도해볼 것.
	@GetMapping("/displayFile")
	public ResponseEntity<byte[]> displayFile(
			String fileName) throws Exception{
		
		FileUtils utils = FileUtils.getInstance(context);
		
		return new ResponseEntity<byte[]>(utils.displayFile(fileName),utils.getHeader(fileName),HttpStatus.OK);
	}
	

}
