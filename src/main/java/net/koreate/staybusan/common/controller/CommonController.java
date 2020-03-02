package net.koreate.staybusan.common.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import net.koreate.staybusan.common.service.CommonService;
import net.koreate.staybusan.user.vo.UserVO;

@Controller
@RequestMapping("/common/*")
public class CommonController {
	
	@Inject
	CommonService cs;
	
	@RequestMapping("/about")
	public String about() {
		return "common/about";
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

}
