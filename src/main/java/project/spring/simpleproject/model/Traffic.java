package project.spring.simpleproject.model;
import lombok.Data;

@Data
public class Traffic {
	private int trafficno;
	private int members_userno;
	private	String s_lat;
	private String s_lng;
	private	String e_lat;
	private String e_lng;
	private String to;
	private String from;
}
