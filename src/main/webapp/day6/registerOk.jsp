<%@page import="vo.MemberVO"%>
<%@page import="dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	window.onload = function(){
		window.setTimeout(page1,10000);
	}
	function page1(){
		location.href="http://localhost:8080/webQuiz/day6/login.jsp";
		
	}
</script>

</head>
<body>
	<h1>registerOk.jsp</h1>
	<%
		String id = request.getParameter("id");
		String email = request.getParameter("email");
		String pw = request.getParameter("pw");
		
		MemberDAO dao = new MemberDAO();
		
		MemberVO vo = dao.selectOne(id);
		
		if(vo != null){
			out.println("<h1>이미 사용중인 아이디가 있습니다.</h1>");
		}else{
			vo = new MemberVO(id,email,pw);
			dao.insertOne(vo);
			out.println("<h1>회원가입 완료!</h1>");
			
		}
	%>
	<a href="login.jsp">로그인페이지로 이동</a>
</body>
</html>