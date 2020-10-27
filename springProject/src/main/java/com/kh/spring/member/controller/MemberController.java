package com.kh.spring.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller	// 어노테이션을 붙여줌으로써 해당 이 클래스 빈으로 등록됨(빈스케닝을 통해서)
public class MemberController {

	@RequestMapping("login.me") // 서블릿이라고 생각하면 됨 @RequestMapping 어노테이션을 붙여줌으로써 HandlerMapping
	public void loginMember() {
		System.out.println("실행됨???");
	}
}