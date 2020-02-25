package net.koreate.staybusan.room.service;

import java.util.Map;

import net.koreate.staybusan.room.vo.AmenityVO;
import net.koreate.staybusan.room.vo.BuyVO;
import net.koreate.staybusan.room.vo.ModifyRoomImgDTO;
import net.koreate.staybusan.room.vo.ModifyRoomPrimaryDTO;
import net.koreate.staybusan.room.vo.RoomVO;

public interface RoomDetailService {
	
	// 방 번호로 방 메인 정보 불러오기 
	Map<String, Object> readRoom(int r_no)throws Exception;
	
	
	
	// 방 기본 정보 수정하기
	RoomVO modifyRoomPrimary(ModifyRoomPrimaryDTO dto)throws Exception;

	// 방 편의시설 정보 수정하기
	AmenityVO modifyRoomAmenities(AmenityVO vo)throws Exception;

	// 방 이미지 수정하기
	void modRoomImgs(ModifyRoomImgDTO dto)throws Exception;
	
	// 방 임시 삭제 기능
	RoomVO hideRoom(int r_no) throws Exception;
	
	// 방 찜하기
	BuyVO likeRoom(int u_no, int r_no)throws Exception;
	
	// 찜 취소하기
	String dislikeRoom(int u_no, int r_no)throws Exception;
	
	// 찜 상태 받기
	String isLike(int u_no, int r_no)throws Exception;

}
