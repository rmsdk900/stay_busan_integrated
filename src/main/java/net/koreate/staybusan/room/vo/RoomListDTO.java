package net.koreate.staybusan.room.vo;

import lombok.Data;

@Data
public class RoomListDTO {
	
	private int r_no;
	private String r_name;
	private int r_guests;
	private int r_bedroom;
	private int r_bed;
	private int r_bath;
	private int r_price;
	private String r_addr_main;
	private int a_heating;
	private int a_parking;
	private int a_wifi;
	private Float c_star;
	private int commentNum;
	private Float popular;
	private String r_i_fullName;
}
