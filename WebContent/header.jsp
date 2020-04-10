<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "vo.MemberBean" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import = "vo.MemberBean" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  
  
  
<title>:: BIT SHOP ::</title>
</head>
<body>

<nav class="navbar navbar-inverse navbar-fixed-top">
	<div class="container-fluid">
		<div class="navbar-header">
			<a class="navbar-brand" href="#">BIT Shopping Mall</a>
		</div>
		<ul class="nav navbar-nav">
			<li class="active"><a href="shopMain.jsp">Home</a></li>
			<li><a href="dogList.dog">개 상품 목록</a></li>
			<li><a href="boardList.bo">게시판</a></li>
			<li style="float:right;"><a href = "dogCartList.dog">장바구니</a></li>
			<li><a href="memberListAction.me">회원 목록</a></li>
		</ul>
		<ul class="nav navbar-nav navbar-right">
			<li><a href="memberJoin.me"><span class="glyphicon glyphicon-user"></span>
					Sign Up</a></li>
			<li><a href="loginForm.jsp"><span class="glyphicon glyphicon-log-in"></span>
					Login</a></li>
		</ul>
	</div>
	</nav>

</body>
</html>