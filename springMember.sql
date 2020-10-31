--회원서비스

-- 로그인
select
        user_id
      , user_pwd
      , user_name
      , email
      , gender
      , age
      , phone
      , address
      , enroll_date
      , modify_date
      , status
   from member
  where status='Y'
    and user_id = 사용자가입력한아이디
    and user_pwd = 사용자가입력한비번;

-- 회원가입 요청시 실행할 sql문
insert
  into member
     (
       user_id
     , user_pwd
     , user_name
     , email
     , gender
     , age
     , phone
     , address
     )
values
     (
       ?
     , ?
     , ?
     , ?
     , ?
     , ?
     , ? 
     , ?
     );
     
-- 정보변경 요청시 실행할 sql문
update
       member
   set 
       email = #{email}
     , gender = #{gender}
     , age = #{age}
     , phone = #{phone}
     , address = #{address}
     , modify_date = sysdate
 where user_id = 로그인요청한회원아이디; 
    
-- 회원 탈퇴 요청시 실행할 sql문
update
       member
   set 
       status='N'
     , modify_date = sysdate
 where user_id = #{userId};
 
 -- *자유게시판 서비스
 --1.게시판 리스트 조회시
 --1_1. 현재 유효한 게시글 총 갯수 조회
select
       count(*)
  from board
 where status='Y';
 
 --1_2. 사용자가 요청한 페이지에 필요한 게시글 리스트 조회
select
		       board_no
		     , board_title
		     , board_writer
		     , count
		     , to_char(create_date,'YYYY.MM.DD') create_date
		     , origin_name
		  from board
		 where status = 'Y'
		 order 
		    by board_no desc; 
     
     
     
     
     
     
     
     
     
     
     
     