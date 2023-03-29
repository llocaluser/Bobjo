<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BOBJO</title>
          <!-- 아이디 중복체크를 위한 제이쿼리 -->
          <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.3/dist/jquery.min.js"></script>
          <!-- 아이디 중복체크를 위한 제이쿼리 -->

 <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard/dist/web/static/pretendard.css" />
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@300;400;700&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css">
  <link rel="stylesheet" href="./css/main.css">
  <script defer src="./js/main.js"></script>
  
  
  <script type="text/javascript">
	  function showCeoNoInput() {
		  const ceoCheck = document.getElementById("ceoCheck");
		  const ceoNoInput = document.getElementById("info_ceoNum");
	
		  if (ceoCheck.checked) {
		    ceoNoInput.style.display = "block";
		  } else {
		    ceoNoInput.style.display = "none";
		  }
		}
  </script>

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
            <input class="box" type="text" placeholder="아이디 입력(6~20자)" autofocus name="m_id" required="required"/>
            <button id="id-check">중복 확인</button>
          </div>
          <div class="error-msg"></div>
        </div>
        <div class="info" id="info__pw">
          <input class="box" type="password" placeholder="비밀번호 입력 (문자, 숫자, 특수문자 포함 8~20자)" name="pw" required="required"/>
          <div class="error-msg"></div>
        </div>
        <div class="info" id="info__pwRe">
          <input class="box" type="password" placeholder="비밀번호 재입력" name="pw" required="required"/>
          <div class="error-msg"></div>
        </div>
        
        <div class="info" id="info__birth">
          <div id="birth-flex">
            <input class="box" type="text" placeholder="이름" name="m_name" required="required"/>
           </div> 
          </div> 
          
         <div class="info" id="info__mobile">
          <input class="box" type="text" placeholder="휴대폰 번호 입력 (‘-’ 제외 11자리 입력)" name="phone" required="required" maxlength="11"/>
          <div class="error-msg"></div>
        </div>  
        
        <div class="info" id="info__birth">
          <div id="birth-flex">
            <input class="box" type="text" placeholder="닉네임" name="nickname"/>
           </div> 
          </div> 
          
        <div class="info" id="info__birth">
          <div id="birth-flex">
              <input class="box" type="email" placeholder="이메일" name="email"/>
           </div> 
        </div> 
          
          
       <h4>음주레벨을 선택해주세요</h4>
       <h6>선택시 어울리는 음식을 추천해드립니다.</h6>
       <div class="info" id="info__level" name="alcohol_level">
          <input type="radio" name="alcohol_level" value="1"> 1level
          <input type="radio" name="alcohol_level" value="2"> 2level
          <input type="radio" name="alcohol_level" value="3"> 3level
          <input type="radio" name="alcohol_level" value="4"> 4level
          <input type="radio" name="alcohol_level" value="5"> 5level      
       </div>

		<div class="info" id="info_ceoNum" style="display: none;">
			<input class="box" type="text" placeholder="사업자 등록번호 입력 (10자리)"
				name="ceo_num" maxlength="10"/>
			<div class="error-msg"></div>
		</div>
		<div class="info">
			<input type="checkbox" id="ceoCheck" name="ceoCheck"
				onchange="showCeoNoInput()" /> <label for="ceoCheck">사업자
				여부</label>
		</div>

				</section>
      <div id="result-fail"></div>
          <button id="submit" type="submit">가입하기</button>
</form>        
       </div>
     </div> 
       
   
     
          
            

</body>
</html>