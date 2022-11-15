<%@page import="vo.MemberVO"%>
<%@page import="dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>loginOk임</h1>

	<%
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		
		MemberDAO dao = new MemberDAO();
		
		MemberVO vo = dao.isExists(id, pw);
		
		if(vo == null){
			response.sendRedirect("login.jsp");
		}else{
			
			
	%>
	<h2>로그인 성공</h2>
	<h2>환영합니다! <%= vo.getId() %></h2>
	
	<%
	
		}
	%>

</body>
</html>