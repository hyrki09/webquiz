<%@page import="vo.MemberVO"%>
<%@page import="dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#container {
	/* border: 1px solid green; */
	width: 900px;
	height: auto;
}

#inner {
	padding: 0 40px 0 40px;
}

#img_a {
	/* background: tan; */
	text-align: center;
	margin-bottom: 18px;
}

p {
	font-size: 14px;
}

#account {
	/* background: papayawhip; */
	margin-right: 200px;
	margin-left: 200px;
}

.txt {
	font-size: 30px;
	line-height: 20px;
}

#box {
	margin-top: 20px;
	width: 375px;
	height: 40px;
	background: rgb(245, 175, 24);
}
</style>
</head>
<body>
	<form action="registerOk.jsp" id="frm">
	<div id="container">
		<div id="img_a">
			<img src="../images/amazon.png" alt="">
		</div>

		<div id="account">
			<div id="inner">

				<div id="create">
					<h1>Create account</h1>
				</div>
				Your name
				<div>
					<input class="txt" type="text" name="id" id="id">
				</div>
				<br> Mobile number or email
				<div>
					<input class="txt" type="text" name="email" id="email">
				</div>
				<br> Password
				<div>
					<input class="txt" type="text" name="pw" id="pw">
					<p>Passwords must be at least 6 characters.</p>
				</div>
				<div>
					Re-enter password <input class="txt" type="text" name="" id="repw">
				</div>
				<div>
					<input id="box" type="submit" value="Create your Amazon account" />
				</div>
				<br>
				<div>
					<p>By creating an account, you agree to Amazon's Conditions of
						Use and Privacy Notice.</p>
				</div>
				<br> Already have an account? Sign in Buying for work? Create a
				free business account
			</div>
		</div>
	</div>
	</form>

</body>
</html>