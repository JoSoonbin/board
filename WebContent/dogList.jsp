<%@page import="java.util.HashMap"%>
<%@page import="vo.Dog"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<title>Insert title here</title>
<style type="text/css">
#listForm {
	width: 700px;
	height: 500px;
	border: 1px solid red;
	margin: 70px auto;
}

h2 {
	text-align: center;
}

table {
	margin: auto;
	width: 550px;
}

.div_empty {
	background-color: red;
	width: 100%;
	height: 100%;
	text-align: center;
}

#todayImageList {
	text-align: center;
}

#productImage {
	width: 150px;
	height: 150px;
	border: none;
}

#todayImage {
	width: 100px;
	height: 100px;
	border: none;
}
</style>
</head>
<body>

	<div class="container" style="margin-top: 100px; width: 740px;">
		<h2>개 상품 목록</h2>
		<hr>
		<div style="float: right;">
			<a href="dogRegistForm.dog">개상품등록</a>
		</div>
		<c:if test="${dogList != null}">
			<table class="table table-striped">
				<tbody>
					<c:forEach var="dog" items="${dogList }" varStatus="status">
						<tr style="border: 1px solid #999999;">
							<td>
								<div style="display: inline-block; width: 200px;">
									<a href="dogView.dog?id=${dog.id}"> <img
										src="images/${dog.image}" id="productImage" /></a>
								</div>
								<div style="display: inline-block;">
									상품명:${dog.kind} <br> 가격:${dog.price}<br>
								</div>
							</td>

						</tr>
						<c:if test="${((status.index+1) mod 4)==0 }">
							<tr>
							</tr>
						</c:if>
					</c:forEach>
				</tbody>
			</table>
		</c:if>

		<c:if test="${dogList==null }">
			<div class="div_empty">개상품이 없습니다. 분양불가</div>
		</c:if>
	</div>

	<!-- 오늘 본 목록 -->
	<c:if test="${todayImageList !=null }">
		<div class="container" style = "width:740px;">
			<h2>오늘 본 개 상품 목록</h2>
			<table class="table table-bordered">
				<tbody>
					<tr>
						<c:forEach var="todayImage" items="${todayImageList}" varStatus="status">
							<td style = "display:inline-block; width:117px;"><img src="images/${todayImage}" id="todayImage" /></td>
							<c:if test="${((status.index+1) mod 4)==0 }">
					</tr>
					<tr>
						</c:if>
						</c:forEach>
					</tr>
				</tbody>
			</table>
		</div>
	</c:if>





</body>
</html>