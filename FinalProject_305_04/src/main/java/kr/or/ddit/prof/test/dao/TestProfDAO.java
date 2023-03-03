package kr.or.ddit.prof.test.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.vo.LectureVO;
import kr.or.ddit.vo.PagingVO;
import kr.or.ddit.vo.TestPasgVO;
import kr.or.ddit.vo.TestQueVO;
import kr.or.ddit.vo.TestVO;

@Mapper
public interface TestProfDAO {

	
	
	/**
	 * 출제한 전체 시험 목록 조회
	 * @param pagingVO
	 * @return
	 */
	public List<TestVO> testProfTotalList(PagingVO<TestVO> pagingVO);
	
	

	/**
	 * 시험 정보 뷰 
	 * @param testVO
	 * @return
	 */
	public List<TestVO> selectTestInfo (TestVO testVO);
	
	/**
	 * 강의명 select 뷰
	 * @return
	 */
	public List<LectureVO> selectLectureList();
	
	
	
	/**
	 * 시험등록페이지
	 * @param testVO
	 * @return
	 */
	public int insertTest(TestVO testVO); //testInfo 시험정보 insert
	public int insertQue(TestVO testVO); // 문제 insert
	public int insertPasg(TestVO testVO); //지문 insert
	
}


