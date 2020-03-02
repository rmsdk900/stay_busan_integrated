package net.koreate.staybusan.common.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import net.koreate.staybusan.common.dao.CommonDAO;

@Service
public class CommonServiceImpl implements CommonService{
	
	@Inject
	CommonDAO dao;

	@Override
	public int charging(int u_no, int charging) throws Exception {
		dao.charging(u_no, charging);
		
		return dao.getBalance(u_no);
	}

}
