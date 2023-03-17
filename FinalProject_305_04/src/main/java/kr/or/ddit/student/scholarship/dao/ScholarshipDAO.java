package kr.or.ddit.student.scholarship.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import kr.or.ddit.vo.PagingVO;
import kr.or.ddit.vo.SchHistVO;

@Mapper
public interface ScholarshipDAO {

	/**
	 * 장학금 내역 개수 조회
	 * @param pagingVO
	 * @return
	 */
	public int selectTotalRecord(String stdId);

	/**
	 *  장학금 내역 조회
	 * @param stdId
	 * @return
	 */
	public List<SchHistVO> selectScholarshipList(@Param("stdId") String stdId);

}
