<%@page import="shop.ShopDAO"%>
<%@page import="shop.ShopDTO"%>
<%@page import="java.util.ArrayList"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>러쉬코리아 (LUSH KOREA)</title>
	
	<!-- Theme CSS -->
	<link href="/lushProject/css/shop.info.css" rel="stylesheet" type="text/css" media="all" />
	
	<!-- 웹폰트 -->
	<link href="http://fonts.googleapis.com/earlyaccess/notosanskr.css" rel="stylesheet">
	
	<!-- 자바스크립트 -->
	<script type="text/javascript" src="/lushProject/js/shop_detail.js"></script>
    
</head>
<body>
<%
	ShopDTO dto = new ShopDTO();
	ShopDAO dao = new ShopDAO();
	
	ArrayList<ShopDTO> list = dao.selectAll();
%>

<div id="banner-wrapper">
	<div id="banner" class="container">
		<h1>SHOP INFORMATION</h1>
		<h5>러쉬 오프라인 매장을 소개합니다.</h5>
	</div>
</div>
<div id="wrapper">
	<div id="featured-wrapper">

		<!-- 검색 -->
		<div class="search">
			<span>매장명</span> <input type="text" id="sr" name="sr">
			<button class="btnicon" onclick="clk()">검색하기</button>
		</div>

		<!-- 매장 미리보기 부분 -->
		<div id="featured" class="container">
		
<%
	/* 매장정보 삽입하기 */
	//한줄에 4개씩 출력
	for (int i = 0; i < (list.size()/5)+1; i++) {
	int num = 1;	//column 1,2,3,4에 삽입
	
	for (int j = i*4; j < (i+1)*4; j++) {
		dto = list.get(j);
%>
				
			<!-- 매장출력 -->
			<div class="column<%= num %>"> 
				
				<!-- 매장페이지 링크 -->
				<a href="/lushProject/shop/shop_detail.jsp?scode=<%= dto.getScode() %>">
				<!-- 매장사진 삽입 -->
				<span class="icon">
					<img src="/lushProject/img/shop/<%= dto.getImg() %>" width="280px" height="200px">
				</span>
				
				<!-- 매장이름 -->
				<div class="title">
					<h2><%= dto.getSnm() %></h2>
				</div>
				</a>
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