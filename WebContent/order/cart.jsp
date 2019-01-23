<%@page import="com.sun.xml.internal.bind.v2.runtime.Location"%>
<%@page import="product.ProductDAO"%>
<%@page import="product.ProductDTO"%>
<%@page import="java.util.ArrayList"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>러쉬코리아 (LUSH KOREA)</title>
	
	<!-- 테마 CSS -->
	<link href="/lushProject/css/cart.css" rel="stylesheet" type="text/css" media="all" />
	
	<!-- 웹폰트 -->
	<link href="http://fonts.googleapis.com/earlyaccess/notosanskr.css" rel="stylesheet">

	<!-- 자바스크립트 -->
	<script type="text/javascript" src="/lushProject/js/cart.js"></script>
	
</head>
<body>
<%
	/* 세션 만들기 */
	String pcode = request.getParameter("pcode");
	String num = request.getParameter("num");
		
	ArrayList<ProductDTO> cartItem = null;
	
	/* 상품목록에서 장바구니를 눌렀을때만 새 세션 생성 */
	if (pcode != null && num != null) {
		// DTO로 가져오기
		ProductDAO dao = new ProductDAO();
		ProductDTO dto = new ProductDTO();
		
		//기존 세션값이 있을때 (장바구니 내역이 있을때)
		if (session.getAttribute("cartItem") != null) {
			cartItem = (ArrayList<ProductDTO>)session.getAttribute("cartItem");
			boolean exi = true;
			
			/* 기존에 장바구니에 담아놓은 동일한 상품이 있으면 수량만 더함 */
			for (int i = 0; i < cartItem.size(); i++) {
				if (pcode.equals(cartItem.get(i).getPcode())) {
					ProductDTO dto2 = cartItem.get(i);
					int addAmt = dto2.getAmount() + Integer.parseInt(num);
					dto2.setAmount(addAmt);
					
					cartItem.set(i, dto2);
					session.setAttribute("cartItem", cartItem);
					
					exi = false;
				}
			}
			
			if (exi) {
				dto = dao.selectPro(pcode);
				dto.setAmount(Integer.parseInt(num));
				
				//세션으로 넣기
				cartItem.add(dto);
				session.setAttribute("cartItem", cartItem);
			}
		} else {	//기존 세션값 없을때
			cartItem = new ArrayList<ProductDTO>();
			
			dto = dao.selectPro(pcode);
			dto.setAmount(Integer.parseInt(num));
			
			//세션으로 넣기
			cartItem.add(dto);
			session.setAttribute("cartItem", cartItem);
		}
	} else {
		cartItem = (ArrayList<ProductDTO>)session.getAttribute("cartItem");
	}
%>

<!-- 전체영역 -->
<div class="container">
	
	<!-- 상단 -->
	<div class="top">
		<h1>SHOPPING CART</h1>
		<div>
			<span><em class="this">Cart</em> > <em>Order</em> > <em>Order confirmed</em></span>
		</div>
	</div>
		
	<!-- 중앙 영역 -->
	<div class="middle">
	
		<!-- 타이틀 -->
		<div id="middle-title">
			<h2>제품</h2>
		</div>
		
	<%
		/* 세션이 비어있지 않을때 장바구니 출력 */	
		if (session.getAttribute("cartItem") != null) {
	%>
		
		<!-- 장바구니 영역 -->
		<table>
			<thead>
				<tr>
					<th style="width: 100px;">
					</th>
					<th style="width: 400px;">제품정보</th>
					<th>금액</th>
					<th>수량</th>
					<th>배송비</th>
					<th>총 제품금액</th>
				</tr>
			</thead>

			<tbody>
		
		<%
			ProductDTO dto = null;
			
			/* 테이블 출력 시작 */
			for (int i = 0; i < cartItem.size(); i++) {
				dto = new ProductDTO();				
				dto = cartItem.get(i);
				
				// 상품가격 * 수량 + 배송비 계산
				int sum = (dto.getPrice() * dto.getAmount()) + 2500;
		%>			
				<tr>
					<td>
						<!-- 체크박스 -->
						<input class="checkbox" type="checkbox" name="check" value="<%= dto.getPcode() %>">
					</td>
					<td class="ta-t">
						<a href="/lushProject/product/detail_page.jsp?pcode=<%= dto.getPcode() %>">
						<img src="/lushProject/img/product/<%= dto.getCategory() %>/<%= dto.getImg() %>" width="115px" alt="상품이미지"></a>
						<span><a href="/lushProject/product/detail_page.jsp?pcode=<%= dto.getPcode() %>"><%= dto.getPnm() %></a><br>
						<span id="cate"><%= dto.getCategory() %></span></span>
					</td>
					<td class="ta-c">￦ <fmt:formatNumber value="<%= dto.getPrice() %>" type="number" />
						<input type="hidden" class="prod-price" value="<%= dto.getPrice() %>">
					</td>
					
					<!-- 구매수량조절  -->
					<td class="ta-c">
						<form action="/lushProject/order/cart_count.jsp" method="post">
							<div class="price">
								<span class="count">
									<button title="감소" class="down" onclick="change(<%= i %>, -1)">-</button>
									<input type="text" class="number" name="count-number" value="<%= dto.getAmount() %>">
									<input type="hidden" name="count-pcode" value="<%= dto.getPcode() %>">
									<button title="증가" class="up" onclick="change(<%= i %>, 1)">+</button>
								</span>
							</div>
						</form>
					</td>
					<!-- 구매수량조절끝  -->
					
					<td class="ta-c deli-c">￦2,500<br>(택배)
						<input type="hidden" name="deliv" value="2500">
					</td>
					<td class="ta-c">￦ 
						<span class="sum"><fmt:formatNumber value="<%= sum %>" type="number" /></span>
					</td>
				</tr>
		<%
			} //테이블 for문 끝
		%>
			</tbody>
		</table>
	<%
		} //장바구니 테이블 출력 끝
	%>
		
	</div>
	
<%
	/* 총 주문금액창 출력 */
	// 세션이 비어있지 않을때 총 주문금액 창 출력	
	if (session.getAttribute("cartItem") != null) {
		int amount = cartItem.size();	//장바구니의 제품갯수
		
		int sumPrice = 0;	//제품별 합계
		//제품별 합계 구하기
		for (int i = 0; i < cartItem.size(); i++) {
			sumPrice = sumPrice + (cartItem.get(i).getPrice() * cartItem.get(i).getAmount());
		}
		
		int totalPrice = sumPrice + 2500;	//총 주문금액
%>
	
	<!-- 총 주문금액 -->
	<div class="price-box">
		<div>
			<p>
				<span class="detail">
					<em class="tit">총 <strong id="amount"><%= amount %></strong>개의 금액</em>
					<em class="tit">￦ 
						<strong id="sum-price"><fmt:formatNumber value="<%= sumPrice %>" type="number" /></strong>
					</em>
					+
					<em class="tit">배송비</em>
					<em class="tit">￦ <strong id="deli-char">2,500</strong></em>
					=
					<span class="total">
						<em class="tit">총 주문금액</em>
						<em class="tit">￦ 
							<strong id="total-price"><fmt:formatNumber value="<%= totalPrice %>" type="number" /></strong>
						</em>
					</span>
				</span>
			</p>
		</div>
	</div>
				
	<!-- 삭제하기 -->
	<form action="/lushProject/order/cart_del.jsp" method="post">
		<div class="del">
			<button id="cart-delete" onclick="del()">삭제 하기</button>
			<input type="hidden" id="cart_del" name="cart_del" value="">
		</div>
	</form>
		
<%
	/* 마지막 방문한 페이지 추적 */
	String visitCate = cartItem.get(cartItem.size()-1).getCategory();
%>
	
	<!-- 쇼핑 계속하기, 주문하기 버튼 -->
	<div class="shop-button">
		<button id="turn-back" onclick="location.href='/lushProject/product/product_<%= visitCate %>.jsp'">쇼핑 계속하기</button>
		<button id="order" onclick="location.href='/lushProject/order/order.jsp'">주문하기</button>
	</div>
<%
	//주문금액창 끝, 세션값 없을 경우 장바구니에 담겨있는 상품이 없습니다. 출력
	} else {
%>

	<!-- 장바구니에 담겨있는 상품이 없습니다. -->
	<div class="price-box">
		<div>
			<p>
				<span class="detail">
					장바구니에 담겨있는 상품이 없습니다.
				</span>
			</p>
		</div>
	</div>
	
	<!-- 장바구니 내역 없을 경우 == 쇼핑 계속하기 버튼 -->
	<div class="shop-button">
		<button id="turn-back" onclick="location.href='/lushProject/product/product_BATH.jsp'">쇼핑 계속하기</button>
	</div>

<%
	} //if문 끝
%>
</div>
</body>
</html>