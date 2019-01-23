
<%@page import="shop.ShopDAO"%>
<%@page import="shop.ShopDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		ShopDTO dto = new ShopDTO();
		ShopDAO dao = new ShopDAO();
		
		String scode = request.getParameter("scode");
		String snm = request.getParameter("snm");
		String time = request.getParameter("time");
		String tel = request.getParameter("tel");
		String addr = request.getParameter("addr");
		String img = request.getParameter("img");
		String lat = request.getParameter("lat");
		String lng = request.getParameter("lng");
		
		dto.setScode(scode);
		dto.setSnm(snm);
		dto.setTime(time);
		dto.setTel(tel);
		dto.setAddr(addr);
		dto.setImg(img);
		dto.setLat(lat);
		dto.setLng(lng);
		
		dao.insert(dto);
	%>
	
	<a href="insert2.jsp">돌아가기</a>
</body>
</html>