package kr.or.ddit.campus.facility.controller;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.campus.facility.service.FacilityService;
import kr.or.ddit.vo.FaciLentVO;
import kr.or.ddit.vo.FacilityVO;
import lombok.extern.slf4j.Slf4j;

/**
 *  시설 컨트롤러
 * @author 민경진
 *
 */
@Slf4j
@Controller
@RequestMapping("/campus")
public class FacilityController {

	@Inject
	private FacilityService service;
	
	
	/**
	 *  시설 목록 출력
	 * @return
	 */
	@RequestMapping("/facility")
	public String facility(
		Model model
	) {
		List<FacilityVO> facilityList = service.retrieveFacilityList();
//		log.info("facilityList 오나여?"+ facilityList );
		model.addAttribute("facilityList", facilityList);
		return "campus/facility/facility";
	}
	
	
	
	/**
	 * 시설 정보 출력
	 * 파라미터 : let data = {"faciId":"IA10001"}
	 * 요청URI : /campus/facilityInfo
	 * 요청방식 : post
	 * 리턴타입 : json(FacilityVO facilityVO)
	 */
	@ResponseBody
	@PostMapping("/facilityInfo")
	public FacilityVO facilityInfo(
			@RequestBody FacilityVO facilityVO
	) {
		//facilityVO{"faciId":"IA10001","rnum":0,"faciNm":null,"loc":null,"numPpl":null}
		log.info("facilityVO(before) : " + facilityVO);
		
		facilityVO = this.service.selectFaciInfo(facilityVO);
		String faciId = facilityVO.getFaciId();
		
		//facilityVO{"faciId":"IA10001","rnum":0,"faciNm":"농구장","loc":"실외-별관 앞, 실내-체육관","numPpl":10}
		log.info("facilityVO(after) : " + facilityVO);
		
		return facilityVO; 
	}
	
	//요청 파라미터 : let data = {"faciId":faciId} => data : {"faciId":"IA10003"} / data : {"faciId":"IA10004"}
	//요청URI : /campus/selectFaciTableList
	//요청방식 : post
	//리턴타입 : json(List<Map<String,Object>>)
	@ResponseBody
	@PostMapping("/selectFaciTableList")
	public List<Map<String,Object>> selectFaciTableList(@RequestBody FacilityVO facilityVO){
		String faciId = facilityVO.getFaciId();
		log.info("faciId : " + faciId);
		
		
		//selectFaciList
		List<Map<String,Object>> data = this.service.selectFaciTableList(faciId);
		log.info("data : " + data);
		
		return data;
	}


	
	
	/**
	 * 등록하기
	 */
	@ResponseBody
	@PostMapping("/insertFacilityRes")
	public List<FacilityVO> insertFacilityRes(@RequestBody FaciLentVO faciLentVO) {
		//FaciLentVO(faciLeaseid=null, faciId=, userId=22222222, availTimeid=  MON12  MON15, 
		//reservDate=20230227, numUsers=1, purUse=dasdfsdsa, facilityTimeList=null, facilityVO=null)
		log.info("faciLentVO : " + faciLentVO);
		
		//1) 시간
		String availTimeid = faciLentVO.getAvailTimeid();
		log.info("availTimeid : " + availTimeid);
		//2) 날짜
		//20230228 20230301 20230302 
		String publicNalja = faciLentVO.getReservDate();		
		log.info("publicNalja : " + publicNalja);
		
		//1) 여러 시간
		String[] availTimeidArr = availTimeid.split(" ");
		log.info("availTimeidArr 잘랐따 : " + availTimeidArr.length);
		//2) 여러 날짜
		String[] reservDateArr = publicNalja.split(" ");
		log.info("reservDateArr 잘랐따 : " + reservDateArr.length);
		
		int result = 0;
		int counter = 0;
		
		for(String str : availTimeidArr) {
			//공백제거
			String temp = str.trim();
			log.info("temp : " + temp);
			if(temp!=null) {	//str : MON12 / str : TUE14
				FaciLentVO vo = new FaciLentVO();
				
				vo = faciLentVO;
				
				vo.setAvailTimeid(temp);//availTimeid=  MON12  MON15 => MON12
				
				if(!vo.getAvailTimeid().equals("")) {
					vo.setReservDate(reservDateArr[counter++]);
					log.info("vo : " + vo);
					result = result +  this.service.insertFacilityRes(faciLentVO);
				}
			}
		}
		List<FacilityVO> facilityList = service.retrieveFacilityList();
		
		log.info("result 등록하러 왔낭?" + result);
		return facilityList;
	}


}










