package kr.or.ddit.vo;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.ToString;

@ToString
@EqualsAndHashCode(of="calandarNo")
@NoArgsConstructor
@Data
public class CalendarVO extends SemesterVO {
	private String calendarNo;
	private String calendarTitle;
	private String calendarMemo;
	private String calendarStart;
	private String calendarEnd;
	private String semeId;
	private String semeYear;
	
	private String camYear;
	
}
