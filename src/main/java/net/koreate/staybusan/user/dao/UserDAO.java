package net.koreate.staybusan.user.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import net.koreate.mvc.common.util.Criteria;
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
	
}
