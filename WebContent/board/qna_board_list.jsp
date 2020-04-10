<%@page import="vo.PageInfo"%>
<%@page import="vo.BoardBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@include file="../header.jsp"%>

<%
	ArrayList<BoardBean> articleList = (ArrayList<BoardBean>) request.getAttribute("articleList");
	PageInfo pageInfo = (PageInfo) request.getAttribute("pageInfo");
	int listCount = pageInfo.getListCount();
	int nowPage = pageInfo.getPage(); // 사용자가 선택한(찍은) 페이지
	int maxPage = pageInfo.getMaxPage();
	int startPage = pageInfo.getStartPage();
	int endPage = pageInfo.getEndPage();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<title>MVC 게시판</title>
<style type="text/css">
#registForm {
	width: 500px;
	height: 600px;
	border: 1px solid red;
	margin: auto;
}

h2 {
	text-align: center;
}

table {
	margin: auto;
	width: 450px;
}

#tr_top {
	background: orange;
	text-align: center;
}

#pageList {
	margin: auto;
	width: 500px;
	text-align: center;
}

#emptyArea {
	margin: auto;
	width: 500px;
	text-align: center;
}
</style>
</head>

<body>
	<!-- 게시판 리스트 -->
	<div class="container" style = "margin-top : 100px">
		<h2>게시판</h2>
		<hr style = "width: 100%;">
		
		<%
			if (articleList != null && listCount > 0) {
		%>
		
		<table class="table table-hover">
			<thead>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>날짜</th>
				<th>조회수</th>
			</tr>
			</thead>
			<tbody>
			<%
				for (int i = 0; i < articleList.size(); i++) {
			%>
			<tr>
				<td><%=articleList.get(i).getBOARD_NUM()%></td>

				<td>
					<%
						if (articleList.get(i).getBOARD_RE_LEV() != 0) {
					%> <%
 	for (int a = 0; a <= articleList.get(i).getBOARD_RE_LEV() * 2; a++) {
 %>
					&nbsp; <%
 	}
 %> ▶ <%
 	} else {
 %> ▶ <%
 	}
 %> <a
					href="boardDetail.bo?board_num=<%=articleList.get(i).getBOARD_NUM()%>&page=<%=nowPage%>">
						<%=articleList.get(i).getBOARD_SUBJECT()%>
				</a>
				</td>

				<td><%=articleList.get(i).getBOARD_NAME()%></td>
				<td><%=articleList.get(i).getBOARD_DATE()%></td>
				<td><%=articleList.get(i).getBOARD_READCOUNT()%></td>
			</tr>
			<%
				}
			%>
			</tbody>
		</table>
	</div>


	<section id="pageList">
		<%
			if (nowPage <= 1) {
		%>
		[이전]&nbsp;
		<%
			} else {
		%>
		<a href="boardList.bo?page=<%=nowPage - 1%>">[이전]</a>
		<%
			}
		%>

		<%
			for (int a = startPage; a <= endPage; a++) {
					if (a == nowPage) {
		%>
		[<%=a%>]
		<%
			} else {
		%>
		<a href="boardList.bo?page=<%=a%>">[<%=a%>]
		</a>
		<%
			}
		%>
		<%
			}
		%>

		<%
			if (nowPage >= maxPage) {
		%>
		<%-- 현재 위치가 마지막 페이지인 경우 [다음]에 링크가 없음 --%>
		[다음]
		<%
			} else {
		%>
		<a href="boardList.bo?page=<%=nowPage + 1%>">[다음]</a>
		<%
			}
		%>
	</section>
	<%
		} else {
	%>
	<section id="emptyArea">등록된 글이 없습니다.</section>
	<%
		}
	%>

</body>
</html>