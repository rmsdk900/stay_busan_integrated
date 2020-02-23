package net.koreate.staybusan.room.service;

import java.util.List;

import net.koreate.staybusan.room.vo.BestRoomDTO;
import net.koreate.staybusan.room.vo.HomeListDTO;

public interface RoomService {
	
	public List<HomeListDTO> list() ;

	public List<BestRoomDTO> bestList() throws Exception;


}
