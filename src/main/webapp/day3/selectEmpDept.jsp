<%@page import="java.sql.DriverManager"%>
<%@page import="org.apache.catalina.Manager"%>
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
		border: 1px solid black;
		border-collapse: collapse;
	}
	table{
		text-align: center;
		margin : 0px auto;
		width : 600px;
	}

</style>
</head>
<body>

	<table>
		<tr>
			<th>사원번호</th>
			<th>사원명</th>
			<th>급여</th>
			<th>부서번호</th>
			<th>부서명</th>
			<th>부서위치</th>
		</tr>
		<%
			// 1. 변수설정
			String driving = "oracle.jdbc.driver.OracleDriver";
			String url = "jdbc:oracle:thin:@localhost:1521:orcl";
			String user = "scott";
			String password = "tiger";
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			StringBuffer sb = new StringBuffer();
			
			// 2. 드라이빙 로딩
			Class.forName(driving);
			
			// 3. Connection 객체 생성
			conn = DriverManager.getConnection(url, user, password);
			
			// 4. sql문 작성
			//sb.append("SELECT E.EMPNO, E.ENAME, E.SAL, D.DEPTNO, D.DNAME, D.LOC FROM EMP E, DEPT D WHERE E.DEPTNO = D.DEPTNO;");
			sb.append("SELECT E.EMPNO, E.ENAME, E.SAL, D.DEPTNO, D.DNAME, D.LOC ");
			sb.append("FROM EMP E, DEPT D ");
			sb.append("WHERE E.DEPTNO = D.DEPTNO");
			
			// 5. 문장 객체 생성
			pstmt = conn.prepareStatement(sb.toString());
			
			// 6. 실행
			rs = pstmt.executeQuery();
			
			// 7. 레코드별 로직분류
			while(rs.next()){
				int empno = rs.getInt("empno");
				String ename = rs.getString("ename");
				int sal = rs.getInt("sal");
				int deptno = rs.getInt("deptno");
				String dname = rs.getString("dname");
				String loc = rs.getString("loc");
		
		%>
		<tr>
			<td><%=empno %></td>
			<td><%=ename %></td>
			<td><%=sal %></td>
			<td><%=deptno %></td>
			<td><%=dname %></td>
			<td><%=loc %></td>
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