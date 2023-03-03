package kr.or.ddit.student.assignment.service;


import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.student.assignment.dao.AssignmentStudentDAO;
import kr.or.ddit.vo.AssignmentSubmitVO;
import kr.or.ddit.vo.AssignmentVO;
import kr.or.ddit.vo.CurrLectVO;
import kr.or.ddit.vo.PagingVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class AssignmentServiceImpl implements AssignmentService {
	
	@Inject
	private AssignmentStudentDAO assignmentDAO;
	
	
	/**
	 * 과제 목록 게시물 조회 
	 * @param curlectId
	 */
	/*@Override
	public CurrLectVO retrieveAssignmentList(String curlectId) {
		return this.assignmentDAO.selectAssignmentList(curlectId);
	}*/
	@Override
	public void retrieveAssignmentList(PagingVO<CurrLectVO> pagingVO, String curlectId) {
		
		pagingVO.setTotalRecord(assignmentDAO.selectTotalRecord(curlectId)); //전체 글 갯수 조회
		
		List<CurrLectVO> AssignmentList = assignmentDAO.selectAssignmentList(pagingVO);
		log.info("AssignmentList!!!!!{}", AssignmentList);
		pagingVO.setDataList(AssignmentList);// 목록조회
	}


	
	/**
	 * 과제 제출 전 단건 조회 
	 * @param asgnId
	 */
	@Override
	public AssignmentVO retrieveAssignment(String asgnId) {
		return this.assignmentDAO.selectAssignmentView(asgnId);
	}



	/**
	 * 과제 제출하기 
	 * @param assignmentSubmitVO
	 * @returnassignmentSubmitVO
	 */
	@Override
	public int createAssimentSubmit(AssignmentSubmitVO assignmentSubmitVO) {
		int rowcnt = assignmentDAO.insertAssignmentSubmit(assignmentSubmitVO);
		return rowcnt;
	}


	
	/**
	 * 과제 제출 후 단건 조회 
	 * @param asgnId
	 * 
	 */
	@Override
	public AssignmentVO retrieveAssignmentSubmit(String asgnId) {
		 return this.assignmentDAO.selectAssignmentSubmitView(asgnId);
	}


	
	/**
	 * 과제 수정
	 * @param assignmentSubmitVO
	 * @return
	 */
	@Override
	public int modifyAssignment(AssignmentSubmitVO assignmentSubmitVO) {
		int rowcnt = assignmentDAO.updateAssignmentSubmit(assignmentSubmitVO);
		return rowcnt;
	}


	/**
	 * 과제 제출 삭제
	 * @param asgnId
	 * @return
	 */
	@Override
	public int removeAssignmentSubmit(String asgnId) {
		int rowcnt = assignmentDAO.deleteAssignmentSubmit(asgnId);
		return rowcnt;
	}



	
	


	


}
