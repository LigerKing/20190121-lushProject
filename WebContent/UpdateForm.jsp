<%@page import="bean2.MemberDTO"%>
<%@page import="bean2.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <%
        String id = session.getAttribute("sessionID").toString();
    
        MemberDAO dao = new MemberDAO();
        MemberDTO dto = dao.select(id);
    %>
 
    <title>회원정보 수정화면</title>
    
    
    <script type="text/javascript">
    
        function init(){
            setComboValue("<%=dto.getMail2()%>");
        }
 
        function setComboValue(val) 
        {
            var selectMail = document.getElementById('mail2'); // select 아이디를 가져온다.
            for (i = 0, j = selectMail.length; i < j; i++)  // select 하단 option 수만큼 반복문 돌린다.
            {
                if (selectMail.options[i].value == val)  // 입력된값과 option의 value가 같은지 비교
                {
                    selectMail.options[i].selected = true; // 같은경우라면 체크되도록 한다.
                    break;
                }
            }
        }
        
        // 비밀번호 입력여부 체크
        function checkValue() {
            if(!document.userInfo.password.value){
                alert("비밀번호를 입력하세요.");
                return false;
            }
        }
        
    </script>
    
</head>
<body onload="init()">
 
        <br><br>
        <b><font size="6" color="gray">회원정보 수정</font></b>
        <br><br><br>
        
        <!-- 입력한 값을 전송하기 위해 form 태그를 사용한다 -->
        <!-- 값(파라미터) 전송은 POST 방식 -->
        <form method="post" action="MainForm.jsp?contentPage=UpdatePro.jsp" 
                name="userInfo" onsubmit="return checkValue()">
                
            <table>
                <tr>
                    <td id="title">아이디</td>
                    <td id="title"><%=dto.getId() %></td>
                </tr>
                <tr>
                    <td id="title">비밀번호</td>
                    <td>
                        <input type="password" name="pw" maxlength="50" 
                            value="<%=dto.getPw()%>">
                    </td>
                </tr>
            </table>    
            <br><br>    
            <table>
 
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
                        <input type="text" name="mail1" maxlength="50" 
                            value="<%=dto.getMail1() %>">
                        @
                        <select name="mail2" id="mail2">
                            <option value="naver.com">naver.com</option>
                            <option value="gmail.com">gmail.com</option>
                            <option value="daum.net" >daum.net</option>
                            <option value="nate.com">nate.com</option>  
							<option value="hanmail.net">hanmail.net</option>
							<option value="hotmail.com">hotmail.com</option>
							<option value="nate.com">nate.com</option> 
							<option value="yahoo.co.kr">yahoo.co.kr</option> 
							<option value="empas.com">empas.com</option> 
							<option value="dreamwiz.com">dreamwiz.com</option> 
							<option value="freechal.com">freechal.com</option> 
							<option value="lycos.co.kr">lycos.co.kr</option> 
							<option value="korea.com">korea.com</option>
							<option value="hanmir.com">hanmir.com</option> 
							<option value="paran.com">paran.com</option>                         
                        </select>
                    </td>
                </tr>
                    
                <tr>
                    <td id="title">휴대전화</td>
                    <td>
                        <input type="text" name="phone" value="<%=dto.getPhone() %>"/>
                    </td>
                </tr>
                <tr>
                    <td id="title">주소</td>
                    <td>
                        <input type="text" size="50" name="address"
                            value="<%=dto.getAddress() %>"/>
                    </td>
                </tr>
            </table>
            <br><br>
            <input type="button" value="취소" onclick="javascript:window.location='MainForm.jsp'">
            <input type="submit" value="수정"/>  
        </form>
        
</body>
</html>
