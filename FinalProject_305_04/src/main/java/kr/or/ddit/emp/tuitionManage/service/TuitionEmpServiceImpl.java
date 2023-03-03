package kr.or.ddit.emp.tuitionManage.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.emp.tuitionManage.dao.TuitionEmpDAO;
import kr.or.ddit.vo.PagingVO;
import kr.or.ddit.vo.TuitionPayVO;
import kr.or.ddit.vo.TuitionVO;

/**
 *  등록금 고지서 발송 (교직원)
 * @author 이현주
 * @Since 2023. 2. 20.
 * <pre>
 *
 * ======[[개정이력(Modification Information)]]======
 *   수정일                    수정자                        수정내용
 * --------          --------    -----------------------
 * 2023. 2. 20.       이현주      			생성 
 *
 * Copyright (c) 2023 by DDIT All right reserved
 * </pre>
 */
@Service
public class TuitionEmpServiceImpl implements TuitionEmpSerivce {

	@Autowired
	TuitionEmpDAO tuitionEmpDAO;
	
	//고지서 발송할 전체 재학생 목록 조회 (교직원) + 전체 재학생 수 조회
	@Override
	public void retrieveTuitionStdList(PagingVO<TuitionVO> pagingVO, String semeId) {
//		PagingVO<TuitionVO> pagingVO = new PagingVO<>();
		
		//전체 재학생 수 조회
		pagingVO.setTotalRecord(tuitionEmpDAO.selectTotalRecord(semeId)); 

		// 전체 재학생 목록 조회
		List<TuitionVO> tuitionList = tuitionEmpDAO.selectTuitionStdList(pagingVO);
		pagingVO.setDataList(tuitionList);
//		return this.tuitionEmpDAO.selectTuitionStdList(pagingVO); 
		
	}

	// 등록금 고지서 발송(교직원)
	@Override
	public void createTuitionSend(Map<String,String> map) {
		tuitionEmpDAO.insertTuitionSend(map);
	}

}
