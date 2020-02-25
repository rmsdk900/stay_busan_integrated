package net.koreate.staybusan.user.controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.ServletContext;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import net.koreate.staybusan.common.util.FileUtils;
import net.koreate.staybusan.room.vo.MessageVO;
import net.koreate.staybusan.user.service.UserService;
import net.koreate.staybusan.user.vo.LoginDTO;
import net.koreate.staybusan.user.vo.UserVO;

@Controller
@RequestMapping("/user/*")
public class UserController {
	
	@Inject
	UserService us;
	
	@Inject
	ServletContext context;
	
	@RequestMapping("/join")
	public String join() {
		return "/user/join";
	}
	
	@RequestMapping("/login")
	public String login() {
		return "/user/login";
	}
	
	@RequestMapping("/uidCheck")
	@ResponseBody
	public ResponseEntity<Integer> uidCheck(@RequestBody UserVO vo) throws Exception {
		ResponseEntity<Integer> entity = null;
		System.out.println(vo);
		try {
			int result = us.uidCheck(vo.getU_id());
			entity = new ResponseEntity<>(result,HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		} 
		
		return entity;
	}
	
	@PostMapping("/joinPost")
	public String joinPost(UserVO vo, RedirectAttributes rttr) throws Exception{
		System.out.println(vo);
		us.signUp(vo);
		rttr.addFlashAttribute("message","회원가입 성공");
		return "redirect:/user/login";
	}
	
	@PostMapping("/loginPost")
	public ModelAndView loginPost(LoginDTO dto,ModelAndView mav) throws Exception{
		mav.addObject("loginDTO",dto);
		mav.setViewName("redirect:/");
		System.out.println("controller : "+mav.getModelMap().get("loginDTO"));
		return mav;
	}
	
	@GetMapping("/logOut")
	public String logOut(
			HttpSession session,
			HttpServletRequest request,
			HttpServletResponse response,
			@CookieValue(name="signInCookie", required=false) Cookie signInCookie
			) throws Exception{
		
		if(session.getAttribute("userInfo") != null) {
			session.removeAttribute("userInfo");
			
			if(signInCookie != null) {
				signInCookie.setPath("/");
				signInCookie.setMaxAge(0);
				response.addCookie(signInCookie);
			}
		}
		return "redirect:/";
	}	
	
	@PostMapping("/fakeUploadFile")
	public ResponseEntity<Object> fakeUploadFile(@RequestParam("file") MultipartFile[] file){
		ResponseEntity<Object> entity = null;
		
		System.out.println(file);
		
		for(MultipartFile files : file) {
			System.out.println("찐 이름 : "+files.getOriginalFilename());
		}
		try {
			FileUtils utils = FileUtils.getInstance(context);
			List<String> fileList = utils.fakeUploadProfile(file);
			entity = new ResponseEntity<>(fileList,HttpStatus.CREATED);
		} catch (IOException e) {
			e.printStackTrace();
			HttpHeaders header = new HttpHeaders();
			header.add("Content-Type", "text/plain;charset=utf-8");
			entity = new ResponseEntity<>(e.getMessage(),header,HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	// 이하 추가
		@GetMapping("/transform/{page}")
		public ResponseEntity<Map<String, Object>> transformList(@PathVariable("page") int page){
			ResponseEntity<Map<String, Object>> entity = null;
			
			try {
				Map<String, Object> map = us.getTransformUser(page);
				entity = new ResponseEntity<Map<String,Object>>(map,HttpStatus.OK);
			} catch (Exception e) {
				entity = new ResponseEntity<Map<String,Object>>(HttpStatus.BAD_REQUEST);
				e.printStackTrace();
			}
			return entity;
		}
		
		@GetMapping("/banPage/{page}")
		public ResponseEntity<Map<String, Object>> banPageList(@PathVariable("page") int page){
			ResponseEntity<Map<String, Object>> entity = null;
			
			try {
				Map<String, Object> map = us.getBanComments(page);
				entity = new ResponseEntity<Map<String,Object>>(map,HttpStatus.OK);
			} catch (Exception e) {
				entity = new ResponseEntity<Map<String,Object>>(HttpStatus.BAD_REQUEST);
				e.printStackTrace();
			}
			return entity;
		}
		
		@GetMapping("/adminMyPage")
		public String adminMyPage() throws Exception{
			return "user/adminMyPage";
		}
		
		@GetMapping("/messageBox")
		public String messageBox() throws Exception{
			return "user/messageBox";
		}
		
		@PostMapping("/transformUser")
		public ResponseEntity<String> transformUser(int u_no) throws Exception{
			ResponseEntity<String> entity = null;
			try {
				us.transformAsk(u_no);
				HttpHeaders header = new HttpHeaders();
				header.add("Content-Type", "text/plain;charset=utf-8");
				entity = new ResponseEntity<String>("전환 신청 성공! 관리자가 확인 후 전환해 줍니다.",header,HttpStatus.OK);
			} catch (Exception e) {
				e.printStackTrace();
				e.printStackTrace();
				entity = new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
			}
			return entity;
		}
		
		@PostMapping("/transform")
		@ResponseBody
		public ResponseEntity<String> transformPost(int u_no) throws Exception{
			ResponseEntity<String> entity = null;
			try {
				us.transformType(u_no);
				HttpHeaders header = new HttpHeaders();
				header.add("Content-Type", "text/plain;charset=utf-8");
				entity = new ResponseEntity<String>("전환 성공",header,HttpStatus.OK);
			} catch (Exception e) {
				e.printStackTrace();
				entity = new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
			}
			return entity;
		}
		
		@PostMapping("/banCommentCancel")
		@ResponseBody
		public ResponseEntity<String> banCommentCancel(int c_no){
			
			System.out.println(c_no);
			ResponseEntity<String> entity = null;
			
			try {
				us.banCommentCancel(c_no);
				HttpHeaders header = new HttpHeaders();
				header.add("Content-Type", "text/plain;charset=utf-8");
				entity = new ResponseEntity<String>("취소 성공",header,HttpStatus.OK);
			} catch (Exception e) {
				e.printStackTrace();
				entity = new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
			}
			return entity;
		}
		
		@PostMapping("/banCommentDelete")
		@ResponseBody
		public ResponseEntity<String> banCommentDelete(int c_no){
			
			ResponseEntity<String> entity = null;
			
			try {
				us.banCommentDelete(c_no);
				HttpHeaders header = new HttpHeaders();
				header.add("Content-Type", "text/plain;charset=utf-8");
				entity = new ResponseEntity<String>("삭제 성공",header,HttpStatus.OK);
			} catch (Exception e) {
				e.printStackTrace();
				entity = new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
				
			}
			return entity;
		}
		
		@PostMapping("/getMessageMain")
		@ResponseBody
		public ResponseEntity<List<MessageVO>> getMessage(int u_no){
			ResponseEntity<List<MessageVO>> entity = null;
			try {
				List<MessageVO> list = us.getMessageMain(u_no);
				System.out.println(list);
				entity = new ResponseEntity<List<MessageVO>>(list,HttpStatus.OK);
			} catch (Exception e) {
				e.printStackTrace();
				entity = new ResponseEntity<List<MessageVO>>(HttpStatus.BAD_REQUEST);
			}
			return entity;
		}
		
		@PostMapping("/getMessageDetail")
		@ResponseBody
		public ResponseEntity<MessageVO> getMessageDetail(int m_no){
			ResponseEntity<MessageVO> entity = null;
			try {
				MessageVO msg = us.getMessageDetail(m_no);
				entity = new ResponseEntity<MessageVO>(msg,HttpStatus.OK);
			} catch (Exception e) {
				e.printStackTrace();
				entity = new ResponseEntity<MessageVO>(HttpStatus.BAD_REQUEST);
			}
			return entity;
		}
		
		@GetMapping("/messageBox/{page}/{u_no}")
		public ResponseEntity<Map<String,Object>> getMessageBox(@PathVariable("u_no") int u_no, @PathVariable("page")int page){
			ResponseEntity<Map<String, Object>> entity = null;
			
			try {
				Map<String,Object> map = us.getMessageBox(u_no, page);
				entity = new ResponseEntity<Map<String,Object>>(map,HttpStatus.OK);
			} catch (Exception e) {
				entity = new ResponseEntity<Map<String,Object>>(HttpStatus.BAD_REQUEST);
				e.printStackTrace();
			}
			return entity;
		}
}
