<%@page import="java.util.ArrayList"%>
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
<!-- 장바구니 내역 삭제 -->

<%
	ProductDTO dto = new ProductDTO();

	String arrDel = request.getParameter("cart_del");	//체크한 목록 가져오기
 	String[] arrDelValue = arrDel.split(",");	//체크한 목록 배열 나누기
 	
 	ArrayList<ProductDTO> cartItem = (ArrayList<ProductDTO>)session.getAttribute("cartItem");
 	
 	/* 체크리스트 value 값과 동일한 pcode의 세션값 삭제 */
	for (int i = 0; i < arrDelValue.length; i++) {
		for (int j = 0; j < cartItem.size(); j++) {
			if (arrDelValue[i].equals(cartItem.get(j).getPcode())) {
				cartItem.remove(j);
			}
		}
	}
 	
 	if (cartItem.size() != 0) {
	 	session.setAttribute("cartItem", cartItem);		
 	} else {
 		session.removeAttribute("cartItem");
 	}
 	
 	response.sendRedirect("/lushProject/order/cart.jsp");
%>
</body>
</html>