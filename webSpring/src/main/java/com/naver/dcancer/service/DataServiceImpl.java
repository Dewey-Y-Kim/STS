package com.naver.dcancer.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.naver.dcancer.dao.DataDAO;
import com.naver.dcancer.dto.DataDTO;

@Service
public class DataServiceImpl implements DataService {
	@Autowired
	DataDAO dao;
	
	@Override
	public List<DataDTO> datalist(){
		return dao.datalist();
	}
}
