package com.yedam.user.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@Data
@ToString
@AllArgsConstructor

public class KakaoVO {
	String token_type;					// 토큰타입
	String access_token;				// 사용자 액세스 토큰 값
	Integer expires_in;					// 액세스 토큰 만료 시간
	String refresh_token;				// 사용자 리프레쉬 토큰 값
	Integer refresh_token_expires_in;	// 리프레시 토큰 만료 시간
	String scope;						// 사용자 정보 조회 권한 범위

}
