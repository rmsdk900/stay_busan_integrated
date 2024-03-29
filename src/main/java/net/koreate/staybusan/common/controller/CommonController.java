package net.koreate.staybusan.common.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import net.koreate.staybusan.common.service.CommonService;
import net.koreate.staybusan.user.vo.UserVO;

@Controller
@RequestMapping("/common/*")
public class CommonController {
	
	@Inject
	CommonService cs;
	
	@RequestMapping("/about")
	public String about() {
		return "/common/about";
	}
	
	@PostMapping("/charging")
	public String chargingPost(HttpServletRequest request, int u_no, int charging) throws Exception {
		int balance = cs.charging(u_no, charging);
		HttpSession session = request.getSession();
		
		UserVO vo = (UserVO)session.getAttribute("userInfo");
		vo.setU_balance(balance);
		session.setAttribute("userInfo", vo);
		
		return "redirect:/";
	}
	
	@PostMapping("/guList")
	@ResponseBody
	public ResponseEntity<Integer> guList(){
		ResponseEntity<Integer> entity = null;
		
		try {
			int guListCount = cs.guListCount();
			entity = new ResponseEntity<Integer>(guListCount,HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<Integer>(HttpStatus.BAD_REQUEST);
		}
		
		
		return entity;
		
	}

}
