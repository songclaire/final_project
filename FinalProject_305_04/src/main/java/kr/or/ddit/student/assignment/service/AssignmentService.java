package kr.or.ddit.student.assignment.service;

import java.util.List;

import kr.or.ddit.vo.AssignmentSubmitVO;
import kr.or.ddit.vo.AssignmentVO;
import kr.or.ddit.vo.CurrLectVO;
import kr.or.ddit.vo.PagingVO;

public interface AssignmentService {

	

	
	/**
	 * 과제 목록 게시물 조회   + 전체 게시글 갯수 조회
	 * @param curlectId
	 */
	//public CurrLectVO retrieveAssignmentList(String curlectId);
	public void retrieveAssignmentList(PagingVO<CurrLectVO> pagingVO, String curlectId);

	
	/**
	 * 과제 제출 전 단건 조회 
	 * @param asgnId
	 */
	public AssignmentVO retrieveAssignment(String asgnId);
	
	
	
	/**
	 * 과제 제출하기 
	 * @param assignmentSubmitVO
	 * @return
	 */
	public int createAssimentSubmit(AssignmentSubmitVO assignmentSubmitVO);

	
	
	/**
	 * 과제 제출 후 단건 조회 
	 * @param asgnId
	 * @return
	 */
	public AssignmentVO retrieveAssignmentSubmit(String asgnId);
	
	
	
	/**
	 * 과제 수정
	 * @param assignmentSubmitVO
	 * @return
	 */
	public int modifyAssignment(AssignmentSubmitVO assignmentSubmitVO);
	
	
	
	/**
	 * 과제 제출 삭제
	 * @param asgnId
	 * @return
	 */
	public int removeAssignmentSubmit(String asgnId);
	
	

	
	
}
