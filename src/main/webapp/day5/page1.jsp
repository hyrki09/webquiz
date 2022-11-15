<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>현재페이지는 page1.jsp입니다.</h2>
	
	<%
		pageContext.setAttribute("id", "aaa");
		request.setAttribute("id2","bbb");
		session.setAttribute("id3","ccc");
		application.setAttribute("id4","ddd");
		
		Object obj1 = pageContext.getAttribute("id");
		out.println("<h2>pageContext : "+obj1+"</h2>");
	%>
</body>
</html>