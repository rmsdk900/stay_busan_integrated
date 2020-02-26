package net.koreate.staybusan.user.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import net.koreate.staybusan.room.vo.CommentVO;
import net.koreate.staybusan.user.dao.GuestPageDAO;
import net.koreate.staybusan.user.vo.CommentDTO;
import net.koreate.staybusan.user.vo.GuestMyPageDTO;
import net.koreate.staybusan.user.vo.HistoryDTO;

@Service
public class GuestPageServiceImpl implements GuestPageService{

	@Inject
	GuestPageDAO gDAO;
	
	@Override
	public List<GuestMyPageDTO> getLikeList(Integer u_no) {
		List<GuestMyPageDTO> likeList = gDAO.getLikeList(u_no);
		return likeList;
	}

	@Override
	public List<GuestMyPageDTO> getBookedList(Integer u_no) {
		List<GuestMyPageDTO> bookedList = gDAO.getBookedList(u_no);
		return bookedList;
	}

	@Override
	public List<GuestMyPageDTO> getPastList(Integer u_no) {
		List<GuestMyPageDTO> pastList = gDAO.getPastList(u_no);
		return pastList;
	}

	@Override
	public List<CommentDTO> getComment(int u_no) {
		List<CommentDTO> comment = gDAO.getCommentList(u_no);
		return comment;
	}

	@Override
	public HistoryDTO getHistory(int b_no) {
		HistoryDTO history = gDAO.getHistoryList(b_no);
		return history;
	}

	@Override
	@Transactional
	public void cancelRoom(int b_no) {
		
		gDAO.userMoneyBack(b_no);
		gDAO.moneyBack(b_no);
		gDAO.minusBookedCnt(b_no);
		gDAO.cancelRoom(b_no);
		
		System.out.println("서비스 DAO 완료?");
		
	}

	@Override
	public List<CommentDTO> getb_noComment(int b_no) {
		List<CommentDTO> comment = gDAO.getB_noComment(b_no);
		return comment;
	}

	@Override
	public void writeComment(CommentVO comment) {
		System.out.println("서비스 실행 시작");
		gDAO.writeComment(comment);
		gDAO.starUpdate(comment.getR_no());
		System.out.println("서비스 실행 끝 writeComment");
		
	}

	@Override
	public void commentModify(CommentVO comment) {
		System.out.println("commentModify 서비스");
		gDAO.commentModify(comment);
		gDAO.starUpdate(comment.getR_no());
		System.out.println("commentModify DAO 끝");
	}

	@Override
	public void commentDelete(int c_no, int r_no) {
		gDAO.commentDelete(c_no);
		gDAO.starUpdate(r_no);
	}

}
