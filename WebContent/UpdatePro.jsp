<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%-- 자바빈 클래스 import --%>      
<%@ page import="bean.MemberDTO" %>  
<%-- DAO import --%>   
<%@ page import="bean.MemberDAO" %> 
    
<html>
<head>
    <title>회원정보 수정처리</title>
</head>
<body>
    <%-- 자바빈 관련 액션태그 사용 --%>
    <jsp:useBean id="dto" class="bean.MemberDTO" />
    <jsp:setProperty property="*" name="dto"/>    
    
    <%
        // 세션에서 아이디를 가져와 MemberDTO에 세팅한다.
        String id= (String)session.getAttribute("sessionID"); 
        dto.setId(id);
    
        // 수정할 회원정보를 담고있는 MemberDTO을 DAO로 전달하여 회원정보 수정을 한다.
        MemberDAO dao = new MemberDAO();
        dao.update(dto);
    %>
    
    <br><br>
    <font size="5" color="gray">회원정보가 수정되었습니다.</font>
    <br><br>
    <input type="button" value="메인으로" onclick="javascript:window.location='MainForm.jsp'"/>
    
</body>
</html>