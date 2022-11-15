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
	String d = request.getParameter("dan");

	if (d != null) {
		int dan = Integer.parseInt(d);
		for (int i = 1; i <= 9; i++) {
			out.println("<h1>" + dan + " * " + i + " = " + dan * i + "</h1>");

		}
	}
	%>

</body>
</html>