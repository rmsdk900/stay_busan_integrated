package net.koreate.staybusan.room.vo;

import java.util.Date;

import lombok.Data;

@Data
public class MessageVO {
	private int m_no;
	private int m_receiver;
	private int m_sender;
	private String m_content;
	private int r_no;
	private Date m_regdate;
	private int m_read;
	
	private String m_sender_name;
	private String m_sender_profile;
	private String r_name;
}
