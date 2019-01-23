<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%> 
<!DOCTYPE html>
<%@ page import="bean2.MemberDTO" %>  
<%@ page import="bean2.MemberDAO" %> 

<html>
<head>
	<title>ȸ������ ó�� JSP</title>
	
	<script type="text/javascript">
	function goLoginForm() {
		location.href="top_frame.jsp";
	}
	
	</script>
	
</head>
<body>
	<% 
		// �ѱ� ������ �����ϱ� ���� ���ڵ� ó��
		request.setCharacterEncoding("euc-kr"); 
	%>
	
	<jsp:useBean id="dto" class="bean2.MemberDTO" />
	<jsp:setProperty property="*" name="dto"/>
	
	<%
		MemberDAO dao = new MemberDAO();
		// ȸ�������� ����ִ� memberBean�� dao�� insertMember() �޼���� �ѱ��.
		// insertMember()�� ȸ�� ������ JSP_MEMBER ���̺� �����Ѵ�.
		dao.insert(dto);
	%>
	
	<div id="wrap">
		<br><br>
		<b><font size="5" color="gray">ȸ������ ������ Ȯ���ϼ���.</font></b>
		<br><br>
		<font color="blue"><%=dto.getName() %></font>�� ������ ���ϵ帳�ϴ�.
		<br><br>
		
		<table>
			<tr>
				<td id="title">���̵�</td>
				<td><%=dto.getId() %></td>
			</tr>
						
			<tr>
				<td id="title">��й�ȣ</td>
				<td><%=dto.getPw() %></td>
			</tr>
					
			<tr>
				<td id="title">�̸�</td>
				<td><%=dto.getName() %></td>
			</tr>
					
			<tr>
				<td id="title">����</td>
				<td><%=dto.getGender()%></td>
			</tr>
					
			<tr>
				<td id="title">����</td>
				<td>
					<%=dto.getBirthyy() %>�� 
					<%=dto.getBirthmm() %>�� 
					<%=dto.getBirthdd() %>��
				</td>
			</tr>
					
			<tr>
				<td id="title">�̸���</td>
				<td>
					<%=dto.getMail1() %>@<%=dto.getMail2() %>
				</td>
			</tr>
					
			<tr>
				<td id="title">�޴���ȭ</td>
				<td><%=dto.getPhone() %></td>
			</tr>
			<tr>
				<td id="title">�ּ�</td>
				<td>
					<%=dto.getAddress() %>
				</td>
			</tr>
		</table>
		
		<br>
		<input type="button" value="Ȯ��" onclick="goLoginForm()">
	</div>
</body>
</html>