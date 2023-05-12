package com.yedam.user.domain;

import java.util.Date;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Data

public class UserVO {
	private String userId;		//user_id
	private String userPw;		//user_pw
	private String userNm;		//user_nm(이름)
	private String userPhone;	//user_phone(전화번호)
	private String userAdd;		//user_add(주소)
	private String userGrade;	//user_grade(등급)
	private Date userDate;		//user_date(가입날짜)
	private int userPoint;	//user_point(포인트)
	//인증여부 구현
	//인증키 구현
}
