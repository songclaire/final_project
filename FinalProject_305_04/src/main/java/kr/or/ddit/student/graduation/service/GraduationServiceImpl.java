package kr.or.ddit.student.graduation.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.student.graduation.dao.GraduationDAO;
import kr.or.ddit.vo.GradReqVO;
import kr.or.ddit.vo.StudentVO;
import lombok.extern.slf4j.Slf4j;

/**
 * @author 장은호
 * @Since 2023. 2. 16.
 * <pre>
 *
 * ======[[개정이력(Modification Information)]]======
 *   수정일                    수정자                        수정내용
 * --------          --------    -----------------------
 * 2023. 2. 16.       장은호			생성
 * 2023. 2. 23.       장은호			추가
 *
 * Copyright (c) 2023 by DDIT All right reserved
 * </pre>
 */
@Slf4j
@Service
public class GraduationServiceImpl implements GraduationService {

	@Inject
	private GraduationDAO gradDAO;
	
	@Override
	public StudentVO retrieveStudent(String stdId) {
		StudentVO studentVO = gradDAO.selectStudent(stdId);
		return studentVO;
	}

	@Override
	public List<GradReqVO> retrieveGradReqList(String mGradReqId) {
		List<GradReqVO> gradReqList = gradDAO.selectGradReqList(mGradReqId);
		return gradReqList;
	}
	


}
