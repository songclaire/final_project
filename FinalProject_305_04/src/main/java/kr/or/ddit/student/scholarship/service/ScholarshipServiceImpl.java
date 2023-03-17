package kr.or.ddit.student.scholarship.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.student.scholarship.dao.ScholarshipDAO;
import kr.or.ddit.vo.PagingVO;
import kr.or.ddit.vo.SchHistVO;
import lombok.extern.slf4j.Slf4j;

@Service
public class ScholarshipServiceImpl implements ScholarshipService {

	@Inject
	private ScholarshipDAO scholarshipDAO;
	
	// 장학금 내역 조회
	@Override
	public List<SchHistVO> retrieveScholarshipList(String stdId) {
		
		return this.scholarshipDAO.selectScholarshipList(stdId);
				
	}
}
