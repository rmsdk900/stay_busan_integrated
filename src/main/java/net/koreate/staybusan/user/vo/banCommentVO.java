package net.koreate.staybusan.user.vo;

import java.util.Date;

import lombok.Data;

@Data
public class banCommentVO {
	private int c_no;
	private int b_c_reporter;
	private String b_c_reason;
	private int b_c_bad_person;
	private String c_content;
	private Date b_c_date;
	
	private String b_reporter_name;
	private String b_bad_person_name;
}
