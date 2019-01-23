<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>LUSH</title>

    <!-- Bootstrap Core CSS -->
    <link href="/lushProject/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Theme CSS -->
    <link href="/lushProject/css/freelancer.min.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="/lushProject/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic" rel="stylesheet" type="text/css">
    
    <!-- 자바스크립트 -->
    <script type="text/javascript">
    	function movepage(page_addr) {
			var page = document.getElementById("body_frame");
			page.setAttribute("src", page_addr);
		}
    </script>
</head>
<body>
	<body id="page-top" class="index">
<div id="skipnav"><a href="#maincontent">Skip to main content</a></div>

		
		
		<div id="mainNav" class="navbar navbar-default navbar-fixed-top navbar-custom">
        <div class="container">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header page-scroll">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span> Menu <i class="fa fa-bars"></i>
                </button>
                <a class="navbar-brand" href="top_frame.jsp">LUSH</a>  
            </div>

            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav navbar-right">
                    <li class="hidden">
                        <a href="#page-top"></a>
                    </li>
                    <li class="page-scroll">
                       <!--  <a href="#portfolio">Products</a> -->
                        <a href="#">Products</a>
                        <ul class="drop-down">
                           <li><a href="#" onclick="movepage('product/product_BATH.jsp')">BATH</a></li>
                           <li><a href="#" onclick="movepage('product/product_SHOWER.jsp')">SHOWER</a></li>
                           <li><a href="#" onclick="movepage('product/product_BODY.jsp')">BODY</a></li>
                           <li><a href="#" onclick="movepage('product/product_FACE.jsp')">FACE</a></li>
                           <li><a href="#" onclick="movepage('product/product_HAIR.jsp')">HAIR</a></li>
                        </ul>
                    </li>
                    <li class="page-scroll">
                        <a href="boardHome.jsp">Q/A</a>
                    </li>
                    <li class="page-scroll">
                        <a href=>Shops</a>
                    </li>
                    <li class="page-scroll">
                        <a href=><img src="img/top/icon_top_cart.png"></a>
                    </li>
                    <li class="page-scroll">
                    <a href=><img src="img/top/icon_top_mypage.png"></a>
                    		<ul class="drop-down">
                    			<li><a href="LoginForm.jsp">로그인</a></li>
                    			<li><a href="JoinForm.jsp">가입</a></li>
                    		</ul>
                    		
                    </li>
                     
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container-fluid -->
    </div>
	<div style="width: 100%; height: 865px; position: absolute; top: 102px;">
	    <iframe src="frame.jsp" id="body_frame"
	    	width="100%" height="100%" frameborder="0"></iframe> 
    </div>
   
</body>
</html>