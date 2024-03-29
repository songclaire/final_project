package kr.or.ddit.emp.lectroomManage.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.vo.LectureVO;
import kr.or.ddit.vo.PagingVO;
import kr.or.ddit.vo.ProfessorVO;
import kr.or.ddit.vo.SyllabusVO;

/**
 * @author PC-17
 * @Since 2023. 2. 18.
 * <pre>
 *
 * ======[[개정이력(Modification Information)]]======
 *   수정일                    수정자                        수정내용
 * --------          --------    -----------------------
 * 2023. 2. 18.       서범수			생성
 *
 * Copyright (c) 2023 by DDIT All right reserved
 * </pre>
 */
@Mapper
public interface LectroomManageDAO {
	
	/**
	 * 강의계획서 갯수조회
	 * @param pagingVO
	 * @return
	 */
	public int selectTotalRecord(PagingVO<SyllabusVO> pagingVO);
	
	/**
	 * 학과장 승인 받은 강의계획서 목록 조회
	 * @return
	 */
	public List<SyllabusVO> selectLectroomManageList(PagingVO<SyllabusVO> syllabusVO);
	
	
	public SyllabusVO selectSyllaInfo(SyllabusVO syllaId);
	
	
	public SyllabusVO selectsylla(SyllabusVO syllaId);
	
	
	public int insertLect(SyllabusVO syllabusVO);
	
	
	public int insertAssignRoom(SyllabusVO syllabusVO);
	
	
	public int deleteLecture(SyllabusVO syllabusVO);
	
	
	public int deleteAssignRoom(SyllabusVO syllabusVO);
	
	
	public int selectTotalRecordLecture(PagingVO<LectureVO> pagingVO); 
	
	
	public List<LectureVO> selectLectureList(PagingVO<LectureVO> lectureVO);
	
	
	/**
	 * 강의 상세조회
	 * @param syllaId
	 * @return
	 */
	public SyllabusVO selectDetailLect(String syllaId);
	
	
	/**
	 * 강의시간표 기존 시간들 조회
	 * @param map
	 * @return
	 */
	public List<String> selectLectTimes(HashMap<String, Object> map);
}
