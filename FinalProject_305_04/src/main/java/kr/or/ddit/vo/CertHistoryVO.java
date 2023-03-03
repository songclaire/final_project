package kr.or.ddit.vo;

import java.io.Serializable;

import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * @author 장은호
 * @Since 2023. 2. 17.
 * <pre>
 *
 * ======[[개정이력(Modification Information)]]======
 *   수정일                    수정자                        수정내용
 * --------          --------    -----------------------
 * 2023. 2. 17.       장은호        		생성
 * 2023. 2. 21.       장은호                 certDueDate 추가
 *
 * Copyright (c) 2023 by DDIT All right reserved
 * </pre>
 */
@Data
@EqualsAndHashCode(of="certHistId")
public class CertHistoryVO implements Serializable {
	
	private int rnum;
	
	private String certHistId;	// 증명서내역아이디
	private String certId;		// 증명서아이디
	private String userId;		// 아이디
	private String certDate;	// 증명서발급일
	private String certChknum;	// 증명서원본확인번호
	
	private UsrVO usrVO;
	
	private CertificateVO certVO;

	private String certDueDate;	// 증명서 출력가능일
}
