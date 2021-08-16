package project.spring.simpleproject.model;

import lombok.Data;

@Data
public class Restaurant {
	private int resno;
	private String name;
	private double stars;
	private String call;
	private String address;
	private String times;
	private String theme_1;
	private String theme_2;
	private String theme_3;
	private String ps;
	private int review_count;
	private String photos;
	private int prefer_10;
	private int prefer_20;
	private int prefer_30;
	private int prefer_40;
	private int prefer_50;
	private int prefer_60;
	private int prefer_M;
	private int prefer_F;
	private String menu_photo;
	private String loc;
	private String subject;
}
