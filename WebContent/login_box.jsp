<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<link rel="stylesheet" href="css/signUp.css">
	<script src="http://connect.facebook.net/en_US/all.js"></script> 
	<title>LUSH</title>
</head>
<body>
<form action="loginCheck.jsp">
	<div id="login-box">
  <div class="left">
  <br>
  <br>
    <h2>LUSH에 로그인</h2>
    <br>
    <br>
    <br>
    <input type="text" name="id" placeholder="Id" />
    <input type="password" name="password" placeholder="Password" />
    <input type="text" name="name" placeholder="Name" />
    <input type="submit" name="login_submit" value="로그인" />
  </div>
  
  
  	<div class="fb-login-button" data-max-rows="1" data-size="medium" data-button-type="login_with" data-show-faces="false" data-auto-logout-link="false" data-use-continue-as="false">
    <fb:login-button scope="public_profile,email" onlogin="checkLoginState();"></fb:login-button>
    </div> 
    
    
  <div class="right">
    <span class="loginwith">Sign in with<br />social network</span>
    
    <button class="social-signin facebook">Log in with facebook</button>
    <button class="social-signin twitter">Log in with Twitter</button>
    <button class="social-signin google">Log in with Google+</button>
  </div>
  <div class="or">OR</div>
</div>

<script>
		FB.init({
			appId : '818607525147117', // App ID
			cookie : true,
			status : true,
			xfbml : true
		});

		function checkLoginState() {
			FB.getLoginStatus(function(response) {
				statusChangeCallback(response);
			});
		}

		function statusChangeCallback(response) {
			console.log('statusChangeCallback');
			console.log(response);

			if (response.status === 'connected') {

				// Logged into your app and Facebook.
				testAPI();
				/* location.href="notice/List.jsp"; */

			} else if (response.status === 'not_authorized') {
				document.getElementById('status').innerHTML = 'Please log '
				+ 'into this app.';

			} else {
				document.getElementById('status').innerHTML = 'Please log '
				+ 'into Facebook.';
			}

		}

		function testAPI() {
			console.log('Welcome!  Fetching your information.... ');
			FB.api(
			'/me',

			function(response) {
				console.log('Successful login for: ' + response.name);
			}
			);
		}
		
		FB.logout(function(response) {
			   // Person is now logged out
			});
		
		(function(d, s, id) {
			  var js, fjs = d.getElementsByTagName(s)[0];
			  if (d.getElementById(id)) return;
			  js = d.createElement(s); js.id = id;
			  js.src = 'https://connect.facebook.net/ko_KR/sdk.js#xfbml=1&version=v3.2';
			  fjs.parentNode.insertBefore(js, fjs);
			}(document, 'script', 'facebook-jssdk'));
	</script>
</form>
</body>
</html>