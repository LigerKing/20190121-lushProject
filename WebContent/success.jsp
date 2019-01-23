<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link rel="stylesheet" href="css/signUp.css">
	<title>LUSH</title>

    <!-- Bootstrap Core CSS -->
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Theme CSS -->
    <link href="css/freelancer.min.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic" rel="stylesheet" type="text/css">
</head>
<body>
	<body id="page-top" class="index">
<div id="skipnav"><a href="#maincontent">Skip to main content</a></div>

		
		
		<nav id="mainNav" class="navbar navbar-default navbar-fixed-top navbar-custom">
        <div class="container">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header page-scroll">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span> Menu <i class="fa fa-bars"></i>
                </button>
                <a class="navbar-brand" href="#page-top">LUSH</a>  
            </div>

            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav navbar-right">
                    <li class="hidden">
                        <a href="#page-top"></a>
                    </li>
                    <li class="page-scroll">
                       <!--  <a href="#portfolio">Products</a> -->
                        <a href="product.html">Products
                        <ul class="drop-down">
                           <li><a href="product/product_BATH.jsp">BATH</a></li>
                           <li><a href="product/product_BODY.jsp">BODY</li>
                           <li><a href="product/product_FACE.jsp">FACE</li>
                           <li><a href="product/product_HAIR.jsp">HAIR</li>
                           <li><a href="product/product_SHOWER.jsp">SHOWER</li>
                        </ul>
                        </a>
                    </li>
                    <li class="page-scroll">
                        <a href="boardHome.jsp">Review</a>
                    </li>
                    <li class="page-scroll">
                        <a href=>Shops</a>
                    </li>
                    <li class="page-scroll">
                        <a href=><img src="img/top/icon_top_cart.png"></a>
                    </li>
                    <li class="page-scroll2">
                    <a href=""><img src="img/top/icon_top_mypage.png">
                    		<ul class="drop-down">
                    			<li><a href="frame.jsp">로그아웃</a></li>
                    			<li>회원가입</li>
                    		</ul>
                    		</a>
                    </li>
                     <li class="page-scroll">
                        <a href="">
                       <% 
                        Cookie[] cookies = request.getCookies();
            			String id = (String)session.getAttribute("id");
            			for(int i=0; i<cookies.length; i++){
            			}
            			out.println(id+"님 환영합니다.");
                		 /* <!-- for(int i=0; i<cookies.length; i++){
                		out.print("현재까지 설정된 쿠키수: " + cookies.length);
                		out.print("해당 주소에서 쿠키value: " + cookies[i].getValue());
                		}  --> */
                		%>
                        </a>
                    </li>
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container-fluid -->
    </nav>

    <br><br><br><br><br>
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script> 
	<script src="http://malsup.github.com/jquery.cycle2.js"></script>

	<div class="cycle-slideshow" data-cycle-fx="scrollHorz"
    data-cycle-pause-on-hover="true"
    data-cycle-speed="500"> 
	<img src="lush/main/main1.jpg"> 
	<img src="lush/main/main3.jpg"> 
	<img src="lush/main/main4.jpg"> 
	<img src="lush/main/main5.jpg"> 
	</div>
	
	<br>
    <br>
    <br>
    <br>
	
	<div style="position: relative; max-width: 100%; paddpadding-bottom: 48%; height: 0;">
	<iframe width="560" height="315" src="https://www.youtube.com/embed/Q4IcOHNJr7k" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen>
	</iframe>
		<div style="border: 1px; float:left; padding-left: 15%;">
		<img src="lush/1.gif">
		<img src="lush/2.gif">
		</div>
	</div>
     
     <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
     
    <!-- Footer -->
    <footer class="text-center">
        <div class="footer-above">
            <div class="container">
                <div class="row">
                    <div class="footer-col col-md-4">
                        <h3>고객센터</h3>
                        <p>Tel:1644-2357<br>
                           Fax:02-795-7516<br>
                                                            월~금 10:00~17:00<br>
                          (점심시간 12:00~13:00)	
                            <br>문의메일:<br>
                            webmaster@lush.co.kr
                            </p>
                    </div>
                    <div class="footer-col col-md-4">
                        <h3>Around the Web</h3>
                        <ul class="list-inline">
                            <li>
                                <a href="https://www.facebook.com/lushkorea" class="btn-social btn-outline"><span class="sr-only">Facebook</span><i class="fa fa-fw fa-facebook"></i></a>
                            </li>
                            <li>
                                <a href="https://www.google.co.kr/" class="btn-social btn-outline"><span class="sr-only">Google Plus</span><i class="fa fa-fw fa-google-plus"></i></a>
                            </li>
                            <li>
                                <a href="https://twitter.com/?lang=ko" class="btn-social btn-outline"><span class="sr-only">Twitter</span><i class="fa fa-fw fa-twitter"></i></a>
                            </li>
                            <!-- <li>
                                <a href="#" class="btn-social btn-outline"><span class="sr-only">Linked In</span><i class="fa fa-fw fa-linkedin"></i></a>
                            </li>
                            <li>
                                <a href="#" class="btn-social btn-outline"><span class="sr-only">Dribble</span><i class="fa fa-fw fa-dribbble"></i></a>
                            </li> -->
                        </ul>
                    </div>
                    <div class="footer-col col-md-4">
                        <h3>About Freelancer</h3>
                        <p>Freelance is a free to use, open source Bootstrap theme created by <a href="http://startbootstrap.com">Start Bootstrap</a>.</p>
                    </div>
                </div>
            </div>
        </div>
        <div class="footer-below">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        Copyright &copy; Your Website 2016
                    </div>
                </div>
            </div>
        </div>
    </footer>
	
</body>
</html>