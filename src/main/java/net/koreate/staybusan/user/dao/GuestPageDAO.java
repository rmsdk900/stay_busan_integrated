package net.koreate.staybusan.user.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import net.koreate.staybusan.room.vo.CommentVO;
import net.koreate.staybusan.user.vo.CommentDTO;
import net.koreate.staybusan.user.vo.GuestMyPageDTO;
import net.koreate.staybusan.user.vo.HistoryDTO;

public interface GuestPageDAO {

	@Select("SELECT b.b_no, b.u_no, b.b_status, b.r_no, r.r_name, i.r_i_fullName FROM buy b "
			+ "INNER JOIN rooms r on r.r_no = b.r_no "
			+ "INNER JOIN room_img i on i.r_no = b.r_no "
			+ "WHERE b.u_no = #{u_no} AND b.b_status = 0 group by b.b_no")
	List<GuestMyPageDTO> getLikeList(Integer u_no);
	
	@Select("SELECT b.b_no, b.u_no, b.b_status, b.r_no, r.r_name, i.r_i_fullName FROM buy b "
			+ "INNER JOIN rooms r on r.r_no = b.r_no "
			+ "INNER JOIN room_img i on i.r_no = b.r_no "
			+ "WHERE b.u_no = #{u_no} AND b.b_status = 1 group by b.b_no")
	List<GuestMyPageDTO> getBookedList(Integer u_no);

	@Select("SELECT b.b_no, b.u_no, b.b_status, b.r_no, r.r_name, i.r_i_fullName FROM buy b "
			+ "INNER JOIN rooms r on r.r_no = b.r_no "
			+ "INNER JOIN room_img i on i.r_no = b.r_no "
			+ "WHERE b.u_no = #{u_no} AND b.b_status = 2 group by b.b_no")
	List<GuestMyPageDTO> getPastList(Integer u_no);

	@Select("SELECT c.c_no, u.u_name, c.r_no, r.r_name, c.c_content, c.c_star, c.c_regdate "
			+ "FROM comment c "
			+ "INNER JOIN user u on c.u_no = u.u_no "
			+ "INNER JOIN rooms r on r.r_no = c.r_no "
			+ "WHERE c.u_no = #{u_no} "
			+ "group by c.c_no")
	List<CommentDTO> getCommentList(int u_no);

	@Select("SELECT b.*, r.r_name, i.r_i_fullName, r.r_checkin, r.r_checkout, r.r_deleted FROM buy b "
			+ "INNER JOIN room_img i on b.r_no = i.r_no "
			+ "INNER JOIN rooms r on r.r_no = b.r_no "
			+ "WHERE b.b_no = #{b_no} "
			+ "group by b.b_no")
	HistoryDTO getHistoryList(int b_no);

	@Update("UPDATE user SET u_balance = u_balance + (SELECT m_price FROM money WHERE b_no = #{b_no}) WHERE u_no = (SELECT u_no FROM buy WHERE b_no = #{b_no})")
	void userMoneyBack(int b_no);

	@Delete("DELETE FROM money WHERE b_no = #{b_no}")
	void moneyBack(int b_no);

	@Update("UPDATE rooms SET r_bookedcnt = r_bookedcnt -1 WHERE r_no = (SELECT r_no FROM buy WHERE b_no = #{b_no})")
	void minusBookedCnt(int b_no);
	
	@Delete("DELETE FROM buy WHERE b_no = #{b_no}")
	void cancelRoom(int b_no);

	@Select("SELECT * FROM comment WHERE b_no = #{b_no} limit 1")
	List<CommentDTO> getB_noComment(int b_no);

	@Insert("INSERT INTO comment(r_no, u_no, u_name, c_content, c_star, b_no) "
			+ "VALUES(#{r_no}, #{u_no}, #{u_name}, #{c_content}, #{c_star}, #{b_no}) ")
	void writeComment(CommentVO comment);

	@Update("UPDATE comment "
			+ "SET c_content=#{c_content}, c_star=#{c_star}, c_regdate=now() "
			+ "WHERE c_no = #{c_no}")
	void commentModify(CommentVO comment);

	@Delete("DELETE FROM comment WHERE c_no = #{c_no}")
	void commentDelete(int c_no);

	@Update("UPDATE rooms SET r_star = (SELECT avg(c_star) FROM comment WHERE r_no=#{r_no} AND c_dep=0) WHERE r_no = #{r_no}")
	void starUpdate(int r_no);


	
	
	
}
