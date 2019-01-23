<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="dao" class="bean.BoardDAO" />
<jsp:useBean id="dto" class="bean.BoardDTO" />
<jsp:setProperty property="*" name="dto"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 삭제하기</title>
</head>
<body>
<%
	dao.boardDelete(dto);
%>
	<div align="center">
		<h2>글이 삭제 되었습니다.</h2>
		<hr>
		<a href="boardHome.jsp"><button>목록으로</button></a>
	</div>
</body>
</html>