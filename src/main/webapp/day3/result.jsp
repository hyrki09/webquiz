<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="">
		<input type="text" name="num1" id="" />+
		<input type="text" name="num2" id="" />
		<input type="submit" value="=" />
	</form>
	
	<%
		String n1 = request.getParameter("num1");
		String n2 = request.getParameter("num2");
		
		if(n1 != null && n2 != null){
			int num1 = Integer.parseInt(n1);
			int num2 = Integer.parseInt(n2);
			
			int result = num1 + num2;
			
			out.println(num1+" + "+num2+ " = " + result);
		}
	
	%>
	

</body>
</html>