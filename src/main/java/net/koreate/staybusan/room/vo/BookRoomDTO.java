package net.koreate.staybusan.room.vo;

import java.sql.Time;

import lombok.Data;

@Data
public class BookRoomDTO {
	private int r_no;
	private String r_name;
	private Time r_checkin;
	private Time r_checkout;
}
