<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.content {
	background-color: rgb(247, 245, 245);
	width: 80%;
	margin: auto;
}

.innerOuter {
	border: 1px solid lightgray;
	width: 80%;
	margin: auto;
	padding: 5% 15%;
	background: white;
}
</style>
</head>
<body>
    <!-- 이쪽에 메뉴바 포함 할꺼임 -->
    <jsp:include page="../common/menubar.jsp"/>
    
    <div class="content">
        <br><br>
        <div class="innerOuter">
            <h2>회원가입</h2>
            <br>

            <form id="enrollForm" action="insert.me" method="post">
                <div class="form-group">
                    <label for="userId">* ID :</label>
                    <input type="text" class="form-control" id="userId" name="userId" placeholder="Please Enter ID" required>
                    <div id="checkResult" style="font-size:0.8em"></div>
                    
                    <br>
                    <label for="userPwd">* Password :</label>
                    <input type="password" class="form-control" id="userPwd" name="userPwd" placeholder="Please Enter Password" required><br>
                    
                    <label for="checkPwd">* Password Check :</label>
                    <input type="password" class="form-control" id="checkPwd" placeholder="Please Enter Password" required><br>
                    
                    <label for="userName">* Name :</label>
                    <input type="text" class="form-control" id="userName" name="userName" placeholder="Please Enter Name" required><br>
                    
                    <label for="email"> &nbsp; Email :</label>
                    <input type="email" class="form-control" id="email" name="email" placeholder="Please Enter Email"><br>
                    
                    <label for="age"> &nbsp; Age :</label>
                    <input type="number" class="form-control" id="age" name="age" placeholder="Please Enter Age"><br>
                    
                    <label for="phone"> &nbsp; Phone :</label>
                    <input type="tel" class="form-control" id="phone" name="phone" placeholder="Please Enter Phone (-없이)"><br>
                    
                    <label for="address"> &nbsp; Address :</label>
                    <input type="text" class="form-control" id="address" name="address" placeholder="Please Enter Address"><br>
                    
                    <label for=""> &nbsp; Gender : </label> &nbsp;&nbsp;
                    <input type="radio" name="gender" id="Male" value="M">
                    <label for="Male">남자</label> &nbsp;&nbsp;
                    <input type="radio" name="gender" id="Female" value="F">
                    <label for="Female">여자</label><br>
                    
                </div>
                <br>
                <div class="btns" align="center">
                    <button id="enrollBtn" type="submit" class="btn btn-primary" disabled>회원가입</button>
                    <button type="reset" class="btn btn-danger"> 초기화</button>
                </div>
            </form>
        </div>
        
        <script>
        	$(function(){
        	
        		// 아이디 입력할 수 있는 input요초 객체
        		var $idInput = $("#enrollForm input[name=userId]");
        		
        		$idInput.keyup(function(){
        			//console.log( $idInput.val());
        			
        			//적어도 최소한 5글자 이상으로 입력했을 때만 중복체크 하도록
        			if($idInput.val().length >= 5){
        				
        				$.ajax({
        					url:"idCheck.me",
        					data:{
        						userId:$idInput.val()
        					},
        					success:function(result){	// 성공시 담을 매개변수 생성 result
        						
        						if(result == 'success'){
        							//사용가능 한 아이디(중복 아이디 X)
        							// => 메세지 초록색으로 출력 (사용O)
        							// => 버튼 활성화 
        							$("#checkResult").show(); 
        							$("#checkResult").css("color","green").text("*사용가능한 아이디입니다."); //메소드 체인잉
        							$("#enrollBtn").removeAttr("disbaled"); 
        							
        						}else{ 
        							// 중복 아이디 존대. 사용불가능
        							// => 메세지 빨간색 출력(중복된 아이디가 존재합니다. 다시 입력해주세요.)
        							// => 버튼 비활성화 
        							$("#checkResult").show();
        							$("#checkResult").css("color","red").text("*중복된 아이디가 존재합니다. 다시 이렵해주세요.");
        							$("#enrollBtn").attr("disabled",true); 
        							
        						}
        					
        					},
        					error:function(){
        						console.log("아이디 중복체크용 ajax 통신 실패");
        					}
        				});
        				
        			} else{	//사용자가 글 지워서 5개 이하로 바꼈을때 (중복체크할 가치가 없음); / 메시지도 안띄우고 / 버튼 비활성화 까지 
        				$("#checkResult").hide(); 
        				$("#enrollBtn").attr("disabled",true);
        			}
        		});
        	});
        </script>
        <br><br>
    </div>

    <!-- 이쪽에 푸터바 포함할꺼임 -->
    <jsp:include page="../common/footer.jsp"/>
    
</body>
</html>