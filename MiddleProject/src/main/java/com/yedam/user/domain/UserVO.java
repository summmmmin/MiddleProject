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
	private String userPh;		//user_phone(전화번호)
	private String userAddr;	//user_add(주소, 헷갈려서 r붙임)
	private String userGrade;	//user_grade(등급)
	private Date userDate;		//user_date(가입날짜, sysdate)
	private String userPoint;	//user_point(포인트)
	//인증여부 구현
	//인증키 구현
}
