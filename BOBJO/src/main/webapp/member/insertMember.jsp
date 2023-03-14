<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

 <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard/dist/web/static/pretendard.css" />
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@300;400;700&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css">
  <link rel="stylesheet" href="./css/main.css">
  <script defer src="./js/main.js"></script>

</head>
<body>
   <div class="container">
    <div class="content">
      <!-- HEADER -->
      <header>
        <h2>회원가입</h2>
      </header>

      <!-- INPUT -->
     
  <form action="./MemberJoinAction.me" method="post" name="fr" onsubmit="return sendSubmit();">
      <section>
        <div class="info" id="info__id">
          <div id="id-input">
            <input class="box" type="text" placeholder="아이디 입력(6~20자)" autofocus name="m_id"/>
            <button id="id-check">중복 확인</button>
          </div>
          <div class="error-msg"></div>
        </div>
        <div class="info" id="info__pw">
          <input class="box" type="password" placeholder="비밀번호 입력 (문자, 숫자, 특수문자 포함 8~20자)" name="pw"/>
          <div class="error-msg"></div>
        </div>
        <div class="info" id="info__pwRe">
          <input class="box" type="password" placeholder="비밀번호 재입력" name="pw"/>
          <div class="error-msg"></div>
        </div>
        
        <div class="info" id="info__birth">
          <div id="birth-flex">
            <input class="box" type="text" placeholder="이름" name="m_name"/>
           </div> 
          </div> 
          
         <div class="info" id="info__mobile">
          <input class="box" type="text" placeholder="휴대폰 번호 입력 (‘-’ 제외 11자리 입력)" name="phone"/>
          <div class="error-msg"></div>
        </div>  
        
        <div class="info" id="info__birth">
          <div id="birth-flex">
            <input class="box" type="text" placeholder="닉네임" name="nickname"/>
           </div> 
          </div> 
        
        <div class="info" id="info__email">
          <input class="box" id="email-txt" type="text" placeholder="이메일 입력" name="email"/>
          <span>@</span>
          <input class="box" id="domain-txt" type="text"/>
          <select class="box" id="domain-list">
            <option value="type">직접 입력</option>
            <option value="naver.com">naver.com</option>
            <option value="google.com">google.com</option>
            <option value="nate.com">nate.com</option>
            <option value="kakao.com">kakao.com</option>
          </select>
        </div>
        
       
       <h4>음주레벨을 선택해주세요</h4>
       <h6>선택시 어울리는 음식을 추천해드립니다.</h6>
       <div class="info" id="info__level" name="alcohol_level">
          <input type="radio" name="level" value="1level"> 1level
          <input type="radio" name="level" value="2level"> 2level
          <input type="radio" name="level" value="3level"> 3level
          <input type="radio" name="level" value="4level"> 4level
          <input type="radio" name="level" value="5level"> 5level      
       </div>   
         
       </section>
      <div id="result-fail"></div>
          <button id="submit" type="submit">가입하기</button>
       </div>
     </div> 
</form>        
       
   
     
          
            

</body>
</html>