<%@page import="product.ProductDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="product.ProductDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>러쉬코리아 (LUSH KOREA)</title>
	
	<!-- 테마 CSS -->
	<link href="/lushProject/css/order.css" rel="stylesheet" type="text/css" media="all" />
	
	<!-- 웹폰트 -->
	<link href="http://fonts.googleapis.com/earlyaccess/notosanskr.css" rel="stylesheet">
	
	<!-- 자바스크립트 -->
	<script type="text/javascript" src="/lushProject/js/order.js"></script>
	
</head>
<body>

<%
	String pcode = request.getParameter("pcode");
	String num = request.getParameter("num");

	ProductDTO dto = new ProductDTO();
	ProductDAO dao = new ProductDAO();
	ArrayList<ProductDTO> orderList = new ArrayList<ProductDTO>();
	
	//상품화면에서 바로 주문하기를 눌렀을 경우 pcode는 not null, 장바구니에서 주문하기 눌렀을 경우 pcode는 null
	if (pcode != null) {
		dto = dao.selectPro(pcode);
		dto.setAmount(Integer.parseInt(num));
		
		orderList.add(dto);
	} else {
		orderList = (ArrayList<ProductDTO>)session.getAttribute("cartItem");
	}
%>

<!-- 전체영역 -->
<div class="container">

	<!-- 상단 -->
	<div class="top">
		<h1>SHOPPING CART</h1>
		<div>
			<span><em>Cart</em> > <em class="this">Order</em> > <em>Order confirmed</em></span>
		</div>
	</div>
	
	<!-- 구매제품 -->
	<div class="order-product">
		
		<!-- 타이틀 -->
		<div id="product-title">
			<h2>제품</h2>	
		</div>
	
			<!-- 구매제품 출력 영역 -->
		<table>
			<thead>
				<tr>
					<th style="width: 400px;">제품정보</th>
					<th>금액</th>
					<th>수량</th>
					<th>배송비</th>
					<th>총 제품금액</th>
				</tr>
			</thead>

			<tbody>
			
		<% 
			/* 구매제품 출력 시작 */
			for (int i = 0; i < orderList.size(); i++) {
				dto = orderList.get(i);
		%>			
		
				<tr>
					<td class="ta-t">
						<a href="/lushProject/product/detail_page.jsp?pcode=<%= dto.getPcode() %>">
						<img src="/lushProject/img/product/<%= dto.getCategory() %>/<%= dto.getImg() %>" width="115px" alt="상품이미지"></a>
						<span><a href="/lushProject/product/detail_page.jsp?pcode=해당제품번호"><%= dto.getPnm() %></a><br>
						<span id="cate"><%= dto.getCategory() %></span></span>
					</td>
					<td class="ta-c">￦ <fmt:formatNumber value="<%= dto.getPrice() %>" type="number" />
						<input type="hidden" class="prod-price" value="<%= dto.getPrice() %>">
					</td>
					
					<!-- 구매수량 -->
					<td class="ta-c">
						<div class="price">
							<span class="count"><%= dto.getAmount() %></span>
						</div>
					</td>
					
					<td class="ta-c deli-c">￦2,500<br>(택배)
						<input type="hidden" name="deliv" value="2500">
					</td>
					<td class="ta-c">￦ 
						<span class="sum"><fmt:formatNumber value="<%= dto.getPrice() + 2500 %>" type="number" /></span>
					</td>
				</tr>
		<%
			} //구매제품 출력 끝
		%>			
			</tbody>
		</table>
	</div>
	
<%
	/* 총 주문금액창 출력 */
	int amount = orderList.size();	//장바구니의 제품갯수
	
	int sumPrice = 0;	//제품별 합계
	//제품별 합계 구하기
	for (int i = 0; i < orderList.size(); i++) {
		sumPrice = sumPrice + (orderList.get(i).getPrice() * orderList.get(i).getAmount());
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
							<strong id="total-orderPrice"><fmt:formatNumber value="<%= totalPrice %>" type="number" /></strong>
						</em>
					</span>
				</span>
			</p>
		</div>
	</div>

	<!-- 주문고객정보 -->
	<div id="order-info">
		<h2 class="title">주문고객정보</h2>
		
		<!-- 입력폼 -->
		<div class="tables">
			<table>
				<colgroup>
					<col style="width: 140px;" />
					<col />
				</colgroup>
				
				<tbody>
					<tr>
						<!-- 입력란 타이틀 -->
						<th class="ta-o">주문하시는 분</th>
						
						<!-- 입력란 (input) -->
						<td>
							<div class="txt-field" style="width: 380px">
								<input type="text" id="orderName" name="orderName" class="text" maxlength="20">
							</div>
						</td>
					</tr>
					<tr>
						<th class="ta-o">휴대폰 번호</th>
						<td>
							<div class="txt-field" style="width: 380px">
								<input type="text" id="orderTel" name="orderTel" class="text" maxlength="20" placeholder=" - 제외 입력">
							</div>
						</td>
					</tr>
					<tr>
						<th class="ta-o">이메일</th>
						<td>
							<div class="email">
								<!-- 이메일주소 입력란 -->
								<div class="txt-field" style="width: 380px">
									<input type="text" id="orderEmail" name="orderEmail" class="text">
								</div>
							</div>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
	
	<!-- 배송정보 -->
	<div id="deliv-info">
		<h2 class="title">배송 정보</h2>
		
		<!-- 입력폼 -->
		<div class="tables">
			<table>
				<colgroup>
					<col style="width: 140px;" />
					<col />
				</colgroup>
				
				<tbody>
					<tr>
						<th class="ta-o">배송지 확인</th>
						<!-- 라디오버튼 -->
						<td class="shipping-type">
							<span class="form-element">
								<input type="radio" name="shipping" class="radio" id="ship-new" onclick="shipNew()" checked>
								<label class="choice-s" for="ship-new">직접 입력</label>
							</span>
							<span class="form-element">
								<input type="radio" name="shipping" class="radio" id="ship-same" onclick="shipSame()">
								<label class="choice-s" for="ship-same">주문자정보와 동일</label>
							</span>
						</td>
					</tr>
					<tr>
						<th class="ta-o">받으실분</th>
						<td>
							<div class="txt-field" style="width: 380px;">
								<input type="text" id="receivName" name="receivName" class="text delform" maxlength="20">
							</div>
						</td>
					</tr>
					<tr>
						<th class="ta-o">받으실 곳</th>
						<td>
							<div class="post">
								<span class="txt-field" style="width: 250px;">
									<input type="text" id="zipNo" name="zipNo" class="text delform" readonly="readonly"> <!-- 우편번호 -->
								</span>
								<button class="btnicon btn_wt post-search" onclick="goPopup()">
									<em>우편번호검색</em>
								</button>
							</div>
							<div class="post-a">
								<span class="txt-field" style="width: 420px">
									<input type="text" id="roadAddr" name="roadAddr" class="text delform" readonly="readonly"> <!-- 도로명주소 -->
								</span>
								<span class="txt-field" style="width: 420px">
									<input type="text" id="addrDetail" name="addrDetail" class="text delform"> <!-- 상세주소 -->
								</span>
							</div>
						</td>
					</tr>
					<tr>
						<th class="ta-o">휴대폰 번호</th>
						<td>
							<div class="txt-field" style="width: 380px;">
								<input type="text" id="receivTel" name="receivTel" class="text delform" placeholder=" - 제외 입력">
							</div>
						</td>
					</tr>
					<tr>
						<th class="ta-o">배송 메시지</th>
						<td>
							<div class="txt-field" style="width: 380px;">
								<input type="text" name="orderMemo" class="text delform">
							</div>
						</td>
					</tr>
				</tbody>			
			</table>
		</div>
	</div>
	
	<!-- 결제정보 -->
	<div id="deliv-info">
		<h2 class="title">결제 정보</h2>
		
		<!-- 입력폼 -->
		<div class="tables">
			<table>
				<colgroup>
					<col style="width: 140px;" />
					<col />
				</colgroup>
				
				<tbody>
					<tr>
						<th class="ta-o">합계 금액</th>
						<td>
							<strong class="total" id="total-price">￦<fmt:formatNumber value="<%= sumPrice %>" type="number" /></strong>
						</td>
					</tr>
					<tr>
						<th class="ta-o">배송비</th>
						<td>
							<strong id="deliv-char">￦2,500</strong>
						</td>
					</tr>
					<tr>
						<th class="ta-o">최종 결제 금액</th>
						<td class="final">
							<strong id="final-price">￦<fmt:formatNumber value="<%= totalPrice %>" type="number" /></strong>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
	
	<!-- 결제방법 -->
	<div id="how-to-pay">
		<h2 class="title">결제 방법</h2>
		
		<!-- 선택폼 -->
		<div class="tables">
			<table>
				<colgroup>
					<col style="width: 140px;" />
					<col />
				</colgroup>
				
				<tbody>
					<tr>
						<th class="ta-o">배송지 확인</th>
						<!-- 라디오버튼 -->
						<td class="shipping-type">
							<span class="form-element2">
								<input type="radio" name="pro-pay" class="radio" value="credit" checked>
								<label class="choice-s" for="credit">신용카드</label>
							</span>
							<span class="form-element2">
								<input type="radio" name="pro-pay" class="radio" value="account">
								<label class="choice-s" for="account">계좌이체</label>
							</span>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
	
	<!-- 최종 결제 -->
	<div class="final-settlement">
		<em>최종 결제 금액</em>
		<strong id="total-Settle">￦<fmt:formatNumber value="<%= totalPrice %>" type="number" /></strong>
		<input type="hidden" id="total-settle" value="<%= totalPrice %>">
	</div>
	
	<!-- 장바구니 / 결제하기 -->
	<div class="btn">
		<button class="btnicon btn_wt pay-btn" onclick="location.href='/lushProject/order/cart.jsp'">
			<em>장바구니 가기</em>
		</button>
		<button class="btnicon btn_bk pay-btn" onclick="blank()">
			<em>결제하기</em>
		</button>
	</div>
</div>

</body>
</html>