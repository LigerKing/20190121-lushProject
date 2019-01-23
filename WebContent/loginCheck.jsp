<%@page import="com.sun.xml.internal.bind.v2.runtime.Location"%>
<%@page import="bean.MemberDAO"%>
<%@page import="bean.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/signUp.css">
<title>LUSH</title>
s
<!-- Bootstrap Core CSS -->
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- Theme CSS -->
<link href="css/freelancer.min.css" rel="stylesheet">

<!-- Custom Fonts -->
<link href="vendor/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic"
	rel="stylesheet" type="text/css">
</head>
<body>
	<jsp:useBean id="dto" class="bean.MemberDTO"></jsp:useBean>
	<jsp:setProperty property="*" name="dto" />

	<%@ include file="top_frame.jsp"%>
	<%@ include file="login_box.jsp"%>

	<%
		MemberDAO dao = new MemberDAO();
		MemberDTO dto2 = new MemberDTO();
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		String name = request.getParameter("name");
		
		
		dto2 = dao.select(id);
		session.setAttribute("id", id);
		
		if (id.equals(dto2.getId()) && password.equals(dto2.getPw())) {
			/* <script>location.href = "admin.jsp"; </script> */
			Cookie c1 = new Cookie("c1",dto2.getId());
		    c1.setMaxAge(60*60*24);
		    response.addCookie(c1);  //쿠키를 response객체에 저장
		    response.sendRedirect("success.jsp");
			
		} else if(!id.equals(dto2.getId())){
			out.print("존재하지 않는 id입니다.");
		}
	%>

	<%@ include file="bottom_frame.jsp"%>

</body>
</html>