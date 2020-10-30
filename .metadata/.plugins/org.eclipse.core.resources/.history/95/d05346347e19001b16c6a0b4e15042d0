package com.kh.spring.member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.spring.member.model.service.MemberService;
import com.kh.spring.member.model.vo.Member;

@Controller	// 어노테이션을 붙여줌으로써 해당 이 클래스 빈으로 등록됨(빈스케닝을 통해서)
public class MemberController {
	
	// Autowired 어노데이션을 붙여주면 직접 객체 생성할 필요없이 변수 선언만으로 
	// 스프링이 관리하고 있는 해당 객체 자동으로 생성한 후 주입해줌 
	// 단, MemberServiceImpl 객체를 스프링이 관리하도록 빈으로 등록해야됨!! 
	
	@Autowired // 의존성 주입
	private MemberService mService;
	//private MemberService mService = new MemberServiceImpl(); 
	
	//* 파라미터(요청시 전달값)를 전송받는 방법  == 요청시 전달되는 값들 처리방법
	/*
	 * 1. HttpServletRequest로 총 전송받기 (기존의 jsp/servlet 떄의 방식)
	 * 	  해당 메소드 매겨변수로 HttpyServletRequest를 작성하면
	 *   내부적으로 메소드 실행시 스프링컨데이너가 자동으로 해당 객체를 인자로 주입해줌
	 */
	/*
	@RequestMapping("login.me") // 서블릿이라고 생각하면 됨 @RequestMapping 어노테이션을 붙여줌으로써 HandlerMapping
	public void loginMember(HttpServletRequest request) {
		
		String userId = request.getParameter("id"); 
		String userPwd = request.getParameter("pwd");
		
		System.out.println("ID:" + userId);
		System.out.println("pwd:" + userPwd);
		*/
	
		/*
		 * 2. @RequestParam 어노데이션 방식
		 * 	  스프링에서는 조금 더 간단하게 파라미터(요청시 전달값)를 받아올 수 있는 방법 제공
		 *   @RequestParam(value=="키") == request.getParameter("키")
		 */
	
		/*
		@RequestMapping("login.me")
		public void loginMember(@RequestParam(value="id", defaultValue="aaa")String userId, 
							    @RequestParam("pwd")String userPwd) {
			
			System.out.println("ID:" + userId);
			System.out.println("pwd:" + userPwd);
	}
	*/
		/*
		 * 3.@RequestParam 어노테이션 생략하는 방식
		 * 	 키값과 받아주는 메개변수 명이 같으면 
		 * 	위의 어노테이션을 생략해도 파라미터값을 가벼와서 변수에 저장 가능
		 *  "단, 매개변수를 name 값과 동일하게 해야 자동으로 값이 주입됨!! 
		 */
	
	/*
		@RequestMapping("login.me")
		public void loginMember(String userId, String userPwd) {
			System.out.println("ID:" + userId);
			System.out.println("pwd:" + userPwd);
			
			Member m = new Member();
			m.setUserId(userId);
			m.setUserPwd(userPwd);
		}
	*/
	
		/*
		 * 4. @ModelAttribute를 이용한 방식
		 * 	  요청시 전달되는 값들이 많을 경우 VO 객체에 바로 담아내고자 할때 쓰이는 방식 
		 *   --> 기본생성자와 setter를 이용한 주입 방식!! 
		 *   
		 *   커멘드 객체 방식이라고 함!
		 *   스프링컨테이너가 내부적으로 해당 객체 기본생성자로 생성한 후 setter메소드로
		 *   요청시 전달값들을 각 필드에 주입하는 방식!!
		 *   (주의: 반드시 name속성값이 내가 바로 담고자 하는 VO 객체의 필드명과 동일해야함!!)
		 */
		
	/*
		@RequestMapping("login.me")
		public void loginMember(@ModelAttribute Member m) {
			System.out.println("ID : " + m.getUserId());
			System.out.println("PWD :" + m.getUserPwd());
		}
	*/
	
		
		/*
		 * 5. 위의 @ModelAttribute 어노테이션 생략하고 바로 커멘드객체에 담기
		 */
		
	/*
		@RequestMapping("login.me")
		public String loginMember(Member m, HttpSession session) {
			
			//맴버 컨트럴에서 이제 다 쓰일거 이기 때문에 필드 부로 뺴서 다 쓰게 하기 
			//MemberService mService = new MemberServiceImpl(); 
			
			//Member m = new MemberServiceImpl().loginMember(m); 
			
			
			 * 내가 직접 new 키워드를 통해서 객체 생성하게 되면
			 * 해당 객체와의 결합도가 강해짐!! 
			 * 
			 * 문제점 1. 생성하고 있는 클래스명이 바뀌었을 경우 => 객체 생성하는 구문에 빨간줄 => 코드를 수정해야만 함!
			 * 문제점 2. 매 요청때마다 생성된 객체의 주소값 달라짐 => 즉, 계속이 새로 객체 생성
			 * 		   => 10000건 요청이 있다면 10000개의 객체가 생성되고 사라지게 됨(new 라는 키워드로 발생하는 문제점)
			 * 
			 * 결합도를 낮추지 위해 의존성 주입(DI dependency injection)을 이용해보자! 
			 * 해결 1. 필요로하는 객체의 클래스명이 바뀌었을 때 코드를 수정할 필요 없어짐
			 * 해결 2. 매 요청마다 같은 객체의 주소값 동일함(즉, 한 개의 객체만 생성해놓고 재상용의 개념 == 싱글톤)
			 *       => 10000건의 요청이 있어도 1개의 객체만 관리하면 됨 --> 메모리 효율이 올라감 
			 
			
			//System.out.println(mService);
			
			Member loginUser = mService.loginMember(m);
			if(loginUser == null) { //로그인 실패 => 애러문구 담아서 에러페이지 "포워딩" 
				//request.getRequestDispatcher("").forward(request,response);
				return "common/errorPage"; 
				
				// 여기서 리턴한 문자열(View명)이
				// servlet-context.xml 문서에 ViewResolver 빈 등록하는 구문에
				// 기술되엉있는 prefix값인 /WEB-INF/views/ 이런 값이 앞에 붙고
				// 			suffix값인 .jsp 			  이런 값이 뒤에 붙어서 포워딩 됨
				
			} else { // 로그인 성공 => session영역 loginUser 담은 후=> 메인페이지 url 재요청
				session.setAttribute("loginUser",loginUser); 
				
				// url 재요청하는 redirect 방식을 하고 싶다면!
				return "redirect:/";  // --> redirect:/메인으로 감 / redirect:list.bo / redirect:board.bo 등 
			}
		}
		*/
	
		// * 요청 처리 후 응답페이지에 응답할 데이터가 있을 경우에 대한 방법
		/*
		 * 1.Model 이라는 객체를 사용하는 방법
		 *   Model 이라는 객체를 사용하면 응답 뷰로 전달하고자하는 데이터를 key-value로 담을 수 있음
		 *   scope는 request이다.
		 *   단, setAttribute가 아님 addAttribute
		 */
		/*
		@RequestMapping("login.me")
		public String loginMember(Member m, HttpSession session, Model model) {
			
			Member loginUser = mService.loginMember(m); 
			
			if(loginUser == null) { //로그인 실패 => 애러문구 담아서 에러페이지 "포워딩" 
				
				model.addAttribute("errorMsg", "로그인 실패했습니다."); //scope는 request임
				return "common/errorPage"; 
			} else { // 로그인 성공 => session영역 loginUser 담은 후=> 메인페이지 url 재요청
				
				session.setAttribute("loginUser", loginUser);
				return "redirect:/"; //메인페이지 요청 
			}
		}
		*/
	
		/*
		 * 2.ModelAndView 객체를 사용하는 방법 
		 * 
		 * 위에서 Model은 응답할 데이터를 맵 형식(key-value)로 담을 수 있는 공간이라면
		 * View는 RequestDispatcher처럼 fowarding 할 뷰 페이지 정보를 담을 수 있는 공간 
		 * 
		 * ModelAndView는 이 두가지를 합쳐놓은 객체 == 응답데이터도 담을수 있고, 응답할 뷰 페이지에 대한 정보도 담을 수 있음
		 * 
		 */
		@RequestMapping("login.me")
		public ModelAndView loginMember(Member m, HttpSession session, ModelAndView mv) {
			Member loginUser = mService.loginMember(m); 
			
			if(loginUser == null) {
				mv.addObject("errorMsg","로그인 실패");
				mv.setViewName("common/errorPage");
			}else {
				session.setAttribute("loginUser", loginUser);
				session.setAttribute("alertMsg", loginUser.getUserName() + "님 환영합니다!");
				mv.setViewName("redirect:/");
			}
			
			return mv; 
		}//e.loginMember
		
		@RequestMapping("logout.me")
		public String logoutMember(HttpSession session) {
			session.invalidate();
			return "redirect:/";
		}
		
		@RequestMapping("enrollForm.me")
		public String enrollForm() {
			return "member/memberEnrollForm";
		}
		
		@RequestMapping("insert.me")
		public void insertMember(Member m) {
			
			System.out.println("m : " + m);
			
			/*
			 * 1.한글 부분이 깨져있음!
			 *   POST 방식 요청은 인코딩 해야됨!!
			 *   => 스프링에서 제공하고 있는 인코딩 필터 추가하면 끝! => web.xml에 
			 */
		}
}
