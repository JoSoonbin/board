<%@page import="vo.BoardBean"%>
<%@page language="java" contentType="text/html; charset=UTF-8"%>

<%
	BoardBean article = (BoardBean) request.getAttribute("article");
	String nowPage = (String) request.getAttribute("page");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MVC 게시판</title>
<style type="text/css">
#articleForm {
	width: 500px;
	height: 500px;
	margin: auto;
}

h2 {
	text-align: center;
}

#basicInfoArea {
	height: 40px;
	text-align: left;
}

#articleContentArea {
	background: white;
	border: 1px solid black;
	margin-top: 100px;
	height: 350px;
	text-align: left;
	overflow: auto;
}

#commandList {
	text-align: center;
}
</style>
</head>

<body>
	<div class="row">
		<div class="col-xs-2 col-md-2"></div>
		<div class="col-xs-8 col-md-8">
			<h2 class="text-center">게시글 보기</h2>
			<p>&nbsp;</p>
			<div class="table table-responsive">
				<table class="table">
					<tr>
						<th class="success">글번호</th>
						<td><%=article.getBOARD_NUM()%></td>
						<th class="success">조회수</th>
						<td><%=article.getBOARD_READCOUNT()%></td>
					</tr>


					<tr>
						<th class="success">작성자</th>
						<td><%=article.getBOARD_NAME()%></td>
						<th class="success">작성일</th>
						<td><%=article.getBOARD_DATE()%></td>
					</tr>

					<tr>
						<th class="success">제목</th>
						<td colspan="3"><%=article.getBOARD_SUBJECT()%></td>
					</tr>
					<tr>
						<th class="success">첨부파일</th>
						<td colspan="3">
							<%
								if (!(article.getBOARD_FILE() == null)) {
							%> <a
							href="file_down?downFile=<%=article.getBOARD_FILE()%>"> <%=article.getBOARD_FILE()%>
						</a> <%
 	}
 %>
						</td>
					</tr>


					<tr>
						<th class="success">글 내용</th>
						<td colspan="3"><%=article.getBOARD_CONTENT()%></td>
					</tr>

					<tr>
						<td colspan="4" class="text-center"><input type="button"
							class="btn btn-success" value="답글 쓰기"
							onclick="location.href= 'boardReplyForm.bo?board_num=<%=article.getBOARD_NUM()%>&page=<%=nowPage%>'">
							<input type="button" class="btn btn-warning" value="수정하기"
							onclick="location.href= 'boardModifyForm.bo?board_num=<%=article.getBOARD_NUM()%>'">
							<input type="button" class="btn btn-danger" value="삭제하기"
							onclick="location.href= 'boardDeleteForm.bo?board_num=<%=article.getBOARD_NUM()%>&page=<%=nowPage%>'">
							<input type="button" class="btn btn-primary" value="목록보기"
							onclick="location.href='boardList.bo?page=<%=nowPage%>'">
						</td>
					</tr>


				</table>
			</div>

		</div>
	</div>
</body>
</html>