package kr.or.ddit.vo;

import java.io.Serializable;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

/**
 * @author 장은호
 * @Since 2023. 2. 17.
 * <pre>
 *
 * ======[[개정이력(Modification Information)]]======
 *   수정일                    수정자                        수정내용
 * --------          --------    -----------------------
 * 2023. 2. 17.       장은호        		생성
 *
 * Copyright (c) 2023 by DDIT All right reserved
 * </pre>
 */
@Data
@EqualsAndHashCode(of= {"gradReqId", "mgradReqId"})
@NoArgsConstructor
public class GradReqVO implements Serializable {
	private String gradReqId;	// 졸업요건 아이디
	private String mgradReqId;	// 학과별 졸업요건 아이디
	
	private String reqItem;		// 요건 항목
	private String reqStand;	// 요건 기준
	
}
