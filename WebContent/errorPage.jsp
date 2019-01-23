<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isErrorPage="true" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>요청하신 페이지를 찾을 수 없습니다.</title>
</head>
<body>
	<br>
	<br>
	<br>
	<center>
		<%= exception.getClass().getName() %>
		<p>
		<img src="img/black_logo.png"><br>
		<br>
		<h3>요청하신 페이지를 찾을 수 없습니다.</h3>
		서비스 이용에 불편을 드려 죄송합니다.<br>
		<br>
		<button onclick="location.href='Frame.html'">홈페이지로 돌아가기</button>
		</p>
	</center>
</body>
</html>