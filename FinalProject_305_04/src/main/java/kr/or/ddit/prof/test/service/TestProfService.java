package kr.or.ddit.prof.test.service;

import java.util.List;

import kr.or.ddit.vo.AssignmentVO;
import kr.or.ddit.vo.LectureVO;
import kr.or.ddit.vo.PagingVO;
import kr.or.ddit.vo.TestPasgVO;
import kr.or.ddit.vo.TestQueVO;
import kr.or.ddit.vo.TestVO;

public interface TestProfService {

	
	/**
	 * 전체 시험 출제 목록 조회  + 전체 게시글 갯수 조회 
	 * @param pagingVO
	 */
	public void retrieveTestList(PagingVO<TestVO> pagingVO, String profId);
	

	
	/**
	 * 시험 정보 뷰 
	 * @param testVO
	 * @return
	 */
	public List<TestVO> retrieveTest(TestVO testVO);
	
	
	/**
	 * 강의명 select 뷰
	 * @return
	 */
	public List<LectureVO> retrieveLecture(String profId);
	
	
	
	/**
	 * 시험등록페이지
	 * @param testVO
	 * @return
	 */
	//public int createTest(TestVO testVO);//testInfo 시험정보 insert
	//public int createQue(TestVO testVO);// 문제 insert
	//public int createPasg(TestVO testVO); //지문 insert
	//전체 받아오기 
	public String createTotalTest(TestVO testVO);
	
	
	/**
	 * 시험별 제출학생 목록 뷰
	 * @param testVO
	 * @return
	 */
	public void retrieveTestSubmitStudent(PagingVO<TestVO> pagingVO, String testId);


	/**
	 * 제출한 학생 단건 조회
	 * @param testAllowId
	 * @return
	 */
	public TestVO retrieveSubmitStudent(String testId, String stdId);
	
	
	
	/**
	 * 출제한 시험 상세조회 
	 *  출제한 시험 "문제", "지문" 상세보기 
	 */
	public TestVO selectTestView(String testId); // 시험정보
	public List<TestVO> selectTestQue(String testId);// 문제
	public List<TestQueVO> selectTestPasg(String testId);// 지문
	
	
	/**
	 * 시험 제출 삭제
	 * @param testId
	 * @return
	 */
	public int removeTestView(String testId);
	
	
}
