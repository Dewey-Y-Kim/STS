package com.naver.dcancer.DTO;

import lombok.Data;

public class pagingVO {
	private int totalPage; //총페이지수
	private int nowPage=1; //현 페이지 넘버
	private int totalLine; // 총 레코드수
	private int linePerPage=20; //한페이지에 표시될 라인
	private int pagingCnt = 5;
	private int lastPage; // 마지페이지
	private int lastPageLine; // 마지막페이지에 표시될 줄 수 
	private int idxPage=(nowPage-1)/pagingCnt * pagingCnt +1;
	private int lastIdxPage; // 마지막 페이지의 인덱스페이지
	
	//Search
	private String searchKey;
	private String searchWord;

	@Override
	public String toString() {
		return "pagingVO [totalPage=" + totalPage + ", nowPage=" + nowPage + ", totalLine=" + totalLine
				+ ", linePerPage=" + linePerPage + ", pagingCnt=" + pagingCnt + ", lastPage=" + lastPage
				+ ", lastPageLine=" + lastPageLine + ", idxPage=" + idxPage + ", lastIdxPage=" + lastIdxPage
				+ ", searchKey=" + searchKey + ", searchWord=" + searchWord + "]";
	}
	
	public int getPagingCnt() {
		return pagingCnt;
	}
	public void setPagingCnt(int pagingCnt) {
		this.pagingCnt = pagingCnt;
	}
	
	public int getTotalPage() {
		return totalPage;
	}
	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
		lastIdxPage=(totalPage-1)/pagingCnt*pagingCnt +1;
	}
	public int getNowPage() {
		return nowPage;
	}
	public void setNowPage(int nowPage) {
		this.nowPage = nowPage;
		this.idxPage= (nowPage-1)/pagingCnt * pagingCnt +1;
	}
	public String getSearchKey() {
		return searchKey;
	}
	public void setSearchKey(String searchKey) {
		this.searchKey = searchKey;
	}
	public String getSearchWord() {
		return searchWord;
	}
	public void setSearchWord(String searchWord) {
		this.searchWord = searchWord;
	}
	public int getTotalLine() {
		return totalLine;
	}
	public void setTotalLine(int totalLine) {
		this.totalLine = totalLine;
		totalPage=(totalLine%linePerPage ==0? totalLine/linePerPage: totalLine/linePerPage+1);
		lastPageLine = linePerPage;
		if(nowPage == totalPage) {
			if(totalLine%linePerPage==0) {
				lastPageLine = linePerPage;
			}else {
				lastPageLine = totalLine%linePerPage;
			}
		}
	}
	public int getLinePerPage() {
		return linePerPage;
	}
	public void setLinePerPage(int linePerPage) {
		this.linePerPage = linePerPage;
	}
	public int getLastPage() {
		return lastPage;
	}
	public void setLastPage(int lastPage) {
		this.lastPage = lastPage;
	}
	public int getLastPageLine() {
		return lastPageLine;
	}
	public void setLastPageLine(int lastPageLine) {
		this.lastPageLine = lastPageLine;
	}
	public int getIdxPage() {
		return idxPage;
	}
	public void setIdxPage(int idxPage) {
		this.idxPage = idxPage;
	}
	public int getLastIdxPage() {
		return (totalPage-1)/pagingCnt*pagingCnt+1;
	}
	public void setLastIdxPage(int lastIdxPage) {
		this.lastIdxPage = lastIdxPage;
	}
	
}
