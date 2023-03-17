package kr.or.ddit.student.tuition.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.student.tuition.dao.TuitionDao;
import kr.or.ddit.vo.TuitionPayVO;
import kr.or.ddit.vo.TuitionVO;

/**
 * 등록금 내역 조회(학생)
 * @author 이현주
 * @Since 2023. 2. 24.
 * <pre>
 *
 * ======[[개정이력(Modification Information)]]======
 *   수정일                    수정자                        수정내용
 * --------          --------    -----------------------
 * 2023. 2. 24.       이현주         		생성
 * 2023. 3. 07		      이현주         		수정
 *
 * Copyright (c) 2023 by DDIT All right reserved
 * </pre>
 */
@Service
public class TuitionServiceImpl implements TuitionService {

	@Autowired
	TuitionDao tuitionDAO;

	@Override
	public List<TuitionPayVO> retrieveTuitionList(String stdId) {
		return this.tuitionDAO.selectTuitionList(stdId);
	}

	@Override
	public TuitionPayVO retrieveTuitionBill(String stdId, String semeId) {
		return this.tuitionDAO.selectTuitionBill(stdId, semeId);
	}

	@Override
	public TuitionPayVO retrieveTuitionChecking(String stdId, String semeId) {
		return this.tuitionDAO.selectTuitionChecking(stdId, semeId);
	}

}



