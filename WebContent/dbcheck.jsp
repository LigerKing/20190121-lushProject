<%@page import="product.ProductDAO"%>
<%@page import="product.ProductDTO"%>
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
		ProductDTO dto = new ProductDTO();
		ProductDAO dao = new ProductDAO();
		
		String pcode = request.getParameter("pcode");
		String pnm = request.getParameter("pnm");
		String category = request.getParameter("category");
		
		String pr = request.getParameter("price");
		int price = Integer.parseInt(pr);
		
		String detail = request.getParameter("detail");
		String img = request.getParameter("img");
		
		dto.setPcode(pcode);
		dto.setPnm(pnm);
		dto.setCategory(category);
		dto.setPrice(price);
		dto.setDetail(detail);
		dto.setImg(img);
		
		dao.insert(dto);
	%>
	
	<a href="insert.jsp">돌아가기</a>
</body>
</html>