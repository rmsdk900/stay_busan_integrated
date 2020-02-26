package net.koreate.staybusan.user.service;

import java.util.List;

import net.koreate.staybusan.room.vo.CommentVO;
import net.koreate.staybusan.user.vo.CommentDTO;
import net.koreate.staybusan.user.vo.GuestMyPageDTO;
import net.koreate.staybusan.user.vo.HistoryDTO;

public interface GuestPageService {

	List<GuestMyPageDTO> getLikeList(Integer u_no);

	List<GuestMyPageDTO> getBookedList(Integer u_no);

	List<GuestMyPageDTO> getPastList(Integer u_no);

	List<CommentDTO> getComment(int u_no);

	HistoryDTO getHistory(int b_no);

	void cancelRoom(int b_no);

	List<CommentDTO> getb_noComment(int b_no);

	void writeComment(CommentVO comment);

	void commentModify(CommentVO comment);

	void commentDelete(int c_no, int r_no);

}
