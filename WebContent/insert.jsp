<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품정보삽입페이지</title>
</head>
<body>
	<form action="dbcheck.jsp">
		제품번호 <input type="text" name="pcode"><br>
		제품명 <input type="text" name="pnm"><br>
		카테고리 <input type="text" name="category" value="HAIR"><br>
		가격 <input type="number" name="price"><br>
		제품설명 <input type="text" name="detail"><br>
		이미지경로 <input type="text" name="img"><br>
		<input type="submit" value="DB에등록">
	</form>
</body>
</html>