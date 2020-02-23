package net.koreate.staybusan.room.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import net.koreate.staybusan.room.dao.ListDAO;
import net.koreate.staybusan.room.dao.RoomDAO;
import net.koreate.staybusan.room.vo.BestRoomDTO;
import net.koreate.staybusan.room.vo.HomeListDTO;

@Service
public class RoomServiceImpl implements RoomService{
	
	@Inject
	RoomDAO rdao;
	
	@Inject
	ListDAO ldao;

	@Override
	public List<HomeListDTO> list() {
		List<HomeListDTO> homeList = rdao.getHomeList();
		return homeList;
	}

	@Override
	public List<BestRoomDTO> bestList() throws Exception {
		List<BestRoomDTO> bestList = rdao.getBestList();
		
		for(int i=0;i<bestList.size();i++) {
			int rno = bestList.get(i).getR_no();
			String roomImg = ldao.getImgs(rno);
			bestList.get(i).setR_i_fullName(roomImg);
		}
		return bestList;
	}

}
