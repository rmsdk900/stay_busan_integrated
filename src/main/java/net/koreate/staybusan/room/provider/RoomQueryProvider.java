package net.koreate.staybusan.room.provider;

import javax.inject.Inject;

import org.apache.ibatis.jdbc.SQL;

import net.koreate.staybusan.room.dao.ListDAO;
import net.koreate.staybusan.room.util.RoomSearchCri;


public class RoomQueryProvider {
	@Inject
	ListDAO ldao;
	
	public String listCriteriaSql(RoomSearchCri rcri) {
		
		
		SQL sql = new SQL() {
			{
				SELECT ("*");
				SELECT ("r_star*r_bookedcnt as popul");
				FROM("rooms r");
				
				INNER_JOIN("amenity a on r.r_no = a.r_no");
				
				INNER_JOIN("user u on r.u_no = u.u_no");
				
				getOtherQuery(rcri, this);
				
				
//				LIMIT(rcri.getPageStart()+","+rcri.getPerPageNum());
			}
		};
		String query = sql.toString();
		System.out.println(query);
		return query;
	} 
	
	
	
	
	public String getSearchRoomListSql(RoomSearchCri rcri) {
		System.out.println("getSearchRoomListSql 생성시작");
		
		SQL sql = new SQL() {
			{
				SELECT ("*");
				SELECT ("r_star*r_bookedcnt as popul");
				FROM ("rooms r");
				
				INNER_JOIN("amenity a on r.r_no = a.r_no ");
				
				INNER_JOIN("user u on r.u_no = u.u_no");
				
				getOtherQuery(rcri, this);
				
//				LIMIT(rcri.getPageStart()+","+rcri.getPerPageNum());
				
			}
		};
		String query = sql.toString();
		System.out.println(query);
		return query;
	}
	
		
	public void getOtherQuery(RoomSearchCri rcri, SQL sql) {
		if(rcri.getSearchType() != null) {
			String godQuery = " u.u_type=2";	
			String priceQuery = " r.r_price ASC";
			String populQuery = " popul DESC";
			
			switch(rcri.getSearchType()) {
			case "갓물주" :
				sql.WHERE(godQuery);
				break;
			case "요금순" :
				sql.ORDER_BY(priceQuery);
				break;
			case "인기순" : 
				sql.ORDER_BY(populQuery);
			}
		}
	}
	
	public String getSearchListCount(RoomSearchCri rcri) {
		System.out.println("provider 리스트 count");
		SQL sql = new SQL() {
			{
				SELECT ("count(*)");
				SELECT ("r_star*r_bookedcnt as popul");
				FROM ("rooms r");
				
				INNER_JOIN("amenity a on r.r_no = a.r_no ");
				
				INNER_JOIN("user u on r.u_no = u.u_no");
				
			}
		};
		String query = sql.toString();
		System.out.println(query);
		return query;
	}
	

}
