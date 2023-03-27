<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">

    

   

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <title>BOBJO</title>
    <style>
        @import url("http://fonts.googleapis.com/earlyaccess/nanumgothic.css");
	
	html {
		height: 100%;
	}
	
	body {
	    width:100%;
	    height:100%;
	    margin: 0;
  		padding-top: 200px;
  		padding-bottom: 40px;
  		font-family: "Nanum Gothic", arial, helvetica, sans-serif;
  		background-repeat: no-repeat;
	}
	
    .card {
        margin: 0 auto; /* Added */
        float: none; /* Added */
        margin-bottom: 10px; /* Added */
	}

    #btn-Yes{
        background-color: #ff7331;
        border: none;
    }
	
	.login .form-control {
  		position: relative;
  		height: auto;
  		-webkit-box-sizing: border-box;
     	-moz-box-sizing: border-box;
        	 box-sizing: border-box;
  		padding: 10px;
  		font-size: 16px;
	}
    .checkbox{
        margin-right: 20px;
        text-align: right;
    }
    .card-title{
        margin-left: 30px;
    }

<<<<<<< HEAD
    .links{
        text-align: center;
        margin-bottom: 10px;
    }
=======
.login_logo{
    margin :30px 0 30px 0;
    color:#262626;
    font-size: 40px;
    font-weight: 100px;
}
>>>>>>> branch 'master' of https://github.com/seonn123/Bobjo.git

    a{ 
    	color: #ff7331; text-decoration: none; 
    }
    .check{
    	color : red;
    }
	 

    a{
    	color: #ff7331; text-decoration: none;
    }
    .check{
    	color : red;
    }
	

    </style>
  </head>

  <body cellpadding="0" cellspacing="0" marginleft="0" margintop="0" width="100%" height="100%" align="center">
  
        <!-- 헤더 -->
    
     	      <jsp:include page="../inc/header2.jsp" />
     	
     	<!-- 헤더 -->
  

	<div class="card align-middle" style="width:25rem;">
		<div class="card-title" style="margin-top:30px;">

			<h2 class="card-title" style="color:#ff7331; text-align:left;"> 회원탈퇴 </h2>
		</div>
     
      <form action="./MemberDeleteProAction.me" class="login" method="POST">
      		
		<div class="card-body">
        <input type="text" name="m_id" id="m_Id" class="form-control" value="${m_id }" readonly><BR>
        <input type="password" name="pw" id="Pw" class="form-control" placeholder="비밀번호"  required><br>
         <p id="check" class="check">${login_msg}</p><br/>       
        <input id="btn-Yes" class="btn btn-lg btn-primary btn-block" type="submit" value="탈 퇴 하 기" onclick="delOk()">

   <script type="text/javascript">
       function delOk(){
	      if(confirm('정말 탈퇴하시겠습니까?')){
		     location.href="./MemberDeleteProAction.me";
	        }
       }
  
    </script>
        
        </div>
      </form>  
    </div>  

  
  </body>
</html>