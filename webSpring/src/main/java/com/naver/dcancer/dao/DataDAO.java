package com.naver.dcancer.dao;

import java.util.List;

import com.naver.dcancer.dto.DataDTO;
import com.naver.dcancer.dto.DataFileDTO;

public interface DataDAO {
	
	public List<DataDTO> datalist();
	public int dataInsert(DataDTO dto);
	public int datafileInsert(List<DataFileDTO> list);
	public int dataDelete(int no);
	public int dataFileDelete(int no);
	public DataDTO view(int no);
	public List<DataFileDTO> viewFiles(int no);
}
