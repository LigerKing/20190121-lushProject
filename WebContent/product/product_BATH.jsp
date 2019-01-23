<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Arrays"%>
<%@page import="product.ProductDTO"%>
<%@page import="product.ProductDAO"%>


<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>러쉬코리아 (LUSH KOREA)</title>
	
	
	<!-- Theme CSS -->
	<link href="/lushProject/css/product.min.css" rel="stylesheet" type="text/css" media="all" />
	
	<!-- 웹폰트 -->
	<link href="http://fonts.googleapis.com/earlyaccess/notosanskr.css" rel="stylesheet">
	
		
			<Style>

#rightSide{

position: absolute;
top: 547px;
left: 50%;
margin: 0 0 0 510px;
	}

#rightSide #right_zzim {

position: fixed;
top: 300px;
left: 58%;  /* 이걸 수정해야 위치 조정가능 */
margin-left: 600px;
border:1px solid #B0B5BD;
width:114px;
height:520px;

}



#rightSide #right_zzim  div {text-align:center;}
#rightSide #right_zzim  div.recTit{line-height:1.5em;padding:5px;color:white;background-color:#505A69;}
#right_zzim #recentCnt {color:yellow;}
#rightSide #right_zzim ul {min-height:495px;}
#rightSide #right_zzim  li{text-align:center;padding:5px;position:relative;} 
#rightSide #right_zzim ul li img {border: 1px; solid #ccc}
ul{
	list-style: none;
	padding-left: 0px;
}
#right_zzim .detail {


display: none;
position: absolute;
top: 3px;
right: 20px;
xheight: 40px;
xpadding: 15px 11px 0;
xbackground: #404a59;
color: #fff;
xtext-align: left;
white-space: nowrap;

}



#right_zzim li:hover .detail {display:block}

#right_zzim li .btn_delete {

position: absolute;
top: 3px;
right: -1px;
width: 11px;
height: 11px;
background: url(/img/sp.png) no-repeat -193px -111px;
text-indent: -9000px;

}

#right_zzim  #currentPage {color:#505A69;font-weight:bold}
#right_zzim  #totalPageCount {color:#CBC8D2;font-weight:bold}
.noData {color:#ccc;text-align:center;margin-top:223px;}



}

#paging {display:;position:relative;line-height:1em;}

#paging .btn_prev {

position: absolute;
top: 526px;
left: 4px;
width: 13px;
height: 11px;
/* background: url(/images/ico_arrow.png)  no-repeat ; */
text-indent: -9000px;
border:1px solid #CCC;
display:inline-block;

}



#paging .btn_next {

position: absolute;
top: 526px;
right: 4px;
width: 13px;
height: 11px;
background: url(/images/ico_arrow.png) -11px 0px;
text-indent: -9000px;
border:1px solid #CCC;
display:inline-block;

}


</style>
</head>
<body>
<%
	/* DB에서 상품정보 가져오기 */	
	ProductDAO dao = new ProductDAO();
	ProductDTO dto = new ProductDTO();
	
	ArrayList<ProductDTO> list = dao.selectCate("BATH");
%>

<div id="rightSide">

		<div id="right_zzim">

			<div class="recTit">
				최근본상품 <span id=recentCnt></span>
			</div>
			
			<ul>
				<li>
				<% 
				
				Cookie[] cookies2 = request.getCookies();
				String chrome = "JSESSIONID"; 
				
				for(int k=0; k<cookies2.length; k++){
					if(!cookies2[k].getName().equals("JSESSIONID")){
						dto = dao.selectPro(cookies2[k].getName());
						 if(cookies2.length > 3) {
								cookies2[1].setMaxAge(0);
								response.addCookie(cookies2[1]);
						 } /* else{
							 cookies2[k].setMaxAge(0);
							 response.addCookie(cookies2[k]);
						 } */
					
						 
						
					%>
					<br>
					<hr>
					
					<br> 
					<a href="/lushProject/product/detail_page.jsp?pcode=<%= cookies2[k].getName() %>">
					<img src="/lushProject/img/product/BATH/<%= cookies2[k].getValue() %>" width="90" height="80">
					</a>
					<%= dto.getPnm() %>
					<%
				
				}
					}
				
					%> 
					
					
					<%-- <%= cookies[1].getValue() %>
					<%= cookies[2].getValue() %> --%>
				</li>
			</ul>
			<!-- 본 상품이 뿌려질 부분  -->
			

			<!-- <div id="paging">
				<a class="btn_prev" style="cursor: pointer">이전</a><span
					id="currentPage"></span><span id="totalPageCount"></span><a
					class="btn_next" style="cursor: pointer">다음</a>
			</div> -->

		</div>

	</div>


	


<div id="banner-wrapper" style="background: url('/lushProject/img/cate/cate_bath.jpg') no-repeat 50% 0px; height: 500px;">
	<div id="banner" class="container">
		<h1>B A T H</h1>
		<h5>당신에게 향기로운 입욕을 선물합니다.</h5>
	</div>
</div>
<div id="wrapper">
	<div id="featured-wrapper">

		<!-- 유튜브 동영상 -->		
		<div id="product-video">
			<iframe width="800" height="450" src="https://www.youtube.com/embed/Q4IcOHNJr7k" 
			frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
		</div>
	
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
				<a href="/lushProject/product/detail_page.jsp?pcode=<%= dto.getPcode() %>&img=<%= dto.getImg()%>">
				<!-- 상품사진 삽입 -->
				<span class="icon">
					<img src="/lushProject/img/product/BATH/<%= dto.getImg() %>" width="280px">
				</span>
				 
				<!-- http://localhost:8080/lushProject/product/detail_page.jsp?pcode=101 --> 
				<!-- 이런식으로 페이지가 넘어감 -->
				
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
