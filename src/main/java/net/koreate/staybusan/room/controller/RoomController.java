package net.koreate.staybusan.room.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import net.koreate.staybusan.room.service.RoomService;
import net.koreate.staybusan.room.util.RoomSearchCri;

@Controller
@RequestMapping("/room/*")
public class RoomController {
	
	@Inject
	RoomService rs;
	
	@GetMapping("home")
	public String home(@ModelAttribute("rcri") RoomSearchCri rcri, 
			Model model) throws Exception{
		System.out.println("room/home 컨트롤러");
		model.addAttribute("homeList", rs.list());
		model.addAttribute("bestList", rs.bestList());
		return "room/home";
	}	

}
