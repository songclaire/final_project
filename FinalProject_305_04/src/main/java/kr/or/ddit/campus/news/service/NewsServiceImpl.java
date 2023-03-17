package kr.or.ddit.campus.news.service;

import java.io.File;
import java.io.IOException;

import javax.annotation.PostConstruct;
import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import kr.or.ddit.campus.news.dao.NewsDAO;
import kr.or.ddit.commons.dao.AttaFileDAO;
import kr.or.ddit.vo.AttaFileVO;
import kr.or.ddit.vo.NewsVO;
import kr.or.ddit.vo.PagingVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class NewsServiceImpl implements NewsService {
	
	@Inject
	private NewsDAO newsDAO;
	@Inject
	private AttaFileDAO attaFileDAO;
	
	@Value("#{appInfo.imageFolder}")
	private File imageFolder;
	@Value("#{appInfo.imageFolder}")
	private String imageFolderURL;
	
	@PostConstruct
	public void init() throws IOException {
		log.info("첨부파일 저장 경로 : {}", imageFolder.getCanonicalPath());
	}
	

	@Override
	public void retrieveNewsList(PagingVO<NewsVO> pagingVO) {
		pagingVO.setTotalRecord(newsDAO.selectTotalRecord(pagingVO));
		pagingVO.setDataList(newsDAO.selectNewsList(pagingVO));
	}

	@Override
	public int createNews(NewsVO newsVO) {
		newsDAO.insertNews(newsVO);
		return 0;
	}

	@Override
	public NewsVO retrieveNews(String newsId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int modifyNews(NewsVO newsVO) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int removeNews(String newsId) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteAttaFileList(AttaFileVO attaFileVO) {
		// TODO Auto-generated method stub
		return 0;
	}

}
