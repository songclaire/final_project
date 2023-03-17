package kr.or.ddit.campus.news.service;

import java.util.Map;

import kr.or.ddit.vo.AttaFileVO;
import kr.or.ddit.vo.NewsVO;
import kr.or.ddit.vo.PagingVO;

public interface NewsService {

	/**
	 * 학교뉴스 게시글 목록 조회
	 * @param pagingVO
	 */
	public void retrieveNewsList(PagingVO<NewsVO> pagingVO);
	
	/**
	 * 학교뉴스 게시글 상세 조회
	 * @param newsId
	 * @return
	 */
	public NewsVO retrieveNews(String newsId);
	
	/**
	 * 학교뉴스 게시글 등록
	 * @param news
	 * @return
	 */
	public int createNews(NewsVO newsVO);
	
	/**
	 * 학교뉴스 게시글 수정
	 * @param news
	 * @return
	 */
	public int modifyNews(NewsVO newsVO);
	
	/**
	 * 학교뉴스 게시글 삭제
	 * @param newsId
	 * @return
	 */
	public int removeNews(String newsId);
	
	/**
	 * 첨부파일 삭제
	 * @param attaFileVO
	 * @return
	 */
	public int deleteAttaFileList(AttaFileVO attaFileVO);
	
}
