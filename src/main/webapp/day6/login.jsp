<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">

	window.onload=function(){
		var btn1 = document.getElementById("btn1");
		
		btn1.onclick = function(){
			
			var frm = document.frm;
			frm.action = "loginOk.jsp";
			frm.method = "get";
			frm.submit();
		}
		
		var btn2 = document.getElementById("btn2");
		
		btn2.onclick= function(){
			var frm = document.frm;
			frm.action = "register.jsp";
			frm.method = "get";
			frm.submit();
		}
	};
	
</script>
</head>
<body>
	<form action="loginOk.jsp" name="frm">
		<table>
			<tr>
				<th>ID</th>
				<td><input type="text" name="id" id="id" /></td>
			</tr>
			<tr>
				<th>PW</th>
				<td><input type="text" name="pw" id="" /></td>
			</tr>
			<tr>
				<td colspan ="2">
				<input type="button" value="로그인" id="btn1"/>
				<input type="button" value="회원가입" id="btn2"/>
				</td>
			</tr>
		</table>
	</form>

</body>
</html>