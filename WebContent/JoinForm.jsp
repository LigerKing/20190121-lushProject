<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
    <title>ȸ������ ȭ��</title>

    <script type="text/javascript">
    
        // ȸ������ ȭ���� �Է°����� �˻��Ѵ�.
        function checkValue()
        {
            var form = document.userInfo;
        
            if(!form.id.value){
                alert("���̵� �Է��ϼ���.");
                return false;
            }
         
            
            if(!form.pw.value){
                alert("��й�ȣ�� �Է��ϼ���.");
                return false;
            }
            
            // ��й�ȣ�� ��й�ȣ Ȯ�ο� �Էµ� ���� �������� Ȯ��
            if(form.pw.value != form.pwcheck.value ){
                alert("��й�ȣ�� �����ϰ� �Է��ϼ���.");
                return false;
            }    
            
            if(!form.name.value){
                alert("�̸��� �Է��ϼ���.");
                return false;
            }
            
            if(!form.birthyy.value){
                alert("�⵵�� �Է��ϼ���.");
                return false;
            }
            
            if(isNaN(form.birthyy.value)){
                alert("�⵵�� ���ڸ� �Է°����մϴ�.");
                return false;
            }
            
            if(form.birthmm.value == "00"){
                alert("���� �����ϼ���.");
                return false;
            }
            
            if(!form.birthdd.value){
                alert("��¥�� �Է��ϼ���.");
                return false;
            }
            
            if(isNaN(form.birthdd.value)){
                alert("��¥�� ���ڸ� �Է°����մϴ�.");
                return false;
            }
            
            if(!form.mail1.value){
                alert("���� �ּҸ� �Է��ϼ���.");
                return false;
            }
            
            if(!form.phone.value){
                alert("��ȭ��ȣ�� �Է��ϼ���.");
                return false;
            }
            
            if(isNaN(form.phone.value)){
                alert("��ȭ��ȣ�� - ������ ���ڸ� �Է����ּ���.");
                return false;
            }
            
            if(!form.address.value){
                alert("�ּҸ� �Է��ϼ���.");
                return false;
            }
        }
        
        // ��� ��ư Ŭ���� ùȭ������ �̵�
        function goFirstForm() {
            location.href="MainForm.jsp";
        }    
        
  
   </script>
    
	
</head>
<body>

	<% 
		// �ѱ� ������ �����ϱ� ���� ���ڵ� ó��
		request.setCharacterEncoding("euc-kr"); 
	%>
	
	<!-- div ����, ������ �ٱ������� auto�� �ָ� �߾����ĵȴ�.  -->
	<div id="wrap">
		<br><br>
		<b><font size="6" color="gray">ȸ������</font></b>
		<br><br><br>
		
		
		<!-- �Է��� ���� �����ϱ� ���� form �±׸� ����Ѵ� -->
		<!-- ��(�Ķ����) ������ POST ���, ������ �������� JoinPro.jsp -->
		  <form method="post" action="JoinPro.jsp"
                name="userInfo" onsubmit="return checkValue()">
            <table>
                <tr>
                    <td id="title">���̵�</td>
                    <td>
                        <input type="text" name="id" maxlength="50">
            
                    </td>
                </tr>
						
				<tr>
					<td id="title">��й�ȣ</td>
					<td>
						<input type="password" name="pw">
					</td>
				</tr>
				
				<tr>
					<td id="title">��й�ȣ Ȯ��</td>
					<td>
						<input type="password" name="pwcheck">
					</td>
				</tr>
					
				<tr>
					<td id="title">�̸�</td>
					<td>
						<input type="text" name="name" maxlength="50">
					</td>
				</tr>
					
				<tr>
					<td id="title">����</td>
					<td>
						<input type="radio" name="gender" value="��" checked>��
						<input type="radio" name="gender" value="��" checked>��
					</td>
				</tr>
					
				<tr>
					<td id="title">����</td>
					<td>
						<input type="text" name="birthyy" maxlength="4" placeholder="��(4��)" size="6" >
						<select name="birthmm">
							<option value="">��</option>
							<option value="01" >1</option>
							<option value="02" >2</option>
							<option value="03" >3</option>
							<option value="04" >4</option>
							<option value="05" >5</option>
							<option value="06" >6</option>
							<option value="07" >7</option>
							<option value="08" >8</option>
							<option value="09" >9</option>
							<option value="10" >10</option>
							<option value="11" >11</option>
							<option value="12" >12</option>
						</select>
						<input type="text" name="birthdd" maxlength="2" placeholder="��" size="4" >
					</td>
				</tr>
					
				<tr>
					<td id="title">�̸���</td>
					<td>
						<input type="text" name="mail1" maxlength="50">@
						<select name="mail2">
							<option>naver.com</option>
							<option>hanmail.net</option>
							<option>hotmail.com</option>
							<option>nate.com</option> 
							<option>yahoo.co.kr</option> 
							<option>empas.com</option> 
							<option>dreamwiz.com</option> 
							<option>freechal.com</option> 
							<option>lycos.co.kr</option> 
							<option>korea.com</option>
							<option>gmail.com</option> 
							<option>hanmir.com</option> 
							<option>paran.com</option>   						
						</select>
					</td>
				</tr>
					
				<tr>
					<td id="title">�޴���ȭ</td>
					<td>
						<input type="text" name="phone" />
					</td>
				</tr>
				<tr>
					<td id="title">�ּ�</td>
					<td>
						<input type="text" size="50" name="address"/>
					</td>
				</tr>
			</table>
			<br>
			<input type="submit" value="����"/>  
			<input type="button" value="���" onclick="goFirstForm()">
		</form>
	</div>
</body>
</html>