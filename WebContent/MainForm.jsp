<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>���� ȭ��</title>
	
	<script type="text/javascript">
		
		// �α׾ƿ� ��� JSP�� �̵�
		function logoutPro(){
			location.href="LogoutPro.jsp";
		}
		
	
		
		
	</script>
</head>
<body>
	<b><font size="5" color="skyblue">����ȭ���Դϴ�.</font></b><br><br>
	<%
		if(session.getAttribute("sessionID") == null) // �α����� �ȵǾ��� ��
		{ 
			// �α��� ȭ������ �̵�
			response.sendRedirect("frame.jsp");
		}
		else // �α��� ���� ���
		{
			response.sendRedirect("frame2.jsp");
	%>
	
	<h2>
		<font color="red"><%=session.getAttribute("sessionID") %></font>
		�� �α��εǾ����ϴ�.
	</h2>
	
	<br><br>
	<input type="button" value="�α׾ƿ�" onclick="logoutPro()" />
	<%} %>	
</body>
</html>