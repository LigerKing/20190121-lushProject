<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>매장정보삽입페이지</title>
</head>
<body>
	<form action="dbcheck2.jsp">
		매장코드 <input type="text" name="scode"><br>
		매장명 <input type="text" name="snm"><br>
		영업시간 <input type="text" name="time"><br>
		전화번호 <input type="text" name="tel"><br>
		주소 <input type="text" name="addr"><br>
		이미지경로 <input type="text" name="img"><br>
		위도 <input type="text" name="lat"><br>
		경도 <input type="text" name="lng"><br>
		<input type="submit" value="DB에등록">
	</form>
</body>
</html>