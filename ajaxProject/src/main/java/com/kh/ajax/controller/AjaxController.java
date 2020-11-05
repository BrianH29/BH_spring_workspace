package com.kh.ajax.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class AjaxController {
	
	/*
	 * 1.HttpServletResponse 객체로 응답데이터 응답하기
	 *   기존에 jsp/servlet때 했던 Stream을 통해서 출력
	 */
	
	/* spring 에서 response 객체 없이 사용하기
	@RequestMapping("ajax1.do")
	public void ajaxMethod1(String name, int age, HttpServletResponse response) throws IOException {

		//요청처리 다했다는 가정하에 요청한 그페이지에 응답할 데이터가 있을 경우
		//int result = aService.insertMember(name,age); 
		String responseData = "응답 문자열:" + name + "은" + age + "살입니다.";
		
		response.setContentType("text/html; charset=utf-8"); //throws 예외처리 떠넘기기
		PrintWriter out = response.getWriter(); 
		out.print(responseData);
	}
	*/
	
	/*
	 * 2. @ResponseBody를 이용한 방식
	 *    응답할 데이터를 문자열로 리턴
	 *    
	 *    단, 원래 문자열 리턴하면 포워딩 방식으로 인식(응답뷰명으로 인식해버림)
	 *    => 리턴하는 문자열 앞과 뒤에 뭔가가 붙어서 포워딩하려고 듬
	 *    따라서 내가 리턴하는 문자열이 응답뷰명이 아닌 응답데이터야 라는 걸 선언하는 어노테이션 기술해야됨!
	 *    => @ResponseBody 임
	 *    
	 *    뿐만 아니라 응답데이터에 한글이 있다거나, json 객체 형태일 경우
	 *    반드시 응답할 데이터에 대한 contentType값을 기술해놔야됨!
	 *    =>@RequestMapping 어노테이션 produces 속성값으로 기술 
	 */
	@ResponseBody // 내가 리턴하는 값이 뷰가 아니라 응답 데이터 라는 것을 표현 
	@RequestMapping(value="ajax1.do", produces="text/html; charset=utf-8")
	public String ajaxMethod1(String name, int age) {
		String responseData = "응답 문자열:" + name + "은" + age + "살입니다.";
		
		return responseData; // 기본적으로 문자열리턴하면 포워딩 방식 
	}
	
	
}
