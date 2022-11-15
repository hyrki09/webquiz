<%@page import="vo.MemVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<title>layout.jsp</title>
<style>
#container {
	width: 900px;
	height: auto;
	margin: auto;
	padding: 0px 20px;
}

img {
	width: 900px;
	height: 150px;
}

#header {
	width: 900px;
	height: 200px;
	background: rgb(255, 255, 255);
}

#menu {
	width: 900px;
	height: 40px;
	text-align: center;
	text-decoration: none;
}

ul {
	list-style-type: none;
	/* none은 없애기 */
}

span {
	margin: 0px 20px;
}

#side1 {
	width: 680px;
	height: 150px;
	background: yellow;
	float: left;
}

#side2 {
	width: 220px;
	height: 150px;
	background: orange;
	float: left;
}

#contents {
	width: 900px;
	height: 50px;
	background: #999999;
	clear: both;
}

td {
	text-align: center;
}
</style>
<script type="text/javascript">

	function loginOk() {
		var frm = document.frm;

		frm.action = "loginOk.jsp";
		frm.method = "get";
		frm.submit();
	}
	function registerOk() {
		var frm = document.frm;

		frm.action = "register.jsp";
		frm.method = "get";
		frm.submit();
	}
	function logoutOk() {
		var frm = document.frm;

		frm.action = "logout.jsp";
		frm.method = "get";
		frm.submit();
	}
</script>
</head>
<body>
	<div id="container">
		<div id="header">
			<div id="naver">
				<img src="../images/naver.JPG" alt="">
			</div>
			<div id="menu">
				<ul>
					<a href=""><span>뉴스</span></a>
					<a href=""><span>연애</span></a>
					<a href=""><span>쇼핑</span></a>
					<a href=""><span>영화</span></a>
					<a href=""><span>레시피</span></a>
				</ul>
			</div>
		</div>
		<div id="side1">
			<h2>뉴스 공지</h2>
			<ul>
				<li>로또1등 당첨자 1000만명</li>
				<li>코로나 조용히 사라져</li>
				<li>우리회사에 입사해주세요</li>
			</ul>
		</div>
		<div id="side2">
			<div>
				<form action="login.jsp" name="frm">

					<table>
						<%
						Object obj = session.getAttribute("vo");
						if (obj != null) {
							MemVO vo = (MemVO) obj;

							out.println("<tr>");

							out.println("<h3>" + vo.getName() + "님 환영합니다.</h3>");
							out.println("<input type='button' value='로그아웃' id='logout' onclick='logoutOk();'");
							out.println("</tr>");
						} else {
						%>
						<tr>
							<td>ID</td>
							<td><input type="text" name="id" id=""></td>
						</tr>
						<tr>
							<td>PW</td>
							<td><input type="text" name="pw" id=""></td>
						</tr>
						<tr>
							<td colspan="2"><input type="button" value="로그인" id="login"
								onclick="loginOk();"> <input type="button" value="회원가입"
								id="register" onclick="registerOk();"></td>
						</tr>
						<%
						}
						%>
					</table>
					<h3>광고문의</h3>
				</form>

			</div>
		</div>
		<div id="contents">
			<ul>
				<li>코스피 5000</li>
				<li>부동산 경매...더보기</li>
			</ul>
		</div>

	</div>
</body>
</html>