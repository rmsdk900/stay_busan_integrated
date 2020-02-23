package net.koreate.staybusan.room.controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpRequest;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import net.koreate.staybusan.common.util.FileUtils;
import net.koreate.staybusan.room.service.RoomRegService;
import net.koreate.staybusan.room.vo.RoomVO;

@Controller
@RequestMapping("/Rooms/*")
public class RoomRegController {
	
	@Inject
	ServletContext context;
	
	@Inject
	RoomRegService service;
	
	@GetMapping("resisterRoom1")
	public String resisterR1(){
		System.out.println("1페이지 호출");
		return "/room/ResisterRoom1";
	}
	
	@PostMapping("resisterRoom2")
	public String resisterR2(RoomVO vo, HttpServletRequest request, Model model) {
		System.out.println("2페이지 호출");
		
		String[] amenities = request.getParameterValues("amenity");
		
		vo.setAmenities(amenities);
		
		System.out.println("2페이지로 넘기는 값 : "+vo);
		
		model.addAttribute("room",vo);
		
		return "/room/ResisterRoom2";
	}
	
	@PostMapping("resisterRoom3")
	public String resisterR3(RoomVO vo, HttpServletRequest request, Model model) {
		System.out.println("3페이지 호출");
		
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		
		String[] amenities = request.getParameterValues("amenity");
		
		vo.setAmenities(amenities);
		
		String[] closed_from = request.getParameterValues("closed_from");
		String[] closed_to = request.getParameterValues("closed_to");
		
		vo.setClosed_from(closed_from);
		vo.setClosed_to(closed_to);
		
		List<Date> closed_fromDates = new ArrayList<Date>();
		List<Date> closed_toDates = new ArrayList<Date>();
		
		for(int i=0; i<closed_from.length; i++) {
			try {
				Date closed_fromDate = format.parse(closed_from[i]);
				closed_fromDates.add(closed_fromDate);
			} catch (ParseException e) {
				e.printStackTrace();
			}
		}
		
		for(int i=0; i<closed_to.length; i++) {
			try {
				Date closed_toDate = format.parse(closed_to[i]);
				closed_toDates.add(closed_toDate);
			} catch (ParseException e) {
				e.printStackTrace();
			}
		}
		
		vo.setClosed_fromDates(closed_fromDates);
		vo.setClosed_toDates(closed_toDates);
		
		System.out.println("3페이지로 넘기는 값 : "+vo);
		
		model.addAttribute("room",vo);
		
		return "/room/ResisterRoom3";
	}
	
	@PostMapping("fakeUploadFile")
	public ResponseEntity<Object> fakeUploadFile(@RequestParam("file") MultipartFile[] file, @RequestParam("u_no") int u_no){
		ResponseEntity<Object> entity = null;
		
		System.out.println(file);
		
		for(MultipartFile files : file) {
			System.out.println("찐 이름 : "+files.getOriginalFilename());
		}
		
		try {
			FileUtils utils = FileUtils.getInstance(context);
			List<String> fileList = utils.fakeUploadFile(file, u_no);
			entity = new ResponseEntity<>(fileList,HttpStatus.CREATED);
		} catch (IOException e) {
			e.printStackTrace();
			HttpHeaders header = new HttpHeaders();
			header.add("Content-Type", "text/plain;charset=utf-8");
			entity = new ResponseEntity<>(e.getMessage(),header,HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	@PostMapping("register")
	public String registerPost(RoomVO vo, HttpServletRequest request) throws Exception{
		String[] amenities = request.getParameterValues("amenity");
		vo.setAmenities(amenities);
		System.out.println("register : "+vo);
		service.regist(vo);
		return "redirect:/";
	}
	
}
