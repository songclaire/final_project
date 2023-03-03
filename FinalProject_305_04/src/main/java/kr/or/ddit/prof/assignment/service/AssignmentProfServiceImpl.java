package kr.or.ddit.prof.assignment.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.prof.assignment.dao.AssignmentProfDAO;
import kr.or.ddit.vo.AssignmentSubmitVO;
import kr.or.ddit.vo.AssignmentVO;
import kr.or.ddit.vo.PagingVO;
import kr.or.ddit.vo.StudentVO;
import lombok.extern.slf4j.Slf4j;

/**
 * 
 * @author 이선민
 * @Since 2023. 2. 20.
 * <pre>
 *
 * ======[[개정이력(Modification Information)]]======
 *   수정일                    수정자                        수정내용
 * --------          --------    -----------------------
 * 2023. 2. 20.       PC-20        생성
 *
 * Copyright (c) 2023 by DDIT All right reserved
 * </pre>
 */


@Slf4j
@Service
public class AssignmentProfServiceImpl implements AssignmentProfService {

	
	@Inject
	private AssignmentProfDAO dao;
	
	/**
	 * 과제 목록 조회  + 개수 조회 
	 * @param pagingVO
	 */
	@Override
	public void retrieveAssignmentProfList(PagingVO<AssignmentVO> pagingVO, String lectId) {
		
		
		int totalRecord = dao.selectTotalRecord(lectId);
		pagingVO.setTotalRecord(totalRecord);
		
		List<AssignmentVO> assignmentList = dao.selectProfAssignmentList(pagingVO);
		log.info("assignmentList{}", assignmentList);
		pagingVO.setDataList(assignmentList);
	}

	/**
	 * 교수 과제 조회
	 * @return
	 */
	@Override
	public AssignmentVO retrieveAssignment(String asgnId) {

		AssignmentVO assignment = dao.selectProfAssignmentView(asgnId);
		if(assignment == null) {
			throw new RuntimeException();
		}
		
		return assignment;
	}

	
	
	/**
	 * 과제 등록
	 * @param asiAssignmentVO
	 * @return
	 */
	@Override
	public int createAssignment(AssignmentVO assignmentVO) {
		int rowcnt = dao.insertProfAssignment(assignmentVO);
		return rowcnt;
	}

	
	
	
	/**
	 * 출제된 과제 수정 
	 * @param assignmentVO
	 */
	@Override
	public int modifyAssignment(AssignmentVO assignmentVO) {
		int rowcnt = dao.updateProfAssignmentView(assignmentVO);
		return rowcnt;
	}

	
	
	/**
	 * 출제된 과제 삭제 
	 * @param asgnId
	 * @return
	 */
	@Override
	public int removeAssignment(String asgnId) {
		int rowcnt = dao.deleteProfAssignment(asgnId);
		return rowcnt;
	}

	
	///////////////////////////////////////////////////////////////////
	
	/**
	 * 제출한 학생 리스트 
	 */
	@Override
	public void retrieveSubmitStudentList(PagingVO<AssignmentVO> pagingVO, String asgnId) {
		
		int totalRecord = dao.selectSubmitTotalRecord(asgnId);
		pagingVO.setTotalRecord(totalRecord);
		
		List<AssignmentVO> studentList = dao.selectSubmitStudentList(pagingVO);
		pagingVO.setDataList(studentList);
	}

	
	
	/**
	 * 제출한 학생 단건 조회
	 */
	@Override
	public AssignmentVO retrieveSubmitStudent(String asgnSubmId) {
		return this.dao.selectSubmitStudentView(asgnSubmId);
	}


	
	///////////////////////////////////////////////////////////////////
	
	
	/**
	 * 교수 점수 등록  - update
	 */
	@Override
	public int modeifyAssignmentScore(AssignmentSubmitVO assignmentSubmitVO) {
		int rowcnt = dao.updateAssignScore(assignmentSubmitVO);
		return rowcnt;
	}
	
	
	
	



	
	
	
}
