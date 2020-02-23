package net.koreate.staybusan.room.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.ServletContext;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import net.koreate.staybusan.common.util.FileUtils;
import net.koreate.staybusan.room.service.ListService;
import net.koreate.staybusan.room.util.RoomSearchCri;
import net.koreate.staybusan.room.vo.RoomListDTO;

@Controller
@RequestMapping("/room/*")
public class ListController {
	
	@Inject
	ServletContext context;
	
	@Inject
	ListService ls;
	
	@GetMapping("list")
	public String list(@ModelAttribute("rcri") RoomSearchCri rcri,
			Model model) throws Exception{
		System.out.println("controller");
		System.out.println(rcri);
		
		List<RoomListDTO> list = ls.listCriteria(rcri);
		
		
		model.addAttribute("list", list);
		model.addAttribute("pageMaker", ls.getPageMaker(rcri));
		
		return "room/list/list";
	}
	
	
	@RequestMapping(value="/listScroll", method=RequestMethod.POST)
	public @ResponseBody List<RoomListDTO>
	infiniteScrollDownPost(@RequestBody RoomListDTO roomListDTO){
		Integer roomToEnd = roomListDTO.getR_no();
		return ls.infiniteScrollDown(roomToEnd);
	}
	
	
	
	@GetMapping("getPositions")
	@ResponseBody
	public List<RoomListDTO> getPositions(@ModelAttribute("rcri") RoomSearchCri rcri)throws Exception{
		System.out.println("getPositions");
		return ls.getPositions(rcri);
	}
	
	@GetMapping("/displayFile")
	public ResponseEntity<byte[]> displayFile(
			String fileName) throws Exception{
		
		FileUtils utils = FileUtils.getInstance(context);
		
		return new ResponseEntity<byte[]>(utils.displayFile(fileName),utils.getHeader(fileName),HttpStatus.OK);
	}
	
	
	
}
