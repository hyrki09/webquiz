<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	table,td,th{
		border : 1px solid red;
		border-collapse: collapse;
	}
	table{
		width: 600px;
		margin: 0px auto;
		text-align: center;
	}
</style>
</head>
<body>
	<table>
		<tr>
			<th>사원 번호</th>
			<th>사원명</th>
			<th>급여</th>
			<th>입사일</th>
			<th>부서번호</th>
		</tr>
		
		<%
		// 1. 변수설정
		String driver= "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@localhost:1521:orcl";
		String user = "scott";
		String password = "tiger";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StringBuffer sb = new StringBuffer();
		
		// 2. driving 로딩
		Class.forName(driver);
			
		// 3. Connection 객체 생성
		conn = DriverManager.getConnection(url, user, password);
		
		// 4. sql문작성
		sb.append("SELECT * FROM EMP");
		
		// 5. 문장 객체
		pstmt = conn.prepareStatement(sb.toString());
		
		// 6. 실행
		rs = pstmt.executeQuery();

		// 7. 레코드별 로직처리
		while(rs.next()){
			int empno = rs.getInt("empno");
			String ename = rs.getString("ename");
			int sal = rs.getInt("sal");
			String hire = rs.getString("hiredate");
			String hiredate = hire.substring(0, 10);
			int deptno = rs.getInt("deptno");
		
		
		%>
		<tr>
			<td><%= empno %></td>
			<td><%= ename %></td>
			<td><%= sal %></td>
			<td><%= hiredate %></td>
			<td><%= deptno %></td>
		</tr>
		<%
		}
		// 8. 자원 반납
		if(rs != null) rs.close();
		if(pstmt != null) pstmt.close();
		if(conn != null) conn.close();
		
		
		%>
	</table>

</body>
</html>