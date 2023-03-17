package kr.or.ddit.student.assignment.controller;

import java.security.Principal;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.ddit.student.assignment.service.AssignmentService;
import kr.or.ddit.ui.PaginationRenderer;
import kr.or.ddit.validate.DeleteGroup;
import kr.or.ddit.validate.InsertGroup;
import kr.or.ddit.validate.UpdateGroup;
import kr.or.ddit.vo.AssignmentSubmitVO;
import kr.or.ddit.vo.AssignmentVO;
import kr.or.ddit.vo.CurrLectVO;
import kr.or.ddit.vo.LectureVO;
import kr.or.ddit.vo.PagingVO;
import kr.or.ddit.vo.SearchVO;
import lombok.extern.slf4j.Slf4j;

/**
 * @author 이선민
 * @Since 2023. 2. 14.
 * <pre>
 *
 * ======[[개정이력(Modification Information)]]======
 *   수정일                    수정자                        수정내용
 * --------        --------    -----------------------
 * 2023. 2. 14.       이선민             생성
 *
 * Copyright (c) 2023 by DDIT All right reserved
 * </pre>
 */

@Slf4j
@Controller
@RequestMapping("/student/assignment/**")
public class AssignmentStudentController {

		
	@Inject
	private AssignmentService service;

	@Resource(name="bootstrapPaginationRender")
	private PaginationRenderer renderer;
	
	
	/**
	 * assignment 속성 생성 메소드
	 * 
	 * 학생 과제
	 * 1) select 내가 수강중인 강의들의 과제 목록 출력(수강중인 강의, 과제명, 과제 제출일) 
	 * 2) 과제 제출  제출할 과제들 중 하나 선택 ASGN_ID 전송
	 * 3) 과제 상세 화면 출력 - select 
	 * 4) 제출 버튼 클릭시 과제 제출 - 과제목록 화면으로 redirect  
	 */
	
/*	@ModelAttribute("currLect")
	public CurrLectVO currectList() {
		return new CurrLectVO();
	}
	
	@ModelAttribute("assignment")
	public AssignmentVO assignmentList() {
		return new AssignmentVO();
	}*/
	
/*	@ModelAttribute("assignmentSubmit")
	public AssignmentSubmitVO assignmentSubmitList() {
		return new AssignmentSubmitVO();
	}*/
	
	
	
	/**
	 * 과제 목록 (selectList)
	 * @return
	 */
	/*@GetMapping
	public String assignmentListUI(	
		@RequestParam(value="curlectId",required=true) String curlectId
		, Model model
	) {

		//log.info("!!!!!!!!!!!!!!!!!! ");
		
		CurrLectVO currLectVO = service.retrieveAssignmentList(curlectId);
		model.addAttribute("currLectVO", currLectVO);

		return "student/assignment/assignment";
	}
	*/
	
	//List 접근할 때 목록 처음에 띄워주는 컨트롤러 (List 목록으로 보내줌)
	@GetMapping
	public String assignmentListUI(	
		@RequestParam(value="page", required=false, defaultValue="1") int currentPage 
		, @RequestParam(value="lectId", required=true) String lectId
		, @ModelAttribute("simpleCondition") SearchVO searchVO
		, Model model
	) {

		PagingVO<CurrLectVO> pagingVO = new PagingVO<>(10,5);
		pagingVO.setCurrentPage(currentPage);

		
		CurrLectVO currLectVO = new CurrLectVO();
		currLectVO.setLectId(lectId);
		pagingVO.setDetailCondition(currLectVO);
		
		
		service.retrieveAssignmentList(pagingVO, lectId);
		log.info("pagingVO !@!! {}", pagingVO);
		
	
		model.addAttribute("pagingVO", pagingVO);
		model.addAttribute("lectId", currLectVO.getLectId());
		
		
		
		return "student/assignment/assignment";
	}
	
	
	
	
	
	
	//////////////////////////////////////////////////////////////////////////////////
	
	/**
	 * 과제 수정 (제출 전) view
	 * @return
	 */
	@GetMapping("/assignmentView")
	public String assignmentView(
		@RequestParam(value="asgnId",required=true)	String asgnId
//		, @RequestParam(value="curlectId",required=true) String curlectId
		, @RequestParam String lectId
		, Model model
	) {

		
		
		AssignmentVO assignmentVO = service.retrieveAssignmentSubmit(asgnId);
//		assignmentVO.getAssignmentSubmitVO().setCurlectId(curlectId);
		assignmentVO.setLectId(lectId);
		
		log.info("assignmentVO~~~~ : {}", assignmentVO);
		
		CurrLectVO currLectVO = new CurrLectVO();
//		currLectVO.setCurlectId(curlectId);
		
		model.addAttribute("assignmentVO", assignmentVO);
		model.addAttribute("currLectVO", currLectVO);

		
		
		return "student/assignment/assignmentView";
	}
	
	
	
	/**
	 * 과제 기간 만료후  상세
	 * @param asgnId
	 * @param curlectId
	 * @param model
	 * @return
	 */
	@GetMapping("/assignmentComplete")
	public String assignmentComplete(
		@RequestParam(value="asgnId",required=true)	String asgnId
//		, @RequestParam(value="curlectId",required=true) String curlectId
		, @RequestParam String lectId
		, Principal principal
		, Model model
	) {		
		String stdId = principal.getName();
		
		Map<String,String> map = new HashMap<String,String>();
		map.put("asgnId", asgnId);
		map.put("stdId", stdId);
		
		AssignmentVO assignmentVO = service.retrieveAssignment(map);
		assignmentVO.setLectId(lectId);
		log.info("!!!!!!!!!{}", assignmentVO);
	
//    	CurrLectVO currLectVO = new CurrLectVO();
//		currLectVO.setCurlectId(curlectId);
		
		model.addAttribute("assignmentVO", assignmentVO);
//		model.addAttribute("currLectVO", currLectVO);

		
		
		return "student/assignment/assignmentView";
	}
	
	
	////////////////////////////////////////////////////////////////////////
	
	/**
	 * 과제 등록하기 insert
	 * @return
	 */
	@RequestMapping("/assignmentForm")
	public String assignmentForm(
		@RequestParam(value="asgnId",required=true)	String asgnId
	//	, @RequestParam String curlectId
		, @RequestParam String lectId
		, Principal principal
		, Model model
	) {
		log.info("asgnId : " + asgnId);
		log.info("lectId : " + lectId);
		String stdId = principal.getName();
		log.info("stdId : " + stdId);
		
		Map<String,String> map = new HashMap<String,String>();
		map.put("asgnId",asgnId);
		map.put("stdId",stdId);
		
		AssignmentVO assignmentVO = service.retrieveAssignment(map);
		log.info("assignmentVO 잠깐만 저장하기 전 {} : " ,assignmentVO) ;
		assignmentVO.setLectId(lectId);
		
		log.info("assignmentVO sgdsdg {} : " ,assignmentVO) ;

		model.addAttribute("assignmentVO", assignmentVO);
		
		return "student/assignment/assignmentForm";
	}


	
	@PostMapping("/assignmentForm")
	public String assignmentInsert(
		@Validated(InsertGroup.class) @ModelAttribute("assignmentSubmit")  AssignmentSubmitVO assignmentSubmitVO
		, @RequestParam String curlectId
		, @RequestParam String lectId
		, Model model	
	) {
		//AssignmentSubmitVO(asgnSubmId=null, curlectId=, asgnId=DL10782, assignSubSdate=null, assignSubCont=<p>ㅁㄴㅇㄹ</p>
//		, assignScore=null, assignCont=null)
		log.info("assignmentSubmitVO : " + assignmentSubmitVO);
		log.info("lectId : " + lectId);
		log.info("curlectId : " + curlectId);
		
		assignmentSubmitVO.setCurlectId(curlectId);
		
		String viewName = null;

		int rowcnt = service.createAssimentSubmit(assignmentSubmitVO);
		CurrLectVO currLectVO = new CurrLectVO();
//		currLectVO.setCurlectId(curlectId);
		currLectVO.setLectId(lectId);

		
//		model.addAttribute("curlectId", curlectId);	
		model.addAttribute("currLectVO", currLectVO);
		
		if(rowcnt > 0) {
			viewName = "redirect:/student/assignment?lectId=" + currLectVO.getLectId();
		}else {
			model.addAttribute("message", "서버 오류");
			viewName = "student/assignment/assignmentForm";
		}
		
		return viewName;
		
	}
	
	
	//////////////////////////////////////////////////////////////////////////////////
	
	/**
	 * 과제 수정 (제출 후) edit
	 * @return
	 */
	@GetMapping("/assignmentEdit")
	public String assignmentEditUI(
		@RequestParam(value="asgnId",required=true)	String asgnId
//		, @RequestParam(value="curlectId",required=true) String curlectId
		, @RequestParam String lectId
		, Model model
	) {

		AssignmentVO assignmentVO = service.retrieveAssignmentSubmit(asgnId);
//		assignmentVO.getAssignmentSubmitVO().setCurlectId(curlectId);
		assignmentVO.setLectId(lectId);
		
		
		model.addAttribute("assignmentVO", assignmentVO);
//		model.addAttribute("curlectId", curlectId);
		
		
		return "student/assignment/assignmentEdit";
	}
	
	@PostMapping("/assignmentEdit")
	public String AssignmentEdit(
		@Validated(UpdateGroup.class) @ModelAttribute("assignmentSubmit") AssignmentSubmitVO assignmentSubmitVO
		, @RequestParam String lectId
		, Model model
	) {
		
		String viewName = null;
		
		
		AssignmentVO assignmentVO = new AssignmentVO();
		assignmentVO.setLectId(lectId);
		
		
		log.info("sdfsdf");
		int rowcnt = service.modifyAssignment(assignmentSubmitVO);
		if(rowcnt > 0) {
			viewName = "redirect:/student/assignment/assignmentView?asgnId=" + assignmentSubmitVO.getAsgnId() + "&lectId=" + assignmentVO.getLectId();
		}else {
			model.addAttribute("message","서버오류");
			viewName = "student/assignment/assignmentEdit";
		}
		return viewName;
		
	}
	
	/////////////////////////////////////////////////////////////////////
	
	
	/**
	 * 과제 제출 삭제
	 * @param asgnId
	 * @return
	 */
	@DeleteMapping("/assignmentView")
	public String assignmentDelete(
		@Validated(DeleteGroup.class) @ModelAttribute("assignmentSubmitVO") AssignmentSubmitVO assignmentSubmitVO
		, @RequestParam String asgnId
//		, @RequestParam String curlectId
		, @RequestParam String lectId
		, Model model
	) {
		
		//그냥 url로 넘길경우 @PathVariables / 파라미터로 넘길경우 @RequestParam
		
		
		String viewName = null;
		
		LectureVO lectureVO = new LectureVO();
		lectureVO.setLectId(lectId);
		
		
		int rowcnt = service.removeAssignmentSubmit(asgnId);
		
		if(rowcnt > 0) {
			viewName = "redirect:/student/assignment?lectId=" + lectureVO.getLectId();
		}else {
			model.addAttribute("message", "서버 오류");
			viewName = "student/assignment/assignmentView";
		}
		
		return viewName;	
	}
	

	
	
	
	
	
}
