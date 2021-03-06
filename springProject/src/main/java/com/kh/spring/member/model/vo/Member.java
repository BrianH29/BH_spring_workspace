package com.kh.spring.member.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

/*
 * * Lombok(롬복)
 * 
 * 롬복은 자바에서 vo 클래스를 만들때 필드에 맞춰서
 * getter/setter, toString, 생성자 등등 반드시 필요하는 코드들을
 * 어노테이션을 통해 자동으로 내부적으로 만들어지게끔 하는 라이브러리 
 * 
 * => 필드를 수정하거나 뒤늦게 추가한다거나 했을 때 set/getter, constructor, toString 다 수정할 필요없음 
 * 
 * 1. Maven을 이용해서 라이브러리 추가 
 * 2. 롬복은 라이브러리 추가만으로는 안되고 설치해야됨!!
 *    .jar 파일 찾아서 더블클릭해서 Install
 * 3. 이클립스 또는 STS 재부팅(restart)
 * 4. 어노데이션 기술 
 * 
 */
@NoArgsConstructor
@AllArgsConstructor
@Setter 
@Getter
@ToString
public class Member {
	
	private String userId;
	private String userPwd;
	private String userName;
	private String email;
	private String gender;
	private String age;
	private String phone;
	private String address;
	private Date enrollDate;
	private Date modifyDate;
	private String status; 
	
}
