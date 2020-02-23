package net.koreate.staybusan.room.dao;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectProvider;

import net.koreate.staybusan.room.provider.RoomQueryProvider;
import net.koreate.staybusan.room.util.RoomSearchCri;
import net.koreate.staybusan.room.vo.RoomListDTO;
import net.koreate.staybusan.room.vo.RoomVO;

public interface ListDAO {

	@SelectProvider(type=RoomQueryProvider.class, method="listCriteriaSql")
	List<RoomListDTO> listCriteria(RoomSearchCri rcri);

	@SelectProvider(type=RoomQueryProvider.class, method="getSearchListCount")
	int searchListCount(RoomSearchCri rcri);
	
	

	@Select("SELECT avg(c_star) FROM comment WHERE r_no=#{r_no}")
	Float calcStar(int r_no);

	@Select("SELECT count(*) FROM comment WHERE r_no = #{r_no}")
	int commentNum(int rno);

	@Select("select r_i_fullName from room_img WHERE r_no = #{r_no} limit 1")
	String getImgs(int r_no) throws Exception;

	// 필요없음?
	@Select("select * from rooms where r_date_from <= #{date} && r_date_to >= #{date} && r_addr_main like '%#{g_area}%' ")	// closed 랑도 비교 해야함(날짜)-> 방 리스트에서 빼주기
	RoomVO getAvailableRoomListPerDate(@Param("date") String date, @Param("g_area")String g_area);
	//-> 열려있는 날과 체크인 체크아웃 설정이 겹치는 방들만 나옴 (날짜가 다 되는 방만)
	//-> 인원 비교

	
	// searchList
	@Select("SELECT r_no FROM rooms WHERE r_date_from <= #{g_date_from} && r_date_to >= #{g_date_to} && r_addr_main like CONCAT ('%', #{g_area}, '%')")
	List<Integer> getRoomOpenToCloseR_noList(@Param("g_date_from") Date g_date_from, @Param("g_date_to") Date g_date_to, @Param("g_area") String g_area);

	@Select("SELECT r_no FROM room_closed WHERE closed_from between #{g_date_from} and #{g_date_to} or closed_to between #{g_date_from} and #{g_date_to} GROUP BY r_no")
	List<Integer> getRoomClosedR_noList(@Param("g_date_from") Date g_date_from, @Param("g_date_to") Date g_date_to);

	@Select("SELECT r_guests FROM rooms WHERE r_no = #{r_no}")
	int getTotalGuests(Integer r_no);

	@Select("SELECT sum(b_guest) FROM buy WHERE r_no = #{r_no} and b_date_from <= #{dates} and b_date_to > #{dates} and b_status = 1")
	int getBookedGuestsPerDate(@Param("r_no") Integer r_no, @Param("dates") String dates);

	//searchList 최종 
	@SelectProvider(type=RoomQueryProvider.class, method="getSearchRoomListSql")
	List<RoomListDTO> getSearchRoomList(RoomSearchCri rcri);

	// 필요없음?
	@Select("SELECT * FROM rooms")
	List<RoomVO> getPositions();

	// 구별 리스트
	@Select("SELECT * FROM rooms WHERE r_gu = #{r_gu}")
	List<RoomListDTO> getGuLlist(String r_gu);

	// 구별 rno
	@Select("SELECT r_no FROM rooms WHERE r_gu = #{r_gu}")
	List<Integer> getGuRnoList(String r_gu);

	@Select("SELECT * FROM rooms r "
			+ "INNER JOIN amenity a on r.r_no = a.r_no "
			+ "INNER JOIN user u on r.u_no = u.u_no "
			+ "WHERE r.r_no = #{r_no}")
	RoomListDTO getRooms(int r_no);

	



}
