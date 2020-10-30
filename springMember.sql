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
     
     )