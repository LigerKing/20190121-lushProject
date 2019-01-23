<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="dao" class="bean.BoardDAO" />
<jsp:useBean id="dto" class="bean.BoardDTO" />
<jsp:setProperty property="*" name="dto"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 수정 요청</title>
</head>
<body>
	<%
		dao.boardUpdate(dto);
	%>
	<div align="center">
		<h2>글이 수정 되었습니다.</h2>
		<hr>
		<a href="boardHome.jsp"><button>목록으로</button></a>
	</div>
</body>
</html>