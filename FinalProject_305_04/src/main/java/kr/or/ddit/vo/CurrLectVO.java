package kr.or.ddit.vo;

import java.io.Serializable;
import java.util.List;

import javax.validation.constraints.NotNull;


import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.ToString;

/**
 * 수강강의
 * @author 이선민
 * @Since 2023. 2. 8.
 * <pre>
 *
 * ======[[개정이력(Modification Information)]]======
 *   수정일                    수정자                        수정내용
 * --------          --------    -----------------------
 * 2023. 2. 8.       이선민        		생성
 * 2023. 2. 8.       이현주        		수정
 * 2023. 2. 23.      장은호                   lectureVO 추가
 *
 * Copyright (c) 2023 by DDIT All right reserved
 * </pre>
 */
@Data
@EqualsAndHashCode(of="curlectId")
@ToString
public class CurrLectVO implements Serializable {
	
	
	private int rnum;
	private int rnum2;

	@NotNull
	private String curlectId;
	@NotNull
	private String stdId;
	@NotNull
	private String lectId;
	private String finScore;

	
	//출결
	private List<AttendVO> attendtList; //has many 관계 (1:N)
	
	// 강의
	private List<LectureVO> lectureList; //has many 관계 (1:N)
	private LectureVO lectureVO;
	
	// 학생
	private List<StudentVO> studentList; //has many 관계 (1:N)
	
	//시험응시
	private List<TestVO> testInfoList;
	private TestAllowVO testAllow; //has a 관계 - 거래처명
	
	//과제
	private List<AssignmentVO> assignmentList; //has many 관계 (1:N)
	
	//수강
	private int sugangState;
	
	
	
	
	
	
	
}
