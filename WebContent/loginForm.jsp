<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@include file = "../header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<title>로그인 페이지</title>
<style>
	#loginformArea{
	    margin : auto;
		width : 400px;
		border : 1px solid gray;
		margin-top : 100px;
		padding-bottom: 20px;
	}
	table{
		width : 380px;
		margin : auto;
		text-align: center;
	}
</style>
</head>
<body>
<section id = "loginformArea">

<div class="container">
  <h2>로그인 페이지</h2>
  <form name="loginform" action="./memberLoginAction.me" method="post">
    <div class="form-group">
      <label for = "MEMBER_ID">아이디 : </label>
      <input type="text" name="MEMBER_ID" class="form-control" id="MEMBER_ID" placeholder="Enter ID" style = "width:300px">
    </div>
    <div class="form-group">
      <label for = "MEMBER_PW">비밀번호 : </label>
      <input type="password" name="MEMBER_PW" class="form-control" id="MEMBER_PW" placeholder="Enter password" style = "width:300px">
    </div>
<!--     <div class="checkbox"> -->
<!--       <label><input type="checkbox"> Remember me</label> -->
<!--     </div> -->
    <button type="submit" class="btn btn-default">로그인</button>
    <button type="button" class="btn btn-default" onclick="location.href='./memberJoin.me'">회원가입</button>
    
  </form>
</div>


<!-- <form name="loginform" action="./memberLoginAction.me" method="post"> -->
<!-- <table> -->
<!-- 	<tr> -->
<!-- 		<td colspan="2"> -->
<!-- 			<h1>로그인 페이지</h1> -->
<!-- 		</td> -->
<!-- 	</tr> -->
<!-- 	<tr><td><label for = "MEMBER_ID">아이디 : </label></td><td><input type="text" name="MEMBER_ID" id = "MEMBER_ID"/></td></tr> -->
<!-- 	<tr><td><label for = "MEMBER_PW">비밀번호 : </label></td><td><input type="password" name="MEMBER_PW" id = "MEMBER_PW"/></td></tr> -->
<!-- 	<tr> -->
<!-- 		<td colspan="2"> -->
<!-- 			<a href="javascript:loginform.submit()">로그인</a>&nbsp;&nbsp; -->
<!-- 			<a href="memberJoin.me">회원가입</a> -->
<!-- 		</td> -->
<!-- 	</tr> -->
<!-- </table> -->
<!-- </form> -->
</section>
</body>
</html>