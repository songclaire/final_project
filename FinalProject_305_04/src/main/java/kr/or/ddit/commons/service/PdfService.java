package kr.or.ddit.commons.service;

import javax.servlet.http.HttpServletRequest;

public interface PdfService {
	
	int createHtmlPdf(String filename, String htmlStr, HttpServletRequest request);
	
	int createHtmlPdf2(String filename, String htmlStr, HttpServletRequest request);
	
}
