package kr.or.ddit.emp.scholarshipManage.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.vo.MyStudentVO;
import kr.or.ddit.vo.PagingVO;

/**
 * 장학금 수여(교직원)
 * @author 이현주
 * @Since 2023. 3. 3.
 * <pre>
 *
 * ======[[개정이력(Modification Information)]]======
 *   수정일                    수정자                        수정내용
 * --------          --------    -----------------------
 * 2023. 3. 3.       이현주        		생성
 *
 * Copyright (c) 2023 by DDIT All right reserved
 * </pre>
 */
@Mapper
public interface ScholarshipManageDAO {
	
	/**
	 * 장학금 수여할 학생 카운트
	 * @param pagingVO
	 * @return
	 */
	public int selectTotalRecord(PagingVO<MyStudentVO> pagingVO);
	
	
	/**
	 * 장학금 받을 학생 목록 조회(교직원)
	 * @param pagingVO
	 * @return
	 */
	public List<MyStudentVO> selectSchStdList(PagingVO<MyStudentVO> pagingVO);
	public MyStudentVO selectSchStd(String stdId);
}
