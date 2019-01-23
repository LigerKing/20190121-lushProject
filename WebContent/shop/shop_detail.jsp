<%@page import="shop.ShopDAO"%>
<%@page import="shop.ShopDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="initial-scale=1.0">
	<title>러쉬코리아 (LUSH KOREA)</title>
	
	<!-- Theme CSS -->
	<link href="/lushProject/css/shop.detail.css" rel="stylesheet" type="text/css" media="all" />
	
	<!-- 웹폰트 -->
	<link href="http://fonts.googleapis.com/earlyaccess/notosanskr.css" rel="stylesheet">
	
	<!-- 자바스크립트 -->
	<script type="text/javascript" src="/lushProject/js/shop_detail.js"></script>
	
	<!-- 구글맵 -->
    <script async defer
    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBKLwKkXxtWMD6n6Bpxrw5sXqIfhhs3fy4&callback=initMap">
    </script>
    
</head>
<body>
<%
	String scode = request.getParameter("scode");

	ShopDTO dto = new ShopDTO();
	ShopDAO dao = new ShopDAO();
	
	dto = dao.select(scode);
%>

<div id="banner-wrapper">
	<div id="banner" class="container">
		<h1>SHOP INFORMATION</h1>
		<h5>러쉬 오프라인 매장을 소개합니다.</h5>
	</div>
</div>

<div class="container">
	<div id="title">
		<h1><%= dto.getSnm() %></h1>
		<input type="hidden" id="snm" value="<%= dto.getSnm() %>">
	</div>
	
	<div class="content">
		<!-- 매장사진 -->
		<img src="/lushProject/img/shop/<%= dto.getImg() %>" style="max-width: 980px;">
		
		<!-- 영업시간 -->
		<p class="sub-title">영업시간</p>
		<p class="sub-content"><%= dto.getTime() %></p>
		
		<!-- 전화번호 -->
		<p class="sub-title">전화번호</p>
		<p class="sub-content"><%= dto.getTel() %></p>	
		
		<!-- 주소 -->
		<p class="sub-title">주소</p>
		<p class="sub-content"><%= dto.getAddr() %></p>	
	
		<!-- 구글맵 -->
		<p class="sub-title">오시는 길</p>
		<input type="hidden" id="lat" value="<%= dto.getLat() %>">
		<input type="hidden" id="lng" value="<%= dto.getLng() %>">
		<div id="map"></div>
	</div>
	
	<div id="return">
		<!-- 돌아가기 버튼 -->
		<button onclick="location.href='/lushProject/shop/shop_info.jsp'">목록으로</button>
	</div>
</div>
		
</body>
</html>