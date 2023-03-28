<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<meta name="description" content="">
<meta name="author" content="">
<!-- Bootstrap CSS -->
    <title>리뷰 수정</title>
    <link href="https://fonts.googleapis.com/css2?family=Source+Sans+Pro&amp;display=swap" rel="stylesheet">
    <link rel="stylesheet" href="./css/header2.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
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

    .links{
        text-align: center;
        margin-bottom: 10px;
    }

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
	
	p.line_rv{
	margin: 20px 0 -10px 20px;
	}
	

    </style>
  </head>

  <body cellpadding="0" cellspacing="0" marginleft="0" margintop="0" width="100%" height="100%" align="center">
  
        <!-- 헤더 -->


<div class="header">
	<div class="container left">
	<a style="width: 500px height: 200px;" class="move" href="./Main.me">
		<img id="logo" src="./img/BOBJO!1.png">
	</a>
	</div>
   </div>	

	<div class="card align-middle" style="width:25rem;">
		<div class="card-title" style="margin-top:30px;">

            
			<h2 class="card-title" style="color:#ff7331; text-align:left;"> 리뷰수정 </h2>
		</div>
      <form action="./ReviewMod.rv" method="POST" enctype="multipart/form-data">
        <input type="text" name="store_no" value="${store_no }" hidden>
        <input type="text" name="review_no" value="${review_no }" hidden>
		<div class="card-body" style="color:#ff7331;">
  		<textarea rows="5" cols="40" class="form-control" name="content" placeholder="리뷰내용"></textarea>
         
        <div style="display: flex; justify-content: space-between; ">
        <div style="width: 120px;">
        <p class="line_rv">별점<p> <br> 
        <select name="score" class="form-control" style="padding: 9px; height: 45px;">
			<c:forEach var="i" begin="0" end="5">
				<option name="score" value="${i}">${i}</option>
				<c:if test="${i ne 5}">
					<option name="score" value="${i + 0.5}">${i + 0.5}</option>
				</c:if>
			</c:forEach>
		</select><br>
		</div>
		<div >
		</div>
		</div>
        <input id="btn-Yes" class="btn btn-lg btn-primary btn-block" type="submit" value="리 뷰 수 정">
    
		</div></form>
  
</div>
	
</body>
</html>