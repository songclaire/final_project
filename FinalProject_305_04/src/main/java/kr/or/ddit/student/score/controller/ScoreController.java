package kr.or.ddit.student.score.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.student.score.service.ScoreStdService;
import kr.or.ddit.vo.ScoreStdVO;
import kr.or.ddit.vo.UsrVO;
import kr.or.ddit.vo.UsrVOWrapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

/**
 * 성적 컨트롤러
 * @author 민경진
 *
 */

@Slf4j
@Controller
@RequestMapping("/student/score")
@RequiredArgsConstructor
public class ScoreController {
	
	@Autowired
	private final ScoreStdService service;
	
	@ModelAttribute("scoreStd")
	public ScoreStdVO scoreStd() {
		return new ScoreStdVO();
	}
	
	@GetMapping
	public String score(
			@AuthenticationPrincipal UsrVOWrapper principal	
			, Model model
		) {
		
		log.info("성적 조회 페이지");		
		
		UsrVO realUser = principal.getRealUser();
		String stdId = realUser.getUserId();
		
		
		List<ScoreStdVO> stdScoreList = service.retrieveStdScoreList(stdId);
		System.out.println("stdScoreList는?" + stdScoreList);
		model.addAttribute("stdScoreList", stdScoreList);
		
		
		return "student/score/score";
	}
}
