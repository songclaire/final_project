package kr.or.ddit.vo;

import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

import javax.validation.constraints.NotNull;

import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.validate.DeleteGroup;
import kr.or.ddit.validate.UpdateGroup;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.ToString;

/**
 * 교직원 객체
 * @author 송지은
 * @Since 2023. 2. 13.
 * <pre>
 *
 * ======[[개정이력(Modification Information)]]======
 *   수정일                    수정자                        수정내용
 * --------          --------    -----------------------
 * 2023. 2. 13.       송지은        		생성
 * 2023. 2. 22.       장은호                 workingStatus 추가
 * Copyright (c) 2023 by DDIT All right reserved
 * </pre>
 */
@Data
@EqualsAndHashCode(of="empId")
@ToString
public class EmpVO extends UsrVO {
	private int rnum;
	@NotNull(groups= {UpdateGroup.class, DeleteGroup.class})
	private String empId;
	private String deptId;
	private String pos;
	private String entDate;
	private String levDate;
	
	private String empProp;
	private DeptVO deptVO;
	private BuildingVO buildVO;
	private CommVO commVO;
	
	private String workingStatus;	
	
	
	//첨부파일
		private List<AttaFileVO> attaFileList;
		private AttaFileVO attaFileVO;
		private int[] delAttaIds;				
		private int attaCount;
		private MultipartFile[] files;
		private int startAttaSn;
		public void setFiles(MultipartFile[] files) {
			if(files!=null && files.length > 0) {
				this.files = files;
				this.attaFileList = Arrays.stream(files)
											.filter((f)->!f.isEmpty())
											.map((f)->{
												return new AttaFileVO(f);
											}).collect(Collectors.toList());
			}
		}
		
	//첨부파일	
	
}

