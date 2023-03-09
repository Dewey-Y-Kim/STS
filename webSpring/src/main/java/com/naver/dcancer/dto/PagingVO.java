package com.naver.dcancer.dto;

public class PagingVO {
	// page 필요 변수 정의
	private int nowPage=1;
	private int onePageRec=5; //한페이지에 보여줄 레코드수
	private int totalRec; //총 레코드 수
	private int totalPage; //총 페이지 수
	private int lastPageRec;
	private int lastPage;
	private int onePageCnt=5;
	private int idxPage=1;
	private int lastIdxPage;
	// search 필요 변수 정의
	private String searchKey;
	private String searchWord;
	
	public String sTostring() {
		return "SearchVO [searchKey]"+searchKey+"[searchWord]"+searchWord; 
	}
	@Override
	public String toString() {
		return "PagingVO [nowPage=" + nowPage + ", onePageRec=" + onePageRec + ", totalRec=" + totalRec + ", totalPage="
				+ totalPage + ", lastPageRec=" + lastPageRec + ", lastPage=" + lastPage + ", onePageCnt=" + onePageCnt
				+ ", idxPage=" + idxPage + ", lastIdxPage=" + lastIdxPage + ", searchKey=" + searchKey + ", searchWord="
				+ searchWord + "]";
	}
	
	public int getNowPage() {
		return nowPage;
	}
	public void setNowPage(int nowPage) {
		this.nowPage = nowPage;
		idxPage= (nowPage-1)/onePageCnt *onePageCnt +1;
	}
	public int getOnePageRec() {
		return onePageRec;
	}
	public void setOnePageRec(int onePageRec) {
		this.onePageRec = onePageRec;
	}
	public int getTotalRec() {
		return totalRec;
	}
	public void setTotalRec(int totalRec) {
		this.totalRec = totalRec;
		totalPage=(totalRec%onePageRec==0? totalRec/onePageRec:totalRec/onePageRec+1);
		//totalPage=(int)Math.ceil((double)totalRec/onePageRec);
		lastPageRec = onePageRec;
		if(nowPage==totalPage) {
			// 나머지 0 :lastPageRec=onePageRec
			// 나머지 !=0 :남은 레코드 수를 lastPageRecord
			if(totalRec%onePageRec==0) {
				lastPageRec = onePageRec;
			}else {
				lastPageRec = totalRec%onePageRec;
			}
		}
	}
	public int getTotalPage() {
		return totalPage;
	}
	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
		lastIdxPage=(totalPage-1)/onePageCnt*onePageCnt+1;
	}
	public int getLastPageRec() {
		return lastPageRec;
	}
	public void setLastPageRec(int lastPageRec) {
		this.lastPageRec = lastPageRec;
	}

	public int getLastPage() {
		return lastPage;
	}

	public void setLastPage(int lastPage) {
		this.lastPage = lastPage;
	}
	public int getIdxPage() {
		return idxPage;
	}
	public void setIdxPage(int idxPage) {
		this.idxPage = idxPage;
	}
	public int getOnePageCnt() {
		return onePageCnt;
	}
	public void setOnePageCnt(int onePageCnt) {
		this.onePageCnt = onePageCnt;
	}
	public int getLastIdxPage() {
		return lastIdxPage=(totalPage-1)/onePageCnt*onePageCnt+1;
	}
	public void setLastIdxPage(int lastIdxPage) {
		this.lastIdxPage = lastIdxPage;
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
	
	
	
}
