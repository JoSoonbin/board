<%@page import="vo.Dog"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<title>Insert title here</title>
<style type="text/css">
#listForm {
	width: 640px;
	margin: auto;
}

h2 {
	text-align: center;
}

img {
	width: 280px;
	height: 280px;
	border: none;
}

#content_main {
	height: 300px;
}

#content_left {
	width: 300px;
	float: left;
}

#content_right {
	width: 340px;
	float: left;
}

#commandList {
	text-align: center;
}

#desc {
	height: 170px;
	background: skyblue;
}
</style>
</head>
<body>
	<div class="container">
		<section id="listForm">
			<h2>${dog.kind}의상세정보</h2>

			<section id="content_main">
				<section id="content_left">
					<img src="images/${dog.image}" />
				</section>
				<section id="content_right">
					<dl>
						<dt>품종</dt>
						<dd>${dog.kind}</dd>
						<p></p>
						<dt>가격</dt>
						<dd>${dog.price}원</dd>
						<p></p>
						<dt>신장</dt>
						<dd>${dog.height}cm</dd>
						<p></p>
						<dt>체중</dt>
						<dd>${dog.weight}kg</dd>
						<p></p>
						<dt>원산지</dt>
						<dd>${dog.country}</dd>
						<p></p>
						<button type="button" class="btn btn-info" data-toggle="collapse"
							data-target="#demo">상세내용</button>
						<div id="demo" class="collapse">귀여움
					</dl>
	</div>
	</div>

	</section>
	<div style="clear: both"></div>
	<nav id="commandList">
		<a href="dogList.dog">쇼핑계속하기</a> <a href="dogCartAdd.dog?id=${dog.id}">장바구니에담기</a>
	</nav>
	</section>
	</section>
</body>
</html>