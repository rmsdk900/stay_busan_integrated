package net.koreate.staybusan.user.vo;

import lombok.Data;

@Data
public class LoginDTO {
	
	private String u_id;
	private String u_pw;
	private boolean u_cookie;
}
