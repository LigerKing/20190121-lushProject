<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@page import="bean2.MemberDAO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>�α��� ó�� JSP</title>
</head>
<body>
<%
// �α��� ȭ�鿡 �Էµ� ���̵�� ��й�ȣ�� �����´�
String id = request.getParameter("id");
String pw = request.getParameter("pw");

MemberDAO dao = new MemberDAO();
int check = dao.login(id, pw);


//URL �� �α��ΰ��� ���� �޽���
		String msg = "";
		
/*

		if(check == 1)	// �α��� ����
		{ 
			// ���ǿ� ���� ���̵� ����
			session.setAttribute("sessionID", id);
			msg = "MainForm.jsp";
		}
		else if(check == 0) // ��й�ȣ�� Ʋ�����
		{
			msg = "LoginForm.jsp?msg=0";
		}
		else	// ���̵� Ʋ�����
		{
			msg = "LoginForm.jsp?msg=-1";
		}
		 
		// sendRedirect(String URL) : �ش� URL�� �̵�
		// URL�ڿ� get��� ó�� �����͸� ���ް���
		response.sendRedirect(msg);
		*/
		

		
		if(check == 1)	// ���̵� ���� ���
		{ 
			// ���ǿ� ���� ���̵� ����
			session.setAttribute("id", id);
			msg = "MainForm.jsp";
		}
		else if(check == 0) // ��й�ȣ�� Ʋ�����
		{
			msg = "LoginForm.jsp";
			request.setAttribute("error", "0");
		}
		else	// ���̵� Ʋ�����
		{
			msg = "LoginForm.jsp";
			request.setAttribute("error", "-1");
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(msg); 
		dispatcher.forward(request, response);
		

%>


</body>
</html>