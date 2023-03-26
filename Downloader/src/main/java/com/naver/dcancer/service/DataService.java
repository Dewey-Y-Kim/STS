package com.naver.dcancer.service;

import java.util.List;

import com.naver.dcancer.dto.DataDTO;
import com.naver.dcancer.dto.DataFileDTO;

public interface DataService {
	public List<DataDTO> datalist();
	public int dataInsert(DataDTO dto);
	public int datafileInsert(List<DataFileDTO> list);
	public int dataDelete(int no);
	public int dataFileDelete(int no);
	public DataDTO view(int no);
	public List<DataFileDTO> viewFiles(int no);
	public DataDTO editRec(int no,String id);
	public List<String> datafileList(int no);
	public int dataEditUpdate(DataDTO dto);
	public int dataDel(int no, String logid);
}