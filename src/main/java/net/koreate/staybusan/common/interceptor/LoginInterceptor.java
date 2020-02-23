package net.koreate.staybusan.common.interceptor;

import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.ui.ModelMap;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import net.koreate.staybusan.common.session.MySessionEventListener;
import net.koreate.staybusan.user.dao.UserDAO;
import net.koreate.staybusan.user.service.UserService;
import net.koreate.staybusan.user.vo.LoginDTO;
import net.koreate.staybusan.user.vo.UserVO;

public class LoginInterceptor extends HandlerInterceptorAdapter{
	
	@Inject
	UserService us;
	
	@Inject
	UserDAO dao;
	
	@Inject
	MySessionEventListener listener;

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession();
		if(session.getAttribute("userInfo") != null) {
			session.removeAttribute("userInfo");
		}
		return true;
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView mav) throws Exception {	
		ModelMap modelObj = mav.getModelMap();
		
		LoginDTO dto = (LoginDTO)modelObj.get("loginDTO");
		
		System.out.println("LoginInterceptor postHAndle : " +dto);
		
		UserVO userInfo = us.signIn(dto);
		
		
		HttpSession session = request.getSession();
		if(userInfo != null) {
			
			boolean result = listener.exireDuplicatedSession(dto.getU_id(), session.getId());
			
			session.setAttribute("userInfo", userInfo);
			System.out.println("session : "+session.getAttribute("userInfo"));
			
			if(result) {
				System.out.println("중복 제거");
			}else {
				System.out.println("첫 로그인");
			}
			
			if(dto.isU_cookie()) {
				Cookie cookie = new Cookie("signInCookie", userInfo.getU_id());
				cookie.setPath("/");
				cookie.setMaxAge(60*60*24*15);
				response.addCookie(cookie);
			}
		}else {
			mav.setViewName("/user/login");
		}		
	}
}
