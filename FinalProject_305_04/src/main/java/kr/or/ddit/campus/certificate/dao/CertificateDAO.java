package kr.or.ddit.campus.certificate.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.vo.CertHistoryVO;
import kr.or.ddit.vo.CertificateVO;
import kr.or.ddit.vo.EmpVO;
import kr.or.ddit.vo.ProfessorVO;
import kr.or.ddit.vo.UsrVO;

/**
 * @author 장은호
 * @Since 2023. 2. 17.
 * <pre>
 *
 * ======[[개정이력(Modification Information)]]======
 *   수정일                    수정자                        수정내용
 * --------          --------    -----------------------
 * 2023. 2. 17.       장은호        		생성
 * 2023. 2. 21.       장은호                 selectHistoryList 이동
 * 2023. 2. 22.       장은호                 selectProfInfo, selectEmpInfo 추가
 *
 * Copyright (c) 2023 by DDIT All right reserved
 * </pre>
 */
@Mapper
public interface CertificateDAO {
	
	/**
	 * 전체 증명서 목록 조회
	 * @return 증명서VO List
	 */
	public List<CertificateVO> selectCertificateList();
	
	/**
	 * 증명서 상세 조회
	 * @param certId
	 * @return 증명서VO
	 */
	public CertificateVO selectCertificate(String certId);
	
	////////////////////////////////////////////////////////////////////
	
	/**
	 * 사용자(권한)별 증명서 목록 조회
	 * @param userId
	 * @return 증명서VO List
	 */
	public List<CertificateVO> selectUserCertificateList(String userId);
	
	/**
	 * 사용자 정보 조회(권한 조회용)
	 * @param userId
	 * @return UsrVO
	 */
	public UsrVO selectUserInfo(String userId);
	
	
	public ProfessorVO selectProfInfo(String profId);
	
	public EmpVO selectEmpInfo(String empId);
	

}
