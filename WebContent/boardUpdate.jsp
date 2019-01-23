<%@ include file="top_frame.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="dao" class="bean.BoardDAO" />
<jsp:useBean id="dto" class="bean.BoardDTO" />
<jsp:setProperty property="*" name="dto"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 수정하기</title>
	<script type="text/javascript">
		function boardUpdate(){
			var title = document.getElementById("title").value;
			var content = document.getElementById("content").value;
			
			if(title==""){
				alert("제목을 입력하세요.");
			}else if(content==""){
				alert("내용을 입력하세요");
			}else{
				document.update.submit();
			}
		}
	</script>
</head>
<body>
	<div align="center">
		<h2>글 수정하기</h2>
		<hr>
		<table border="0">
			<tr align="right">
				<td colspan="2" width="610"><a href="boardHome.jsp"><button>목록</button></a></td>
			</tr>
		</table>
		<p>
		<form name="update" action="boardUpdateAction.jsp" method="post">
		<input type="hidden" name="no" value="<%=dto.getNo() %>">
		<table border="1">
			<tr align="center" height="28">
				<td width="80">작성일</td>
				<td><input type="text" name="day" value="<%=dto.getDay() %>" size="78" readOnly></td>
			</tr>
			<tr align="center" height="28">
				<td>작성자</td>
				<td><input type="text" name="writer" value="<%=dto.getWriter() %>" size="78" readOnly></td>
			</tr>
			<tr align="center" height="28">
				<td>제 목</td>
				<td><input type="text" id="title" name="title" value="<%=dto.getTitle() %>" size="78"></td>
			</tr>
			<tr align="center">
				<td>내 용</td>
				<td><textarea id="content" name="content" rows="20" cols="80" ><%=dto.getContent() %></textarea></td>
			</tr>
		</table>
		<br>
		<input type="button" value="수정하기" onclick="boardUpdate()">
		</form>
	</div>
</body>
</html>
<%@ include file="bottom_frame.jsp" %>