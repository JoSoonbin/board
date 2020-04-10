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
<title>Insert title here</title>
<style>
	#joinformArea{
		width : 400px;
		margin : auto;
		border : 1px solid gray;
	}
	table{
		width : 380px;
		margin :  auto;
		text-align: center;
	}
</style>
</head>
<body>

<div class="container" style = "width: 600px; margin-top : 100px;">
  <h2>회원가입 페이지</h2>
  <hr>
  <form name="joinform" action="./memberJoinAction.me" method="post">
    <div class="form-group">
      <label for = "MEMBER_ID">아이디 : </label>
      <input type="text" name="MEMBER_ID" class="form-control" id="MEMBER_ID" placeholder="Enter id">
    </div>
    <div class="form-group">
      <label for = "MEMBER_PW">비밀번호 : </label>
      <input type="password" class="form-control" id="MEMBER_PW" placeholder="Enter password" name="MEMBER_PW">
    </div>
    <div class="form-group">
      <label for = "MEMBER_NAME">이름 : </label>
      <input type="text" class="form-control" id="MEMBER_NAME" placeholder="Enter name" name="MEMBER_NAME">
    </div>
    <div class="form-group">
      <label for = "MEMBER_AGE">나이 : </label>
      <input type="text" class="form-control" maxlength="2" id="MEMBER_AGE" placeholder="Enter age" name="MEMBER_AGE">
    </div>
    <div class="form-group">
      <label for = "MEMBER_GENDER">성별 : </label>
      <input type="radio" class="form-control" name="MEMBER_GENDER" value="남" checked="checked" id = "MEMBER_GENDER" 
      style = "width:20px; display : inline; margin-left: 10px;" />남자
	  <input type="radio" class="form-control"  name="MEMBER_GENDER" value="여" 
	  style = "width:20px; display : inline; margin-left: 10px;"/>여자
    </div>
    <div class="form-group">
      <label for="MEMBER_EMAIL">이메일 주소:</label>
      <input type="email" class="form-control" id="MEMBER_EMAIL" placeholder="Enter email" name="MEMBER_EMAIL">
    </div>
    <button type="submit" class="btn btn-default">회원가입</button>
    <button type="reset" class="btn btn-default">다시작성</button>
  </form>
</div>


</body>
</html>