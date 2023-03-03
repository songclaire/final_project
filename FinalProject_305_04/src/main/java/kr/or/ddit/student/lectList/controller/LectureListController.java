package kr.or.ddit.student.lectList.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.ddit.student.lectList.service.LectListService;
import kr.or.ddit.vo.LectureVO;
import kr.or.ddit.vo.MyLectureVO;
import kr.or.ddit.vo.MyStudentVO;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;


/**
 * 수강 중인 강의 목록(학생) 컨트롤러
 * @author 민경진
 * @Since 2023. 2. 2.
 * <pre>
 *
 * ======[[개정이력(Modification Information)]]======
 *   수정일                    수정자                        수정내용
 * --------          --------    -----------------------
 * 2023. 2. 6.       이현주			수정
 *
 * Copyright (c) 2023 by DDIT All right reserved
 * </pre>
 */

@Slf4j
@RequiredArgsConstructor
@RequestMapping("/student")
@Controller
public class LectureListController {

	@Autowired
	private final LectListService service;  
	
	@ModelAttribute
	public MyLectureVO lectureList() {
		return new MyLectureVO();
	}
	
//	골뱅이RequestMapping("/student/lectList/lectList")
	@GetMapping("/lectList")
	public String lectList(
			@RequestParam(value="stdId", required=true) String stdId
			, @RequestParam(value="semeId", required=true) String semeId
			, Model model) {
		
		log.info("lectList에 왔다");
		System.out.println(stdId + semeId);
		
		List<MyStudentVO> stdLectList = service.retrieveLectList(stdId, semeId);		
		
		log.info("왔는지 보자 : " + stdLectList);
			
		model.addAttribute("stdLectList", stdLectList);
		
		return "student/lectList/lectList";
	}
}
