<%@ include file="top_frame.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="dao" class="bean.BoardDAO"/>
<jsp:useBean id="dto" class="bean.BoardDTO"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 상세보기</title>
	<script type="text/javascript">
		function loginCheckAlert(){
			alert("로그인 후 작성하실 수 있습니다.");
		}
		
		function loginCheck(){
			location.href = "write.jsp";
		}
		
		// 글 수정하기(post 방식으로 보내기 위해...)
		function boardUpdate(){
			var title = document.getElementById("title").value;
			var content = document.getElementById("content").value;
			
			if(title==""){
				alert("제목을 입력하세요.");
			}else if(content==""){
				alert("내용을 입력하세요");
			}else{
				document.form.submit();
			}
		}
		
		// 글 삭제하기
		function boardDelete(){
			if(confirm("글을 삭제 하시겠습니까?")){
				var no = document.getElementById("no").value;
				
				location.href = "boardDeleteAction.jsp?no="+no;
			}
		}
		
		// 답글달러 가기
		function reply(){
			var no = document.getElementById("no").value;
			var day = document.getElementById("day").value;
			var writer = document.getElementById("writer").value;
			var title = document.getElementById("title").value;
			var content = document.getElementById("content").value;
			
			location.href = "reply.jsp?no="+no+"&title="+title+"&content="+content+"&day="+day+"&writer="+writer;
		}
		
		//목록으로 가기
		function toIndex(){
			location.href = "boardHome.jsp";
		}
	</script>
</head>
<body>
<%
	String no = request.getParameter("no");
	dto = dao.selectDetail(Integer.parseInt(no));
	dao.countHits(Integer.parseInt(no)); // 조회수 카운트에 대한 메소드
%>
	<div align="center">
	<h2>글 상세보기</h2>
	<hr>
		<form name="form" action="boardUpdate.jsp" method="post">
		<input type="hidden" id="no" name="no" value=<%=dto.getNo() %>>
		<table border="0">
			<tr align="right">
				<td colspan="2" width="610">
				<%
				String id = (String)session.getAttribute("id");
				if(id != null){
					if(id.equals(dto.getWriter())){
						out.write("<input type='button' value='수정' onclick='boardUpdate()'> ");
						out.write("<input type='button' value='삭제' onclick='boardDelete()'> ");
					}
				}
				%>
					<input type="button" value="목록" onclick="toIndex()">
				</td>
			</tr>
		</table>
		<p>
		<table border="1">
			<tr align="center" height="28">
				<td width="80">작성일</td>
				<td><input type="text" id="day" name="day" value="<%=dto.getDay() %>" size="78" readOnly></td>
			</tr>
			<tr align="center" height="28">
				<td>작성자</td>
				<td><input type="text" id="writer" name="writer" value="<%=dto.getWriter() %>" size="78" readOnly></td>
			</tr>
			<tr align="center" height="28">
				<td>제 목</td>
				<td><input type="text" id="title" name="title" value="<%=dto.getTitle() %>" size="78" readOnly></td>
			</tr>
			<tr align="center">
				<td>내 용</td>
				<td><textarea id="content" name="content" rows="20" cols="80" readOnly><%=dto.getContent() %></textarea></td>
			</tr>
		</table>
		</form>
		<p>
		<table border="0">
			<tr align="right">
				<td colspan="2" width="610">
					<%
					if (id == null){
						out.write("<button onclick='loginCheckAlert()'>글쓰기</button> ");
						out.write("<button onclick='loginCheckAlert()'>답글</button>");
					}else{
						out.write("<a href='write.jsp'><button>글쓰기</button></a> ");
						out.write("<button onclick='reply()'>답글</button> ");
					}
					%>
				</td>
			</tr>
		</table>
	</div>
</body>
</html>
<%@ include file="bottom_frame.jsp" %>