<%@page import="dao.MemDAO"%>
<%@page import="vo.MemVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	window.onload = function() {
		window.setTimeout(page1, 10000);
	}
	function page1() {
		location.href = "http://localhost:8080/webQuiz/day7/layout.jsp";

	}
</script>
</head>
<body>
	<h1>res</h1>
	<%
	String name = request.getParameter("name");
	String userno = "";
	String[] usernoArray = request.getParameterValues("userno");
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	String hp = "";
	String[] hpArray = request.getParameterValues("hp");
	String addrs = request.getParameter("addrs");
	String email = "";
	String[] emailArray = request.getParameterValues("email");
	String gender = request.getParameter("gender");
	String hobby = "";
	String[] hobbyArray = request.getParameterValues("hobby");
	int cnt = 0;
	for (String no : usernoArray) {
		cnt++;
		userno += no;
		if (cnt != 2) {
			userno += "-";
		} else {
			cnt = 0;
		}
	}
	for (String num : hpArray) {
		cnt++;
		hp += num;
		if (cnt != 3) {
			hp += "-";
		} else {
			cnt = 0;
		}
	}
	for (String em : emailArray) {
		cnt++;
		email += em;
		if (cnt != 2) {
			email += "@";
		} else {
			cnt = 0;
		}
	}
	for (String ho : hobbyArray) {
		cnt++;
		hobby += ho;
		if (cnt != 2) {
			hobby += ",";
		} else {
			cnt = 0;
		}
	}

	MemDAO dao = new MemDAO();

	MemVO vo = dao.selectOne(id);

	if (vo != null) {
		out.println("<h1>이미 사용중인 아이디가 있습니다.</h1>");
	} else {
		vo = new MemVO(name, userno, id, pw, hp, addrs, email, gender, hobby);
		dao.insertOne(vo);
		out.println("<h1>회원가입 완료!</h1>");

	}
	%>
</body>
</html>