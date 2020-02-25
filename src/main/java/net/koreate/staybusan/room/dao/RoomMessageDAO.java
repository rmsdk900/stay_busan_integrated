package net.koreate.staybusan.room.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import net.koreate.staybusan.room.vo.MessageVO;

public interface RoomMessageDAO {
	
	// 메시지 보내기
	@Insert("INSERT INTO message(m_receiver, m_sender, m_content, r_no) "
			+ " VALUES(#{m_receiver}, #{m_sender}, #{m_content}, #{r_no}) ")
	void sendMessage(MessageVO vo)throws Exception;
	
	
	// 내가 받은 메시지 불러오기
	@Select("SELECT * FROM message WHERE m_receiver=#{m_receiver} ORDER BY m_no DESC")
	List<MessageVO> callMyAllMessage(int m_receiver)throws Exception;
	
	// 메시지 삭제하기
	@Delete("DELETE FROM message WHERE m_no = #{m_no}")
	void deleteMessage(int m_no) throws Exception;
}
