<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>탈퇴화면</title>
<script type="text/javascript">
    
    </script>
    
</head>
<body>
 
    <br><br>
    <b><font size="6" color="gray">내 정보</font></b>
    <br><br><br>
 
    <form name="deleteform" method="post" action="DeletePro.jsp">
        <table>
            <tr>
                <td bgcolor="skyblue">아이디입력</td>
                <td><input type="text" name="id" maxlength="50"></td>
            </tr>
        </table>
        
        <br> 
        <input type="button" value="취소" onclick="javascript:window.location='MainForm.jsp'">
        <input type="submit" value="탈퇴" /> 
    </form>
</body>
</html>
