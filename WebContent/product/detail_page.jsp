<%@page import="product.ProductDTO"%>
<%@page import="product.ProductDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.sun.xml.internal.txw2.Document"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%-- <%@page session="false"%> --%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>러쉬코리아 (LUSH KOREA)</title>
	<meta name="keywords" content="" />
	<meta name="description" content="" />
	
	<!-- Theme CSS -->
	<link href="/lushProject/css/detail_page.css" rel="stylesheet" type="text/css" media="all" />
	
	<!-- 웹폰트 -->
	<link href="http://fonts.googleapis.com/earlyaccess/notosanskr.css" rel="stylesheet">
	
	<!-- 자바스크립트 -->
	<script type="text/javascript" src="/lushProject/js/detail_page.js"></script>
	
</head>
<body>

<%
	String pcode = request.getParameter("pcode");
	String imgUrl = request.getParameter("img");  //img파일 경로
		

	/* DB에서 상품정보 가져오기 */	
	ProductDAO dao = new ProductDAO();
	ProductDTO dto = new ProductDTO();
	dto = dao.selectPro(pcode);
	
	
	Cookie cookie = new Cookie(pcode,imgUrl);
	Cookie[] cookies = request.getCookies();
	
	
	for(int k=0; k<cookies.length; k++){
		if(! cookies[k].getName().equals("JSESSIONID")){
			 if(cookies.length > 4) {
					cookies[1].setMaxAge(0);
					response.addCookie(cookies[1]);
			 }
		}
	}
	/* Cookie[] cookies = request.getCookies(); */
	
	 /* for(int i=0; i<cookies.length; i++){
		if(cookies[i].getValue().equals(imgUrl)){
			cookie = new Cookie(pcode,imgUrl);
		}
	}   */
	/* cookie.setMaxAge(60*60*24); */
	response.addCookie(cookie);
	
%>

<%-- <%= cookies.length %> --%>
<%= imgUrl %>


<div id="wrapper">

	<!-- 상단 -->
	<div id="page" class="container">
		
		<!-- 상단 왼쪽 제품이미지 -->
		<div id="content">
			<p><img src="/lushProject/img/product/<%= dto.getCategory() %>/<%= dto.getImg() %>" alt="제품이미지" class="image">
			</p>
		</div>
		
		<!-- 상단 오른쪽 제품 가격 -->
		<div id="sidebar">
			<ul class="style1">
				<li class="first">
					<h3><%= dto.getPnm() %></h3>
					<p><%= dto.getDetail() %></p>
				</li>
				<li>
					<h5>Vegan, Self-Preserving</h5>
					<span class="name">판매가</span>
					<strong id="price" alt="<%= dto.getPrice() %>">
						￦ <fmt:formatNumber value="<%= dto.getPrice() %>" type="number" />
					</strong><br>
					
					<!-- 구매수량조절  -->
					<div class="price">
						<span class="name">구매수량</span>
						<span class="count">
							<button title="감소" class="down" onclick="change(-1)">-</button>
							<input type="text" id="number" value="1">
							<button title="증가" class="up" onclick="change(1)">+</button>
						</span>
					</div>
				</li>
				<li>
					<div class="sum">
						<span class="name">총 제품 금액</span>
						<strong>￦ 
							<span id="sum"><fmt:formatNumber value="<%= dto.getPrice() %>" type="number" /></span>
						</strong>
					</div>
				</li>
			</ul>
					
			<div id="stwo-col">
				<div class="sbox1">
					<form action="/lushProject/order/cart.jsp" method="post">
						<!-- 제품코드, 구매수량 넘기기 -->	
						<input type="hidden" name="pcode" value="<%= dto.getPcode() %>">
						<input type="hidden" name="num" id="hidden_num" value="1">
						<button type="submit">장바구니</button>
					</form>
				</div>
				<div class="sbox2">
					<form action="/lushProject/order/order.jsp">
						<!-- 제품코드, 구매수량 넘기기 -->	
						<input type="hidden" name="pcode" value="<%= dto.getPcode() %>">
						<input type="hidden" name="num" id="hidden_num2" value="1">
						<button type="submit">주문하기</button>
					</form>
				</div>
			</div>
		</div>	
	</div>	
	
	<!-- 하단 -->
	<div id="featured-wrapper">
		<div id="featured" class="extra2 container">

			<div class="ebox1">
				<!-- 상품상세정보 -->
				<div id="detail">
					<div class="menu1">
						상품상세정보
					</div>
					<div class="menu2">
						<a href="#delivery">배송안내</a>
					</div>
					<!-- 상품상세정보 이미지 -->
					<img src="/lushProject/img/product/<%= dto.getCategory() %>/<%= pcode %>_info.jpg">
				</div>
				
				<!-- 배송안내 -->
				<div id="delivery">
					<div class="menu1">
						<a href="#detail">상품상세정보</a>
					</div>
					<div class="menu2">
						배송안내
					</div>
				
					<!-- 배송안내내용시작 -->
					<div class="msg" id="top-msg">
						<p>■ 배송비 : 기본배송료는 2,500원 입니다. (도서,산간,오지 일부지역은 배송비가 추가될 수 있습니다)  회원가입 후 30,000원 이상 구매시 무료배송입니다.</p>
						<p>■ 택배사 : 우체국 택배를 이용합니다.</p>
						<p>■ 배송가능지역 : 국내 배송, 해외 배송은 불가 합니다.</p>
						<p>■ 묶음 배송 :<br>
						여러 주문번호로 주문하더라도 동일 주문자, 수령인, 주소, 연락처가 기재되어 있다면 묶음배송 됩니다.<br>
						묶음배송을 원치 않으신다면 번거롭더라도 고객센터로 연락 부탁드립니다.<br>
						고객센터 : 1644-2357 (운영시간:10:00~17:00, 점심시간:12:00~13:00)<br>
						* 비회원 주문건의 경우 묶음배송이 진행되지 않습니다. </p>
					</div>
					<div class="msg">
						<p>■ 전국 러쉬 매장에서 구매한 경우</p>
						<p>상품 및 서비스를 공급 받으신 날로부터 14일 이내 가능하며, 미 개봉 제품만 가능합니다.<br>
						구매 영수증 및 결제수단(신용카드인 경우 결제한 카드)을 지참하여 구입처로 방문 바랍니다.</p>
					</div>
					<div class="msg">
						<p>■ 홈페이지에서 구매한 경우 </p>
						<p>러쉬코리아 홈페이지에서 구매한 제품은 홈페이지를 통해서만 교환이 가능합니다.<br>
						고객님의 변심에 의한 반품인 경우 상품 및 서비스를 공급 받은 날로부터 7일 이내 가능하며, 미 개봉 제품만 가능합니다.</p>
						<p>고객센터(1644-2357)로 반품 접수를 받고 있으며, 지정 택배사를 이용하여 상품 회수 후 교환/반품 여부에 관한 안내가 이루어집니다.</p> 
						<p>*고객변심으로 인한 교환시 초도 택배 비용을 포함한 반품 택배 비용이 부과됩니다.<br>
						*상품결함으로 인한 교환의 경우 러쉬코리아에서 택배비용을 부담합니다.<br>
						*택배 비용은 무통장 입금을 통해서만 결제 가능합니다.<br>
						*교환 상품에 증정 제품이 있는 경우, 증정 제품도 함깨 반품하여야 교환이 진행됩니다.<br>
						*프레쉬 마스크를 포함하여 냉장배송을 받은 제품은 교환이 불가합니다.</p>
					</div>
					<!-- 배송안내내용끝 -->					
				</div>
				<!-- 배송안내끝 -->	
				
			</div>
		</div>
	</div>
</div>
</body>
</html>
