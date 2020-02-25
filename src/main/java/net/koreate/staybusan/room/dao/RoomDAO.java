package net.koreate.staybusan.room.dao;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import net.koreate.staybusan.room.vo.BestRoomDTO;
import net.koreate.staybusan.room.vo.HomeListDTO;


public interface RoomDAO {

	@Select("SELECT r.r_gu, count(r_no) as r_count, round(avg(r.r_price)) as r_avgPrice, g.g_i_fullName \r\n" + 
			"			FROM rooms r \r\n" + 
			"			INNER JOIN gu_img g on r.r_gu = g.r_gu \r\n" + 
			"			WHERE r.r_gu=g.r_gu  \r\n" + 
			"			GROUP BY r.r_gu \r\n" + 
			"			ORDER BY r_no DESC limit 5")
	List<HomeListDTO> getHomeList();

	@Select("select r_no, count(*) as num from buy WHERE b_status=1 || b_status=2 group by r_no order by num DESC limit 3")
	List<BestRoomDTO> getBestList();
	
	
	
	
}
