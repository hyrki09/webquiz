<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#container{
		width: 1000px;
		margin:auto;
	}
	h2{
		text-align: center;
	}
	table{
		margin:auto;
	}
	#send{
		text-align: center;
	}
</style>
<script type="text/javascript">
	window.onload = function(){
		
		var btn1 = document.getElementById("btn1");
		btn1.onclick = function(){
			var frm = document.frm
			frm.action = "layout.jsp";
			frm.method = "post";
			frm.submit();
		}
	}
</script>
</head>
<body>
	<div id="container">
		<div id="head">
			<h2>가입신청서</h2>
		</div>
		<form action="resgisterOk.jsp" name ="frm">
		<table>
			<tr>
				<td>이름:</td>
				<td><input type="text" name="name" id="" /></td>
			</tr>
			<tr>
				<td>주민등록번호:</td>
				<td><input type="text" name="userno" id="" />-<input type="text" name="userno" id="" /></td>
			</tr>
			<tr>
				<td>아이디:</td>
				<td><input type="text" name="id" id="" /></td>
			</tr>
			<tr>
				<td>비밀번호:</td>
				<td><input type="text" name="pw" id="" /></td>
			</tr>
			<tr>
				<td>전화번호:</td>
				<td><input type="text" name="hp" id="" />-<input type="text" name="hp" id="" />-<input type="text" name="hp" id="" /></td>
			</tr>
			<tr>
				<td>주소:</td>
				<td><input type="text" name="addrs" id="" /></td>
			</tr>
			<tr>
				<td>E-mail:</td>
				<td><input type="text" name="email" id="" />@<input type="text" name="email" id="" /></td>
			</tr>
			<tr>
				<td>성별:</td>
				<td>
				<input type="radio" name="gender" id="" value="남자" />남자
				<input type="radio" name="gender" id="" value="여자" />여자
				</td>
			</tr>
			<tr>
				<td>취미:</td>
				<td>
				<input type="checkbox" name="hobby" id="" value ="음악감상" />음악감상
				<input type="checkbox" name="hobby" id="" value ="독서" />독서
				<input type="checkbox" name="hobby" id="" value ="운동" />운동
				</td>
			</tr>
			<tr>
				<td colspan="2" id="send">
					<input type="submit" value="가입합니다." />
					<input type="button" value="취소합니다." id="btn1"/>
				</td>
			</tr>
		</table>
		</form>
	</div>

</body>
</html>