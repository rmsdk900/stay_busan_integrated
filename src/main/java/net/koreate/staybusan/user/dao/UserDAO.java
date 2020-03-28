package net.koreate.staybusan.user.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import net.koreate.mvc.common.util.Criteria;
import net.koreate.staybusan.room.vo.MessageVO;
import net.koreate.staybusan.user.vo.FindPassVO;
import net.koreate.staybusan.user.vo.LoginDTO;
import net.koreate.staybusan.user.vo.UserVO;
import net.koreate.staybusan.user.vo.banCommentVO;

public interface UserDAO {

	@Insert("INSERT INTO user(u_id,u_pw,u_name,u_phone,u_type,u_introduce) "
			+ " VALUES(#{u_id},#{u_pw},#{u_name},#{u_phone},#{u_type},#{u_introduce})")
	void signUp(UserVO vo) throws Exception;

	@Select("SELECT COUNT(*) FROM user WHERE u_id = #{u_id}")
	int uidCheck(String u_id) throws Exception;

	@Select("SELECT * FROM user WHERE u_id = #{u_id} AND u_pw = #{u_pw}")
	UserVO signIn(LoginDTO dto) throws Exception;
	
	@Select("SELECT * from user WHERE u_id = #{u_id}")
	UserVO getUserById(String u_id) throws Exception;

	@Select("SELECT LAST_INSERT_ID()")
	int getLastInsert() throws Exception;

	@Update("UPDATE user SET u_profile = #{u_profile} WHERE u_no=#{u_no}")
	void updateProfile(@Param("u_no") int u_no,@Param("u_profile") String u_profile) throws Exception;

	// 이하 추가.
	@Update("UPDATE user SET u_type = 1 WHERE u_no=#{u_no}")
	void transformType(int u_no);

	@Select("SELECT count(*) FROM user WHERE u_type=9")
	int transformTotalCount();

	@Select("SELECT * FROM user WHERE u_type=9 ORDER BY u_no DESC limit #{cri.pageStart}, #{cri.perPageNum}")
	List<UserVO> getTranformUser(@Param("cri") Criteria cri) throws Exception;

	@Select("SELECT count(*) FROM ban_comment")
	int banCommentsTotalCount();
	
	@Select("SELECT B.c_no, B.b_c_reason, B.c_content, B.b_c_date, RU.u_name as b_reporter_name, BU.u_name as b_bad_person_name " + 
			"FROM ban_comment B " + 
			"INNER JOIN user RU " + 
			"ON B.b_c_reporter = RU.u_no " + 
			"INNER JOIN user BU " + 
			"ON B.b_c_bad_person = BU.u_no " + 
			"ORDER BY B.c_no DESC limit #{cri.pageStart}, #{cri.perPageNum}")
	List<banCommentVO> getBanComments(@Param("cri") Criteria cri);

	@Delete("DELETE FROM ban_comment WHERE c_no=#{c_no}")
	void banCommentDelete(int c_no);

	@Delete("DELETE FROM comment WHERE c_no=#{c_no}")
	void commentDelete(int c_no);

	@Update("UPDATE user SET u_type=9 WHERE u_no=#{u_no}")
	void transformAsk(int u_no);

	@Select("SELECT M.m_no, M.m_content, M.m_regdate, SU.u_name as m_sender_name, SU.u_profile as m_sender_profile, RO.r_name FROM message M INNER JOIN user RU ON M.m_receiver = RU.u_no INNER JOIN user SU ON M.m_sender = SU.u_no INNER JOIN rooms RO ON M.r_no = RO.r_no WHERE M.m_receiver = #{u_no} AND M.m_read=0 ORDER BY M.m_no DESC limit 0,5")
	List<MessageVO> getMessageMain(int u_no);

	@Select("SELECT M.m_content, M.m_sender, SU.u_name as m_sender_name, RO.r_name, RO.r_no FROM message M INNER JOIN user SU ON M.m_sender = SU.u_no INNER JOIN rooms RO ON M.r_no = RO.r_no WHERE m_no=#{m_no}")
	MessageVO getMessageDetail(int m_no);
	
	@Update("UPDATE message SET m_read=1 WHERE m_no=#{m_no}")
	void updateReadStatus(int m_no);

	@Select("SELECT count(*) FROM message WHERE m_receiver = #{u_no}")
	int getMessageBoxTotalCount(int u_no);

	@Select("SELECT M.m_no, M.m_content, M.m_read, SU.u_name as m_sender_name, SU.u_profile as m_sender_profile, M.m_regdate FROM message M INNER JOIN user SU ON M.m_sender=SU.u_no WHERE M.m_receiver = #{u_no} ORDER BY M.m_read ASC, M.m_no DESC limit #{cri.pageStart}, #{cri.perPageNum}")
	List<MessageVO> getMessageBox(@Param("u_no") int u_no,@Param("cri")  Criteria cri);

	// 20200226 추가.
	@Select("SELECT u_id FROM user WHERE u_name=#{u_name} AND u_phone=#{u_phone}")
	String findID(UserVO vo);

	@Select("SELECT * FROM user WHERE u_name=#{u_name} AND u_phone=#{u_phone} AND u_id=#{u_id}")
	UserVO findPass(UserVO vo);

	@Insert("INSERT INTO find_pw VALUES(#{u_id},#{fp_code})")
	void addCode(FindPassVO fpvo);

	@Select("SELECT * FROM find_pw WHERE u_id=#{u_id} AND fp_code=#{fp_code}")
	FindPassVO authCheck(FindPassVO vo);

	@Delete("DELETE FROM find_pw WhERE u_id=#{u_id}")
	void deleteCode(String u_id);

	@Update("UPDATE user SET u_pw=#{u_pw} WHERE u_id=#{u_id}")
	void updatePass(UserVO vo);

	@Update("UPDATE find_pw SET fp_code=#{fp_code} WHERE u_id=#{u_id}")
	void updateCode(FindPassVO fpvo);

	@Select("SELECT * FROM find_pw WHERE u_id=#{u_id}")
	FindPassVO codeCheck(String u_id);

	@Select("SELECT COUNT(*) FROM user WHERE u_phone = #{u_phone}")
	int phoneCheck(String u_phone);
	
}
