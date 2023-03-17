package kr.or.ddit.vo;

import java.util.List;

import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * @author 이현주
 * @Since 2023. 2. 9.
 * <pre>
 *
 * ======[[개정이력(Modification Information)]]======
 *   수정일                    수정자                        수정내용
 * --------          --------    -----------------------
 * 2023. 2. 9.       이현주      		생성
 *
 * Copyright (c) 2023 by DDIT All right reserved
 * </pre>
 */
@Data
@EqualsAndHashCode(of="stdId")
public class MyStudentVO extends UsrVO{

	
	private String stdId;
	private String majorId;
	private String profId;
	private String entDate;
	
	private MajorVO majorVO; // 1:1
	private CollVO collVO; // 1:1
	private ProfessorVO professorVO; // 1:1
	private List<MyLectureVO> mylectureList; // has many 관계
	private List<CurrLectVO> currlectList; // has many 관계
	private List<SemesterVO> semesterList; // has many 관계
	private SemesterVO semeVO; // 1:1 
	
	private UsrVO usrVO;
	private List<SchHistVO> schHistList; // 장학금수혜내역
	private CurrLectVO currLectVO;
	
	private Integer camYear; // 마지막 변동된 학년 정보 . 학적 변동 정보는 record의  list로 넣어야함
	private String semeId;
	
	//평균성적
	private int finAvg;
	private int rslt;
	private String schsNm;
	
}
