package net.koreate.staybusan.user.vo;

import java.util.Date;

import lombok.Data;

@Data
public class CommentDTO {
	
	private int u_no;			// user
	private int c_no;			// comment
	private String u_name;		// user
	private int r_no;			// comment
	private String r_name;		// rooms
	private String c_content;	// comment
	private Float c_star;			// comment
	private Date c_regdate;		// comment
	private int b_no;			// comment? buy?
}
