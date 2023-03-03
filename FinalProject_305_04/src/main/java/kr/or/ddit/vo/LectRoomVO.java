package kr.or.ddit.vo;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(of="lectRoomId")
public class LectRoomVO {
	private String lectRoomId;
	private Integer numPpl;
	private String buildId;
	private String buildNum;
}
