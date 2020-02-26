package net.koreate.staybusan.user.vo;

import lombok.Data;

@Data
public class GuestMyPageDTO {
	private int b_no;
	private int u_no;		// buy
	private int b_status;	// buy
	private int r_no;		// buy
	private String r_name;	// rooms
	private String r_i_fullName;	//room_img
	
}
