package net.koreate.staybusan.room.dao;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import net.koreate.staybusan.room.vo.BestRoomDTO;
import net.koreate.staybusan.room.vo.HomeListDTO;


public interface RoomDAO {

	@Select("SELECT g.r_gu, count(r.r_no) as r_count, round(avg(r.r_price)) as r_avgPrice, g.g_i_fullName FROM gu_img g left JOIN rooms r on g.r_gu = r.r_gu GROUP BY g.r_gu")
	List<HomeListDTO> getHomeList();

	@Select("select r_no, count(*) as num from buy WHERE b_status=1 || b_status=2 group by r_no order by num DESC limit 3")
	List<BestRoomDTO> getBestList();
	
	
	
	
}
