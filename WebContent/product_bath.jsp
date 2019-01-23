<%@page import="java.util.ArrayList"%>
<%@page import="product.ProductDTO"%>
<%@page import="product.ProductDAO"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>러쉬코리아 (LUSH KOREA)</title>
	<meta name="keywords" content="" />
	<meta name="description" content="" />
	
	<!-- Theme CSS -->
	<link href="/lushProject/css/product.min.css" rel="stylesheet" type="text/css" media="all" />
	
	<!-- 웹폰트 -->
	<link href="http://fonts.googleapis.com/earlyaccess/notosanskr.css" rel="stylesheet">

</head>
<body>

<%
	/* DB에서 상품정보 가져오기 */	
	ProductDAO dao = new ProductDAO();
	ProductDTO dto = new ProductDTO();
	
	ArrayList<ProductDTO> list = dao.selectCate("BATH");
%>

<div id="banner-wrapper" style="background: url('/lushProject/img/cate/cate_bath.jpg') no-repeat 50% 0px; height: 500px;">
	<div id="banner" class="container">
		<h1>B A T H</h1>
		<h5>당신에게 향기로운 입욕을 선물합니다.</h5>
	</div>
</div>
<div id="wrapper">
	<div id="featured-wrapper">
	
		<!-- 상품 미리보기 부분 -->
		<div id="featured" class="container">
			<h1>배쓰</h1>
			<hr color="#000"><br>

<%
	/* 상품 정보 삽입하기 */
	//한줄에 4개씩 출력
	for (int i = 0; i < (list.size()/5)+1; i++) {
		int num = 1;	//column 1,2,3,4에 삽입
		
		for (int j = i*4; j < (i+1)*4; j++) {
			dto = list.get(j);
%>
			
			<!-- 상품 -->
			<div class="column<%= num %>"> 
				
				<!-- 상품페이지 링크 -->
				<a href="/lushProject/product/detail_page.jsp?pcode=<%= dto.getPcode() %>">
				<!-- 상품사진 삽입 -->
				<span class="icon">
					<img src="/lushProject/img/product/BATH/<%= dto.getImg() %>" width="280px">
				</span>
				
				<!-- 상품이름 / 설명 / 가격 -->
				<div class="title">
					<h2><%= dto.getPnm() %></h2>
				</div>
				<p><%= dto.getDetail() %></p>
				</a>
				<div class="title">
					<h2>￦ <fmt:formatNumber value="<%= dto.getPrice() %>" type="number" /><br></h2>
				</div>
			</div>
<%
		num++;
		}
	}
%>			
		</div>
	</div>
</div>

</body>
</html>
