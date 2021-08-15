package project.spring.simpleproject.model;
import lombok.Data;
@Data
public class Member {
	private	int userno;
	private String name;
	private String userid;
	private String userpw;
	private String tel;
	private String birthdate;
	private String addr_h;
	private String addr_c;
	private String is_out;
	private int is_login;
}
