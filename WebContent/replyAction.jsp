<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="dao" class="bean.BoardDAO" />
<jsp:useBean id="dto" class="bean.BoardDTO" />
<jsp:setProperty property="*" name="dto" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>답글 쓰기 요청</title>
</head>
<body>
	<%
		dao.insertReply(dto);
	%>
	<div align="center">
		<h2>답글이 작성 되었습니다.</h2>
		<hr>
		<a href="boardHome.jsp"><button>목록으로</button></a>
	</div>
</body>
</html>