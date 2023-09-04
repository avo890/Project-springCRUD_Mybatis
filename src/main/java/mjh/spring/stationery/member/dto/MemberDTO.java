package mjh.spring.stationery.member.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString

public class MemberDTO {

	private int num;
	private String id;
	private String password;
	private String name;
	private String phoneNum;
	private String email;
	private String birthday;
	private String gender;

}
