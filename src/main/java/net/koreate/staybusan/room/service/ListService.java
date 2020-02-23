package net.koreate.staybusan.room.service;

import java.util.List;

import net.koreate.staybusan.room.util.PageMaker;
import net.koreate.staybusan.room.util.RoomSearchCri;
import net.koreate.staybusan.room.vo.RoomListDTO;

public interface ListService {

	// 방 list
	List<RoomListDTO> listCriteria(RoomSearchCri rcri) throws Exception;

	// pageMaker
	PageMaker getPageMaker(RoomSearchCri rcri) throws Exception;
	
	// 지도에 넣어줄 positions
	List<RoomListDTO> getPositions(RoomSearchCri rcri);

	// 무한스크롤
	List<RoomListDTO> infiniteScrollDown(Integer roomToEnd);






}
