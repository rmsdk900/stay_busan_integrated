package net.koreate.staybusan.room.util;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

// 게시물 목록 페이지 블럭 정보
public class PageMaker {
	
	private int totalCount;
	private int startPage;
	private int endPage;
	private boolean prev;
	private boolean next;
	private int displayPageNum=5;
	private int maxPage;
	
	private Criteria cri;
	
	public void calcPaging() {
		endPage = (int)Math.ceil((cri.getPage()/(double)displayPageNum))*displayPageNum;
		startPage=(endPage-displayPageNum)+1;
		maxPage=(int)(Math.ceil(totalCount/(double)cri.getPerPageNum()));
		if(endPage > maxPage)this.endPage = maxPage;
		
		// prev = startPage == 1 ? false : true;
		
		prev = (endPage - displayPageNum) <= 0 ? false : true;
		
		// next = (endPage * cri.getPerPageNum() >= totalCount)? false : true;
		
		next = (endPage == maxPage) ? false : true;
		
	}

	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
		calcPaging();
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public boolean isPrev() {
		return prev;
	}

	public void setPrev(boolean prev) {
		this.prev = prev;
	}

	public boolean isNext() {
		return next;
	}

	public void setNext(boolean next) {
		this.next = next;
	}

	public int getDisplayPageNum() {
		return displayPageNum;
	}

	public void setDisplayPageNum(int displayPageNum) {
		this.displayPageNum = displayPageNum;
	}

	public int getMaxPage() {
		return maxPage;
	}

	public void setMaxPage(int maxPage) {
		this.maxPage = maxPage;
	}

	public Criteria getCri() {
		return cri;
	}

	public void setCri(Criteria cri) {
		this.cri = cri;
	}
	
	

	@Override
	public String toString() {
		return "PageMaker [totalCount=" + totalCount + ", startPage=" + startPage + ", endPage=" + endPage + ", prev="
				+ prev + ", next=" + next + ", displayPageNum=" + displayPageNum + ", maxPage=" + maxPage + ", cri="
				+ cri + "]";
	}
	
	
	public String makeQuery(int page) {
//		String query="?";
//		query += "page="+page;
//		query += "&perPageNum="+getPerPageNum();
//		return query;
		
		UriComponents uriComponents = UriComponentsBuilder.newInstance()
				.queryParam("page",page)
				.queryParam("perPageNum", cri.getPerPageNum())
				.build();
		String query = uriComponents.toUriString();
		System.out.println(query);
		return query;
		
	}
	
	public String roomSearch(int page) {
		UriComponents uriComponents = UriComponentsBuilder.newInstance()
				.queryParam("page",page)
				.queryParam("perPageNum", cri.getPerPageNum())
				.queryParam("g_area", encodingURL(((RoomSearchCri)cri).getG_area()))
				.queryParam("startDate", ((RoomSearchCri)cri).getStartDate())
				.queryParam("endDate", ((RoomSearchCri)cri).getEndDate())
				.queryParam("g_guests", ((RoomSearchCri)cri).getG_guests())
				.queryParam("r_gu",encodingURL(((RoomSearchCri)cri).getR_gu()))
				.queryParam("searchType","")
				.build();
		String query = uriComponents.toUriString();
		System.out.println(query);
		return query;
	}
	
	public String search(int page) {
		UriComponents uriComponents = UriComponentsBuilder.newInstance()
				.queryParam("page",page)
				.queryParam("perPageNum", cri.getPerPageNum())
				.queryParam("searchType",((SearchCriteria)cri).getSearchType())
				.queryParam("keyword", encodingURL(((SearchCriteria)cri).getKeyword()))
				.build();
		String query = uriComponents.toUriString();
		System.out.println(query);
		return query;
	}
	
	public String encodingURL(String keyword) {
		if(keyword == null || keyword.trim().length() == 0) {
			return "";
		}
		
		try {
			return URLEncoder.encode(keyword,"UTF-8");
		} catch (UnsupportedEncodingException e) {
			return "";
		}
		
	}

}
