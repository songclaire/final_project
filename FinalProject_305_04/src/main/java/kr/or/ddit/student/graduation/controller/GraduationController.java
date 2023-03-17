package kr.or.ddit.student.graduation.controller;

import javax.inject.Inject;

import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import kr.or.ddit.student.graduation.service.GraduationService;
import kr.or.ddit.student.record.service.RecordService;
import kr.or.ddit.vo.StudentVO;
import kr.or.ddit.vo.UsrVO;
import kr.or.ddit.vo.UsrVOWrapper;
import lombok.extern.slf4j.Slf4j;

/**
 * 졸업요건 컨트롤러
 * @author 민경진
 *
 */
@Slf4j
@Controller
public class GraduationController {
	
	@Inject
	private GraduationService service;
	@Inject
	private RecordService recordService;
	
	@GetMapping("/student/graduation")
	public String graduation(
		@AuthenticationPrincipal UsrVOWrapper principal
		, Model model
	) {
		UsrVO realUser = principal.getRealUser();
//		log.info("누구야{}", realUser);
		
		String userRole = realUser.getUserRole();
		
		if(userRole.equals("ROLE_STD")) {
			String stdId = realUser.getUserId();
			StudentVO studentVO = service.retrieveStudent(stdId);
			if(studentVO!=null) {
				model.addAttribute("studentVO", studentVO);
				
				StudentVO savedData = recordService.retrieveRecordList(stdId);
				String lastRecName = savedData.getRecordList().get(0).getRecName();
				if(lastRecName.equals("졸업")) {
					model.addAttribute("lastStatus", lastRecName);
				} else if(lastRecName.equals("휴학")) {
					model.addAttribute("lastStatus", lastRecName);
				} else if(lastRecName.equals("수료")) {
					model.addAttribute("lastStatus", lastRecName);
				} else {
					model.addAttribute("lastStatus", "재학");
				}
				
				
				boolean allAcquired = false;
				if(studentVO.getGradFulList()!=null) {
					Integer count = (int) studentVO.getGradFulList().stream().filter(g->g.getFulCheck().equals("N") || g.getFulCheck()==null).count();
					log.info("카운트{}", count);
					if(count == 0 && count!=null) {
						allAcquired = true;
					} else if(count!=null) {
						allAcquired = false;
					}
					model.addAttribute("allAcquired", allAcquired);
		//			log.info("찍어봐요요{}", studentVO);
				} else {
					model.addAttribute("message", "졸업요건 없음");
				}
				
				
				
			} else {
				model.addAttribute("message", "졸업요건 없음");
			}
		}
		
		return "student/graduation/graduation";
		
	}
	
	
	
	
	
	
	
}
