package net.koreate.staybusan.user.vo;

import java.sql.Time;
import java.util.Date;

import lombok.Data;

@Data
public class HistoryDTO {
	
	private int u_no;				// buy
	private String r_i_fullName;	// room_img
	private int b_no;				// buy
	private int r_no;				// buy
	private String r_name;			// rooms
	private Date b_date_from;		// buy
	private Date b_date_to;			// buy
	private int b_guest;			// buy
	private int b_total_price;		// buy
	private int b_status;			// buy
	private Time r_checkin;			// rooms
	private Time r_checkout; 		// rooms
	private int r_deleted;			// rooms
}
