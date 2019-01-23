<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%> 
<!DOCTYPE html>
<%@ page import="bean2.MemberDTO" %>  
<%@ page import="bean2.MemberDAO" %> 

<html>
<head>
	<title>회원가입 처리 JSP</title>
	
	<script type="text/javascript">
	function goLoginForm() {
		location.href="top_frame.jsp";
	}
	
	</script>
	
</head>
<body>
	<% 
		// 한글 깨짐을 방지하기 위한 인코딩 처리
		request.setCharacterEncoding("euc-kr"); 
	%>
	
	<jsp:useBean id="dto" class="bean2.MemberDTO" />
	<jsp:setProperty property="*" name="dto"/>
	
	<%
		MemberDAO dao = new MemberDAO();
		// 회원정보를 담고있는 memberBean을 dao의 insertMember() 메서드로 넘긴다.
		// insertMember()는 회원 정보를 JSP_MEMBER 테이블에 저장한다.
		dao.insert(dto);
	%>
	
	<div id="wrap">
		<br><br>
		<b><font size="5" color="gray">회원가입 정보를 확인하세요.</font></b>
		<br><br>
		<font color="blue"><%=dto.getName() %></font>님 가입을 축하드립니다.
		<br><br>
		
		<table>
			<tr>
				<td id="title">아이디</td>
				<td><%=dto.getId() %></td>
			</tr>
						
			<tr>
				<td id="title">비밀번호</td>
				<td><%=dto.getPw() %></td>
			</tr>
					
			<tr>
				<td id="title">이름</td>
				<td><%=dto.getName() %></td>
			</tr>
					
			<tr>
				<td id="title">성별</td>
				<td><%=dto.getGender()%></td>
			</tr>
					
			<tr>
				<td id="title">생일</td>
				<td>
					<%=dto.getBirthyy() %>년 
					<%=dto.getBirthmm() %>월 
					<%=dto.getBirthdd() %>일
				</td>
			</tr>
					
			<tr>
				<td id="title">이메일</td>
				<td>
					<%=dto.getMail1() %>@<%=dto.getMail2() %>
				</td>
			</tr>
					
			<tr>
				<td id="title">휴대전화</td>
				<td><%=dto.getPhone() %></td>
			</tr>
			<tr>
				<td id="title">주소</td>
				<td>
					<%=dto.getAddress() %>
				</td>
			</tr>
		</table>
		
		<br>
		<input type="button" value="확인" onclick="goLoginForm()">
	</div>
</body>
</html>