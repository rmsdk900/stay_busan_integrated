package net.koreate.staybusan.common.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import net.koreate.staybusan.room.service.RoomService;
import net.koreate.staybusan.room.util.RoomSearchCri;

@Controller
public class HomeController {
	
	@Inject
	RoomService rs;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(@ModelAttribute("rcri") RoomSearchCri rcri, Model model) throws Exception {
		System.out.println("room/home 컨트롤러");
		model.addAttribute("homeList", rs.list());
		model.addAttribute("bestList", rs.bestList());
		return "home";
	}
	
}
