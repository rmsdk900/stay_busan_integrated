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
import net.koreate.staybusan.common.util.EncryptHelper;
import net.koreate.staybusan.common.util.EncryptHelperImpl;
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
		// 로그인 시 입력받은 암호를 아이디 기준으로 받아온 UserVO의 암호랑 비교해서 맞을 경우 집어 넣음.
		String dtoId = dto.getU_id();
		if(dtoId.indexOf("sb.com") < 0) {
			String dtoPassword = dto.getU_pw();
			UserVO storedUser = dao.getUserById(dto.getU_id());
			if(storedUser != null) {
				String storedPassword = storedUser.getU_pw();
				
				EncryptHelper encrypt = new EncryptHelperImpl();
				boolean checkPassword = encrypt.isMatch(dtoPassword, storedPassword);
				if(checkPassword) {
					dto.setU_pw(storedPassword);
				}
			}
			
		}
		
		
		
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
			mav.addObject("message", "아이디와 비밀번호를 확인해 주세요.");
			mav.setViewName("/user/login");
		}		
	}
}
