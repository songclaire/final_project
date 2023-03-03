package kr.or.ddit.student.test.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.vo.PagingVO;
import kr.or.ddit.vo.TestAllowVO;
import kr.or.ddit.vo.TestAnsVO;
import kr.or.ddit.vo.TestVO;

@Mapper
public interface TestDAO {

	
	/**
	 * 게시글 전체 개수 조회
	 * @param pagingVO
	 * @return
	 */
	public int selectTotalRecord(PagingVO<TestVO> pagingVO);
	
	
	/**
	 * 시험목록 조회
	 */
	public List<TestVO> selectTestList(PagingVO<TestVO> pagingVO);

	
	/**
	 * 시험응시 insert
	 * @param test
	 * @param sqlSession
	 * @return
	 */
	public int insertTestAllow(TestAllowVO testAllow);
	
	
	/**
	 * 시험 상세조회 
	 * @param testId
	 * @return
	 */
	public TestVO selectTest(@Param("testAllowId") String testAllowId);
	
	/**
	 * 시험 상세조회2 
	 * @param testAllowId
	 * @return Map<String,String>
	 */
	public Map<String,String> selectTest2(String testAllowId);
	
	
	/**
	 * 학생제출답안  insert
	 * @param test
	 * @return
	 */
	public int inserStudentAns(TestAllowVO testAns);

	
	
	
	
	
}
