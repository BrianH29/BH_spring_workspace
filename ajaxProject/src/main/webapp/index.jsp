<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- jQuery 라이브러리 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>
<body>

	<h4>Spring에서의 AJAX </h4>
	
	<h3>1. 서버요청(요청시 전달값 두개) 후 그에 해당하는 응답 결과(문자열) 받기</h3>
	
	이름 : <input type="text" id="name"> <br>
	나이 : <input type="number" id="age"> <br>
	
	<button id="btn1">전송</button>
	
	<div id ="result1">현재 응답결과 없음</div>
	
	<script>
		$(function(){
			$("#btn1").click(function(){
				
				//동기식요청 
				//location.href = "ajax1.do?name" + $("#name").val() + "$age" + $("#age").val();
				
				//비동기식요청
				$.ajax({
					url:"ajax1.do",
					data:{
						name:$("#name").val(),
						age:$("#age").val()
					},
					success:function(data){
						//console.log(data)
						$("#result1").text(data); 
					}, error:function(){
						console.log("ajax통신 실패");
					}
				});
				
			});
		});
	</script>

</body>
</html>