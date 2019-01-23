<%@ include file="top_frame.jsp" %>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글쓰기</title>
	<script type="text/javascript">
		function insertText(){
			var title = document.getElementById("title").value;
			var content = document.getElementById("content").value;
			
			if(title==""){
				alert("제목을 입력하세요.");
			}else if(content==""){
				alert("내용을 입력하세요");
			}else{
				document.write.submit();
			}
		}
	</script>
</head>
<body>
<%
	// 날짜 추가를 위한 객체 생성
	Date date = new Date();
	SimpleDateFormat dayForm = new SimpleDateFormat("yyyy.MM.dd.");
%>
	<div align="center">
	<h2>글쓰기</h2>
	<hr>
		<table border="0">
			<tr>
				<td colspan="5" align="right" width="610"><a href="boardHome.jsp"><button>목록</button></a></td>
			</tr>
		</table>
		<p>
		<form name="write" action="writeAction.jsp" method="post">
		<table border="1">
			<tr align="center" height="28">
				<td width="80">작성일</td>
				<td align="left"><input type="text" name="day" value="<%=dayForm.format(date) %>" readOnly></td>
			</tr>
			<tr align="center" height="28">
				<td width="80">작성자</td>
				<td align="left"><input type="text" name="writer" value="<%=session.getAttribute("id") %>" readOnly></td>
			</tr>
			<tr align="center" height="28">
				<td width="80">제 목</td>
				<td><input type="text" id="title" name="title" size="78"></td>
			</tr>
			<tr align="center">
				<td width="80">내 용</td>
				<td><textarea id="content" name="content" rows="20" cols="80"></textarea></td>
			</tr>
		</table>
		<br>
		<input type="button" value="작성" onclick="insertText()">
		</form>
	</div>
</body>
</html>
<%@ include file="bottom_frame.jsp" %>