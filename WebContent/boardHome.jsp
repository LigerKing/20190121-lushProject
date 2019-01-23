<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ include file="top_frame.jsp" %>
<%@page import="bean.BoardDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="dao" class="bean.BoardDAO" />
<jsp:useBean id="dto" class="bean.BoardDTO" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 홈</title>
	<script type="text/javascript">
		function loginCheckAlert(){
			alert("로그인 후 작성하실 수 있습니다.");
		}
	</script>
	<!-- <style type="text/css">
		a:link { color: black; text-decoration: none;}
		a:visited { color: black; text-decoration: none;}
		a:hover { color: #ff522b; text-decoration: none;}
	</style> -->
</head>
<body>
	<%
	final int ROWSIZE = 10;	// 한 페이지에 보여줄 글 수(행 수)
	final int BLOCK = 5;	// 페이지 번호 몇 개 까지 보여줄 것인지 정하는 변수
	
	int pg = 1;	// 초기 페이지
	if(request.getParameter("pg") != null){	// 만약 어떤 페이지에서 넘어온 값이 있으면 그 페이지 값으로 대입
		pg = Integer.parseInt(request.getParameter("pg"));
	}
	
	int start = (pg * ROWSIZE) - (ROWSIZE - 1); // 한 페이지에서 첫 번째 글
	int end = (pg * ROWSIZE);					// 한 페이지에서 마지막 글
	
	int allPg = 0;
	int startPg = ((pg - 1) / BLOCK * BLOCK) + 1;
	int endPg = ((pg - 1) / BLOCK * BLOCK) + BLOCK;
	
	String col = "";
	String word = "";
	if(request.getParameter("col") != null && request.getParameter("word") != null){
		col = request.getParameter("col");
		word = request.getParameter("word");		
	}
	
	// 게시글 수 (기본값은 전체 게시글 수, 검색 하면 검색된 글 만큼만)
	int total = dao.boardCount(col, word);
	allPg = (int)Math.ceil(total/(double)ROWSIZE);
	if(endPg > allPg){
		endPg = allPg;
	}
	
	ArrayList<BoardDTO> list = dao.boardList(col, word, start, end);
	%>
	<div align="center">
		<h2>Q & A 게시판</h2>
		<hr>
		<table border="0">
			<tr>
				<td colspan="5" align="left" width="700">전체 글 수: <%=total %></td>
			</tr>
		</table>
		<p>
		<table border="1">
			<tr align="center" height="25">
				<td width="80">번 호</td>
				<td width="350">제 목</td>
				<td width="100">작성자</td>
				<td width="100">작성일</td>
				<td width="80">조회수</td>
			</tr>
	<%
	for(int i=0; i<list.size(); i++){
		dto = list.get(i);
	%>
			<tr height="28">
				<td align="center"><%=dto.getNo() %></td>
				<td align="left">
		<%
		for(int j=0; j<dto.getIndent(); j++){
		%>	
			&nbsp&nbsp&nbsp
		<%}
			if(dto.getIndent() != 0){
				out.write("<font color='#ff522b'><b>Re:</b></font>");
		}%>
					<a href="boardDetail.jsp?no=<%=dto.getNo() %>">
					&nbsp<%=dto.getTitle() %>
					<%
					Date date = new Date();
					SimpleDateFormat dayForm = new SimpleDateFormat("yyyy.MM.dd.");
					String compDay = dayForm.format(date);
					if(compDay.equals(dto.getDay())){
					%>
						<img src="img/new.jpg">
					<%}	%>
					</a>
				</td>
				<td align="center"><%=dto.getWriter() %></td>
				<td align="center"><%=dto.getDay() %></td>
				<td align="center"><%=dto.getHits() %></td>
			</tr>
	<%} %>
			<!-- 페이징을 위한 번호(링크) 생성 -->
			<tr align="center" height="25">
				<td colspan="5">
					<%
						if(pg > BLOCK){
					%>
						<a href="boardHome.jsp?pg=<%=startPg - 1 %>&col=<%=col %>&word=<%=word %>">이전</a>
					<%} 
						for(int i=startPg; i<=endPg; i++){
							if(i == pg){
					%>
								<b><font color=#ff522b>&nbsp<%=i %>&nbsp</font></b>
					<% 
								}else{
					%>
								&nbsp<a href="boardHome.jsp?pg=<%=i %>&col=<%=col %>&word=<%=word %>"><%=i %></a>&nbsp
					<%		} 
						}					
						if(endPg < allPg){
					%>
							<a href="boardHome.jsp?pg=<%=endPg+1 %>&col=<%=col %>&word=<%=word %>">다음</a>
						<%} %>
				</td>
			</tr>
		</table>
		<p>
		<!-- 로그인 유무에 따라 글쓰기 버튼이 다르게 생성 -->
		<table border="0">
			<tr>
				<td colspan="5" align="right" width="710">
				<%String id = (String)session.getAttribute("id");
					if (id == null){
						out.write("<button onclick='loginCheckAlert()'>글쓰기</button>");
					}else{
						out.write("<a href='write.jsp'><button>글쓰기</button></a>");
					}
				%>
				</td>
			</tr>
		</table>
	</div>
	<br>
	<div align="center">
		<form action="boardHome.jsp">
			<select name="col"> <!-- 검색 컬럼 -->
		        <option value="none">전체 목록</option>
		        <option value="title">제목</option>
		        <option value="content">내용</option>
		        <option value="writer">작성자</option>
	    	</select>
			<input type="text" name="word" placeholder="검색 내용">
			<input type="submit" value="검색">
		</form>
	</div>
</body>
</html>
<%@ include file="bottom_frame.jsp" %>