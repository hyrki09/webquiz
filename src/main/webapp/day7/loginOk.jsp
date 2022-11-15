<%@page import="vo.MemVO"%>
<%@page import="dao.MemDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%

	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	
	MemDAO dao = new MemDAO();
	MemVO vo = dao.isExists(id, pw);
	if(vo != null){
		session.setAttribute("vo", vo);
	}
	
	response.sendRedirect("layout.jsp");
	
	
%>

</body>
</html>