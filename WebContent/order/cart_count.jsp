<%@page import="product.ProductDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>러쉬코리아 (LUSH KOREA)</title>
</head>
<body>
<%
	/* 세션의 수량 변경 */
	String num = request.getParameter("count-number");
	String pcode = request.getParameter("count-pcode");
	
	ArrayList<ProductDTO> cartItem = (ArrayList<ProductDTO>)session.getAttribute("cartItem");
	ProductDTO dto = new ProductDTO();
	
	for (int i = 0; i < cartItem.size(); i++) {
		if (pcode.equals(cartItem.get(i).getPcode())) {
			dto = cartItem.get(i);
			dto.setAmount(Integer.parseInt(num));
			
			cartItem.set(i, dto);
		}
	}
	
	session.setAttribute("cartItem", cartItem);
	
	response.sendRedirect("/lushProject/order/cart.jsp");
%>
</body>
</html>