<%@page import="bean2.MemberDTO"%>
<%@page import="bean2.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>현재 유저정보 출력화면</title>
    
    <script type="text/javascript">
    
        function changeForm(val){
            if(val == "-1"){
                location.href="MainForm.jsp";
            }else if(val == "0"){
                location.href="UpdateForm.jsp";
            }else if(val == "1"){
                location.href="DeleteForm.jsp";
            }
        }
        
    </script>
    
</head>
<body>
    <%
        String id = session.getAttribute("sessionID").toString();
        
        // 세션에 저장된 아이디를 가져와서
        // 그 아이디 해당하는 회원정보를 가져온다.
        MemberDAO dao = new MemberDAO();
        MemberDTO dto = dao.select(id);
    %>
 
        <br><br>
        <b><font size="6" color="gray">내 정보</font></b>
        <br><br><br>
                        <!-- 가져온 회원정보를 출력한다. -->
        <table>
            <tr>
                <td id="title">아이디</td>
                <td><%=dto.getId() %></td>
            </tr>
                        
            <tr>
                <td id="title">비밀번호</td>
                <td><%=dto.getPw() %></td>
            </tr>
                    
            <tr>
                <td id="title">이름</td>
                <td><%=dto.getName() %></td>
            </tr>
                    
            <tr>
                <td id="title">성별</td>
                <td><%=dto.getGender()%></td>
            </tr>
                    
            <tr>
                <td id="title">생일</td>
                <td>
                    <%=dto.getBirthyy() %>년 
                    <%=dto.getBirthmm() %>월 
                    <%=dto.getBirthdd() %>일
                </td>
            </tr>
                    
            <tr>
                <td id="title">이메일</td>
                <td>
                    <%=dto.getMail1() %>@
                    <%=dto.getMail2() %>
                </td>
            </tr>
                    
            <tr>
                <td id="title">휴대전화</td>
                <td><%=dto.getPhone() %></td>
            </tr>
            <tr>
                <td id="title">주소</td>
                <td>
                    <%=dto.getAddress() %>
                </td>
            </tr>
        </table>
        
        <br>
        <input type="button" value="뒤로" onclick="changeForm(-1)">
        <input type="button" value="회원정보 변경" onclick="changeForm(0)">
        <input type="button" value="회원탈퇴" onclick="changeForm(1)">
</body>
</html>
