package kr.or.ddit.vo;

import java.io.Serializable;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@EqualsAndHashCode(of="cartId")
@NoArgsConstructor
@ToString
public class SugangCartVO implements Serializable {
	
	public String stdId;
	public String lectId;
}
