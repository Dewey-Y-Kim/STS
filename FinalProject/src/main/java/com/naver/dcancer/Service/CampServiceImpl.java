package com.naver.dcancer.Service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.naver.dcancer.DAO.CampDAO;
import com.naver.dcancer.DTO.OptDTO;
import com.naver.dcancer.DTO.SellDTO;
import com.naver.dcancer.DTO.brokenDTO;
import com.naver.dcancer.DTO.customDTO;
import com.naver.dcancer.DTO.pagingVO;
import com.naver.dcancer.DTO.promiseDTO;
import com.naver.dcancer.DTO.refundDTO;
import com.naver.dcancer.DTO.soldDTO;

@Service
public class CampServiceImpl implements CampService {
	@Inject
	CampDAO dao;
	
	@Override
	public int pagingData(String bbs, String data) {
		// TODO Auto-generated method stub
		return dao.pagingData(bbs, data);
	}
	
	@Override
	public List<customDTO> customSelect(pagingVO vo) {
		// TODO Auto-generated method stub
		System.out.println(vo.toString());
		return dao.customSelect(vo);
	}

	@Override
	public List<OptDTO> optDataSelect(int customNo) {
		// TODO Auto-generated method stub
		return dao.optDataSelect(customNo);
	}

	@Override
	public int addCustomData(customDTO custom) {
		// TODO Auto-generated method stub
		return dao.addCustomData(custom);
	}

	@Override
	public int addOptData(OptDTO opt) {
		// TODO Auto-generated method stub
		return dao.addOptData(opt);
	}
	@Override
	public int addOpt(OptDTO opt) {
		// TODO Auto-generated method stub
		return dao.addOpt(opt);
	}
	@Override
	public customDTO customfinder(String name, String tel, String code) {
		// 고객이름 , 전화번호, 등록매장으로 고객검색
		return dao.customfinder(name, tel, code);
	}

	@Override
	public customDTO customfind(int no) {
		// 고객번호로 검색
		return dao.customfind(no);
	}
	//매출등록
	@Override
	public List<SellDTO> selledList(String code, String date) {
		// 매장, 지정일에 따른 판매내역 list로
		return dao.selledList(code, date);
	}

	@Override
	public List<SellDTO> selledData(String code, String date) {
		// TODO Auto-generated method stub
		List<SellDTO> list=dao.selledData(code, date);
		System.out.println("[SelledData] list:"+list);
		return list;
	}

	@Override
	public int selldataUpdate(OptDTO dto) {
		// TODO Auto-generated method stub
		return dao.selldataUpdate(dto);
	}

	@Override
	public List<soldDTO> soldDay(String date) {
		// TODO Auto-generated method stub
		return dao.soldDay(date);
	}

	@Override
	public List<soldDTO> soldBetween(String startDate, String endDate) {
		// TODO Auto-generated method stub
		return dao.soldBetween(startDate, endDate);
	}

	@Override
	public List<brokenDTO> brokenList() {
		// TODO Auto-generated method stub
		return dao.brokenList();
	}

	@Override
	public List<brokenDTO> brokenFind(String searchWord) {
		// TODO Auto-generated method stub
		return dao.brokenFind(searchWord);
	}

	@Override
	public int brokenInsert(brokenDTO dto) {
		// TODO Auto-generated method stub
		return dao.brokenInsert(dto);
	}

	@Override
	public List<refundDTO> refundList() {
		// TODO Auto-generated method stub
		return dao.refundList();
	}

	@Override
	public List<refundDTO> refundFind(String searchWord) {
		// TODO Auto-generated method stub
		return dao.refundFind(searchWord);
	}

	@Override
	public int refundInsert(refundDTO dto) {
		// TODO Auto-generated method stub
		return dao.refundInsert(dto);
	}

	@Override
	public List<promiseDTO> promisedBuyer(String date) {
		// TODO Auto-generated method stub
		return dao.promisedBuyer(date);
	}

	@Override
	public List<promiseDTO> promisedData(String date) {
		// TODO Auto-generated method stub
		return dao.promisedData(date);
	}

	@Override
	public List<promiseDTO> promiseToday(int code, String now) {
		// TODO Auto-generated method stub
		return dao.promiseToday(code, now);
	}

}
