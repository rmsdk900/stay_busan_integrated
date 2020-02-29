package net.koreate.staybusan.user.service;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.inject.Inject;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletContext;

import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import net.koreate.mvc.common.util.Criteria;
import net.koreate.mvc.common.util.PageMaker;
import net.koreate.staybusan.common.util.EncryptHelper;
import net.koreate.staybusan.common.util.EncryptHelperImpl;
import net.koreate.staybusan.common.util.FileUtils;
import net.koreate.staybusan.room.vo.MessageVO;
import net.koreate.staybusan.user.dao.UserDAO;
import net.koreate.staybusan.user.vo.FindPassVO;
import net.koreate.staybusan.user.vo.LoginDTO;
import net.koreate.staybusan.user.vo.UserVO;
import net.koreate.staybusan.user.vo.banCommentVO;

@Service
public class UserServiceImpl implements UserService{
	
	@Inject
	UserDAO dao;
	
	@Inject
	ServletContext context;
	
	@Inject
	JavaMailSender mailSender;

	@Override
	@Transactional
	public void signUp(UserVO vo) throws Exception {
		// 비밀번호 암호화 추가 / sb.com 제외
		if(vo.getU_id().indexOf("sb.com")<0) {
			System.out.println("입력받은 암호 : "+vo.getU_pw());
			EncryptHelper encrypt = new EncryptHelperImpl();
			
			String hashPassword = encrypt.encrypt(vo.getU_pw());
			vo.setU_pw(hashPassword);
			
			System.out.println("암호화한 암호 : "+vo.getU_pw());
		}
		
		
		dao.signUp(vo);
		
		int u_no = dao.getLastInsert();
		
		String fake_u_profile = vo.getU_profile();
		
		String profile = fake_u_profile.replace(File.separatorChar, '/');
		
		String[] profiles = profile.split("/");
		
		String upload_u_profile = profiles[profiles.length-1];
		
		FileUtils utils = FileUtils.getInstance(context);
		
		String u_profile = utils.uploadProfile(u_no,upload_u_profile);
		
		dao.updateProfile(u_no, u_profile);
	}

	@Override
	public int uidCheck(String u_id) throws Exception {
		return dao.uidCheck(u_id);
	}

	@Override
	public UserVO signIn(LoginDTO dto) throws Exception {
		return dao.signIn(dto);
	}

	@Override
	public UserVO getUserById(String u_id) throws Exception {
		return dao.getUserById(u_id);
	}
	
	// 이하 추가
	@Override
	public void transformType(int u_no) throws Exception {
		dao.transformType(u_no);
	}

	@Override
	public Map<String, Object> getTransformUser(int page) throws Exception {
		
		Criteria cri = new Criteria(page, 5);
		cri.setPage(page);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(dao.transformTotalCount());
		
		List<UserVO> list = dao.getTranformUser(cri);
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("list",list);
		map.put("pageMaker", pageMaker);
		
		return map;
	}

	@Override
	public Map<String, Object> getBanComments(int page) throws Exception {
		Criteria cri = new Criteria(page, 5);
		cri.setPage(page);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(dao.banCommentsTotalCount());
		
		List<banCommentVO> list = dao.getBanComments(cri);
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("banComments",list);
		map.put("pageMaker", pageMaker);
		
		return map;
	}

	@Override
	public void banCommentCancel(int c_no) throws Exception {
		dao.banCommentDelete(c_no);
	}

	@Transactional
	@Override
	public void banCommentDelete(int c_no) throws Exception {
		dao.banCommentDelete(c_no);
		dao.commentDelete(c_no);
	}

	@Override
	public void transformAsk(int u_no) throws Exception {
		dao.transformAsk(u_no);
	}

	@Override
	public List<MessageVO> getMessageMain(int u_no) throws Exception {
		return dao.getMessageMain(u_no);
	}

	@Transactional
	@Override
	public MessageVO getMessageDetail(int m_no) throws Exception {
		dao.updateReadStatus(m_no);
		return dao.getMessageDetail(m_no);
	}

	@Override
	public Map<String, Object> getMessageBox(int u_no, int page) throws Exception {
		Criteria cri = new Criteria(page, 10);
		cri.setPage(page);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(dao.getMessageBoxTotalCount(u_no));
		
		List<MessageVO> list = dao.getMessageBox(u_no, cri);
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("list",list);
		map.put("pageMaker", pageMaker);
		
		return map;
	}
	
	//20200226 추가
	@Override
	public Map<String, Object> findID(UserVO vo) throws Exception {
		
		boolean IDFindCheck = false;
		
		String ID = dao.findID(vo);
		
		if(ID != null && ID != "") {
			IDFindCheck = true;
		}
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("IDFindCheck", IDFindCheck);
		map.put("ID", ID);
		
		return map;
	}

	@Transactional
	@Override
	public Map<String, Object> findPass(UserVO vo) throws Exception {
		
		boolean passCheck =  false;
		
		UserVO passCheckResult = dao.findPass(vo);
		
		if(passCheckResult == null) {
			passCheck = false;
		}else {
			passCheck = true;
		}
		
		if(passCheck) {
			Random r = new Random();
			int dice = r.nextInt(4589362) + 49311;
			
			FindPassVO fpvo = new FindPassVO();
			fpvo.setFp_code(dice);
			fpvo.setU_id(vo.getU_id());;
			
			String setFrom = "dkee3@naver.com";
			String tomail = vo.getU_id();
			String title = "Stay-Busan 비밀번호 찾기용 인증번호메일입니다.";
			String content = "인증번호는 "+dice+"입니다.";
			
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
			
			messageHelper.setFrom(new InternetAddress(setFrom, "Stay-Busan"));
			messageHelper.setTo(tomail);
			messageHelper.setSubject(title);
			messageHelper.setText(content);
			
			mailSender.send(message);
			
			FindPassVO codeCheck = dao.codeCheck(fpvo.getU_id());
			
			if(codeCheck == null) {
				dao.addCode(fpvo);
			}else {
				fpvo.setFp_code(dice);
				dao.updateCode(fpvo);
			}
		}
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("passCheck", passCheck);
		
		return map;
	}

	@Override
	public Map<String, Object> authCheck(FindPassVO vo) throws Exception {
		boolean authCheck =  false;
		
		FindPassVO authCheckResult = dao.authCheck(vo);
		
		if(authCheckResult == null) {
			authCheck = false;
		}else {
			authCheck = true;
		}
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("passCheck", authCheck);
		
		return map;
	}

	@Override
	public void deleteCode(String u_id) throws Exception {
		dao.deleteCode(u_id);
	}

	@Override
	public void updatePass(UserVO vo) throws Exception {
		// 비밀번호 암호화 추가 / sb.com 제외
		if(vo.getU_id().indexOf("sb.com")<0) {
			System.out.println("입력받은 암호 : "+vo.getU_pw());
			EncryptHelper encrypt = new EncryptHelperImpl();
			
			String hashPassword = encrypt.encrypt(vo.getU_pw());
			vo.setU_pw(hashPassword);
			
			System.out.println("암호화한 암호 : "+vo.getU_pw());
		}
		
		dao.updatePass(vo);
	}
	
}

