<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8" import="java.net.URLEncoder" import="java.security.SecureRandom" import="java.math.BigInteger"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<%-- 	<%
		// 인코딩 처리
		request.setCharacterEncoding("euc-kr");
	%> --%>
	
	<%
		String clientId = "80szwe1ZVZTbgxMk2lFI";//애플리케이션 클라이언트 아이디값";
    	String redirectURI = URLEncoder.encode("http://localhost:7777/lushProject/callback.jsp", "UTF-8");
    	SecureRandom random = new SecureRandom();
    	String state = new BigInteger(130, random).toString();
    	String apiURL = "https://nid.naver.com/oauth2.0/authorize?response_type=code";
    	apiURL += "&client_id=" + clientId;
    	apiURL += "&redirect_uri=" + redirectURI;
    	apiURL += "&state=" + state;
    	session.setAttribute("state", state);
	
	%>
	<title>로그인 화면</title>
	
	<script type="text/javascript">
	
		function checkValue()
		{
			inputForm = eval("document.loginInfo");
			if(!inputForm.id.value)
			{
				alert("아이디를 입력하세요");	
				inputForm.id.focus();
				return false;
			}
			if(!inputForm.password.value)
			{
				alert("비밀번호를 입력하세요");	
				inputForm.pw.focus();
				return false;
			}
		}
	
		// 회원가입 버튼 클릭시 회원가입 화면으로 이동
		function goJoinForm() {
			location.href="JoinForm.jsp";
		}	
		
		// 네이버로그인 버튼 클릭시 네이버 로그인화면으로 이동
		function gonaverlogin() {
			location.href="naverlogin.jsp";
		}
		
	</script>

</head>
<body>
	<div id="wrap">
		<form name="loginInfo" method="post" action="LoginPro.jsp" 
				onsubmit="return checkValue()">
		
			<!-- 이미지 추가 -->
			<img src="img/welcome.jpg">
			<br><br>
			
			<table>
				<tr>
					<td bgcolor="skyblue">아이디</td>
					<td><input type="text" name="id" maxlength="50"></td>
				</tr>
				<tr>
					<td bgcolor="skyblue">비밀번호</td>
					<td><input type="password" name="pw"></td>
				</tr>
			</table>
			<br>
			
			<input type="submit" value="로그인" />
			<input type="button" value="회원가입" onclick="goJoinForm()" />
			<!-- 네이버로그인 -->
            <div id="naver_id_login"></div>
            <a href="<%=apiURL%>"><img height="50" src="http://static.nid.naver.com/oauth/small_g_in.PNG"/></a>
            <br>
            
		</form>
		
		<% 
			// 아이디, 비밀번호가 틀릴경우 화면에 메시지 표시
			// LoginPro.jsp에서 로그인 처리 결과에 따른 메시지를 보낸다.
			String msg=request.getParameter("msg");
			
			if(msg!=null && msg.equals("0")) // request.getAttribute("error") == "0" 
			{
				out.println("<br>");
				out.println("<font color='red' size='5'>비밀번호를 확인해 주세요.</font>");
			}
			else if(msg!=null && msg.equals("-1")) //request.getAttribute("error") == "-1"
			{	
				out.println("<br>");
				out.println("<font color='red' size='5'>아이디를 확인해 주세요.</font>");
			}
		%>	
	</div>	
</body>
</html>