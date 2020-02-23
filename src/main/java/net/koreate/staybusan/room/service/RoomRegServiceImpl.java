package net.koreate.staybusan.room.service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.ServletContext;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import net.koreate.staybusan.common.util.FileUtils;
import net.koreate.staybusan.room.dao.RoomRegDAO;
import net.koreate.staybusan.room.vo.RoomVO;

@Service
public class RoomRegServiceImpl implements RoomRegService {

	@Inject
	RoomRegDAO dao;
	
	@Inject
	ServletContext context;

	@Transactional
	@Override
	public void regist(RoomVO vo) throws Exception {

		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat tFormat = new SimpleDateFormat("HH:mm");

		Date r_date_from = format.parse(vo.getDate_from());
		Date r_date_to = format.parse(vo.getDate_to());

		String checkin = vo.getR_checkin_our() + ":" + vo.getR_checkin_minute();
		String checkout = vo.getR_checkout_our() + ":" + vo.getR_checkout_minute();

		Date r_checkin = tFormat.parse(checkin);
		Date r_checkout = tFormat.parse(checkout);

		String[] gus = vo.getR_addr_main().split(" ");

		String r_gu = gus[1];

		vo.setR_gu(r_gu);

		System.out.println(r_checkin);

		vo.setR_date_from(r_date_from);
		vo.setR_date_to(r_date_to);
		vo.setR_checkin(r_checkin);
		vo.setR_checkout(r_checkout);

		System.out.println("db용 : " + vo);
		
		dao.regist(vo);

		int r_no = dao.getR_no();

		System.out.println(r_no);

		dao.addAmenity();
		
		String[] amenities = vo.getAmenities();
		if (amenities == null) {
			return;
		} else {
			for (int i = 0; i < amenities.length; i++) {
				dao.amenityReg(amenities[i]);
			}
		}

		String[] closed_fromDates = vo.getClosed_from();
		String[] closed_toDates = vo.getClosed_to();

		for (int i = 0; i < closed_fromDates.length; i++) {
			Date closed_from = format.parse(closed_fromDates[i]);
			Date closed_to = format.parse(closed_toDates[i]);
			System.out.println(closed_from);
			System.out.println(closed_to);
			dao.banDateReg(closed_from, closed_to);
		}
		
		List<String> files = vo.getFiles();
		
		FileUtils utils = FileUtils.getInstance(context);
		List<String> realFiles = utils.uploadFile(files, vo.getU_no(), r_no);
		
		if (realFiles != null) {
			for (String r_i_fullName : realFiles) {
				dao.imgReg(vo.getU_no(),r_no,r_i_fullName);
			}
		}
	}

}
