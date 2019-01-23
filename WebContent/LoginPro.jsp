<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@page import="bean2.MemberDAO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 처리 JSP</title>
</head>
<body>
<%
// 로그인 화면에 입력된 아이디와 비밀번호를 가져온다
String id = request.getParameter("id");
String pw = request.getParameter("pw");

MemberDAO dao = new MemberDAO();
int check = dao.login(id, pw);


//URL 및 로그인관련 전달 메시지
		String msg = "";
		
/*

		if(check == 1)	// 로그인 성공
		{ 
			// 세션에 현재 아이디 세팅
			session.setAttribute("sessionID", id);
			msg = "MainForm.jsp";
		}
		else if(check == 0) // 비밀번호가 틀릴경우
		{
			msg = "LoginForm.jsp?msg=0";
		}
		else	// 아이디가 틀릴경우
		{
			msg = "LoginForm.jsp?msg=-1";
		}
		 
		// sendRedirect(String URL) : 해당 URL로 이동
		// URL뒤에 get방식 처럼 데이터를 전달가능
		response.sendRedirect(msg);
		*/
		

		
		if(check == 1)	// 아이디 있을 경우
		{ 
			// 세션에 현재 아이디 세팅
			session.setAttribute("id", id);
			msg = "MainForm.jsp";
		}
		else if(check == 0) // 비밀번호가 틀릴경우
		{
			msg = "LoginForm.jsp";
			request.setAttribute("error", "0");
		}
		else	// 아이디가 틀릴경우
		{
			msg = "LoginForm.jsp";
			request.setAttribute("error", "-1");
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(msg); 
		dispatcher.forward(request, response);
		

%>


</body>
</html>