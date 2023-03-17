package kr.or.ddit.prof.dean.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.vo.SyllaApprVO;
import kr.or.ddit.vo.SyllabusVO;

/**
 * @author PC-17
 * @Since 2023. 2. 13.
 * <pre>
 *
 * ======[[개정이력(Modification Information)]]======
 *   수정일                    수정자                        수정내용
 * --------          --------    -----------------------
 * 2023. 2. 13.       서범수         생성
 *
 * Copyright (c) 2023 by DDIT All right reserved
 * </pre>
 */
@Mapper
public interface LectrueSyllabusDeanDAO {
	/**
	 * 강의계획서 목록 조회
	 * @param professorVO
	 * @return
	 */
	public List<SyllabusVO> selectDeanSyllaList();
	
	
	/**
	 * 강의계획서 상세 조회
	 * @return
	 */
	public SyllabusVO selectDeanSylla(SyllabusVO syllaVO);
	
	/**
	 * 강의계획서 승인/반려 수정
	 * @param syllaApprVO
	 * @return
	 */
	public int updateSyllaAppr(HashMap<String, Object> map);
	
	/**
	 * 결재여부 확인을 위한 조회
	 * @return
	 */
	public List<SyllaApprVO> selectState();
	

}
