<%@page import="java.util.ArrayList"%>
<%@page import="product.ProductDTO"%>
<%@page import="product.ProductDAO"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>러쉬코리아 (LUSH KOREA)</title>
	
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
	
	ArrayList<ProductDTO> list = dao.selectCate("FACE");
%>
	<%-- <%@ include file="top_frame.jsp"%>
	<br>
	<br>
	<br>
	<br>
	<br> --%>
<div id="banner-wrapper" style="background: url('/lushProject/img/cate/cate_face.jpg') no-repeat 50% 0px; height: 500px;">
	<div id="banner" class="container">
		<h1>F A C E</h1>
		<h5>신선한 재료로 만들어 믿을 수 있는 페이스 제품</h5>
	</div>
</div>
<div id="wrapper">
	<div id="featured-wrapper">
	
		<!-- 유튜브 동영상 -->				
		<div id="product-video">
			<iframe width="800" height="450" src="https://www.youtube.com/embed/K5KpHdBpoLQ" 
			frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
		</div>
	
		<!-- 상품 미리보기 부분 -->
		<div id="featured" class="container">
			<h1>페이스</h1>
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
					<img src="/lushProject/img/product/FACE/<%= dto.getImg() %>" width="280px">
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

</body>
</html>