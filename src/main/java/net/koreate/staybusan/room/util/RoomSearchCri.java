package net.koreate.staybusan.room.util;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class RoomSearchCri extends Criteria{
	
	private String searchType;
	private String keyword;
	
	private String g_area;
	private Date g_date_from;
	private Date g_date_to;
	private int g_guests;
	
	private String r_gu;
	
	private String startDate;
	private String endDate;

}
