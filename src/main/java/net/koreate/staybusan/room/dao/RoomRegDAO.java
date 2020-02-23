package net.koreate.staybusan.room.dao;

import java.util.Date;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import net.koreate.staybusan.room.vo.RoomVO;

public interface RoomRegDAO {

	void regist(RoomVO vo);

	@Select("SELECT LAST_INSERT_ID()")
	int getR_no();
	
	@Insert("INSERT INTO amenity(r_no) VALUES(LAST_INSERT_ID())")
	void addAmenity();

	@Update("UPDATE amenity SET ${amenity}=1 WHERE r_no=LAST_INSERT_ID()")
	void amenityReg(String amenity);

	@Insert("INSERT INTO room_closed(r_no,closed_from,closed_to) VALUES(LAST_INSERT_ID(),#{closed_from},#{closed_to})")
	void banDateReg(@Param("closed_from") Date closed_from,@Param("closed_to") Date closed_to);

	@Insert("INSERT INTO room_img(r_no,u_no,r_i_fullName) VALUES(#{r_no},#{u_no},#{r_i_fullName})")
	void imgReg(@Param("u_no") int u_no, @Param("r_no") int r_no, @Param("r_i_fullName") String r_i_fullName);
}
