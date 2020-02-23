package net.koreate.staybusan.room.vo;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class RoomVO {
	
	private int r_no;
	private int u_no;
	private String r_name;
	private String r_desc;
	private String date_from;
	private String date_to;
	private Date r_date_from;
	private Date r_date_to;
	private int r_price;
	private String r_addr_main;
	private String r_addr_detail;
	private int r_guests;
	private int r_bath;
	private int r_bedroom;
	private int r_bed;
	private Date r_checkin;
	private Date r_checkout;
	private int r_deleted;
	
	private String r_gu;
	
	private String u_introduce;
	
	private List<Date> closed_fromDates;
	private String[] closed_from;
	private List<Date> closed_toDates;
	private String[] closed_to;
	
	private String[] amenities;
	
	private String r_checkin_our;
	private String r_checkin_minute;
	private String r_checkout_our;
	private String r_checkout_minute;
	
	private List<String> files;
	
//	영근 roomVO 추가
	private Float r_star;
	private int r_bookedcnt;
	
	private List<String> imgList;
	
	private Float popular;
}
