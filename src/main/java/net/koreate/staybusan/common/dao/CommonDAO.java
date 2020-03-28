package net.koreate.staybusan.common.dao;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

public interface CommonDAO {

	@Update("UPDATE user SET u_balance = u_balance + #{charging} WHERE u_no = #{u_no}")
	void charging(@Param("u_no") int u_no, @Param("charging") int charging);
	
	@Select("SELECT u_balance FROM user WHERE u_no=#{u_no}")
	int getBalance(int u_no)throws Exception;

	@Select("SELECT count(DISTINCT r_gu) FROM rooms")
	int guListCount() throws Exception;

}
