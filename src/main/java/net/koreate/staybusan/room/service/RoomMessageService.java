package net.koreate.staybusan.room.service;

import net.koreate.staybusan.room.vo.MessageVO;

public interface RoomMessageService {
	// 메시지 보내기
	void sendMessage(MessageVO vo) throws Exception;
	// 메시지 삭제
	void deleteMessage(int m_no) throws Exception;
}
