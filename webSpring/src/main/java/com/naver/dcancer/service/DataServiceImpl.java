package com.naver.dcancer.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.naver.dcancer.dao.DataDAO;
import com.naver.dcancer.dto.DataDTO;
import com.naver.dcancer.dto.DataFileDTO;

@Service
public class DataServiceImpl implements DataService {
	@Autowired
	DataDAO dao;
	
	@Override
	public List<DataDTO> datalist(){
		return dao.datalist();
	}

	@Override
	public int dataInsert(DataDTO dto) {
		// TODO Auto-generated method stub
		return dao.dataInsert(dto);
	}
	public int datafileInsert(List<DataFileDTO> list) {
		return dao.datafileInsert(list);
	}
	public int dataDelete(int no) {
		return dao.dataDelete(no);
	}
	public int dataFileDelete(int no) {
		return dao.dataFileDelete(no);
	}
	public DataDTO view(int no) {
		return dao.view(no);
	}
	public List<DataFileDTO> viewFiles(int no) {
		return dao.viewFiles(no);
	}

}
