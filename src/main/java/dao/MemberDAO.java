package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import vo.MemberVO;

public class MemberDAO {
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:orcl";
	String user = "scott";
	String password = "tiger";
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	StringBuffer sb = new StringBuffer();
	
	public MemberDAO() {
		try {
			Class.forName(driver);
			
			conn = DriverManager.getConnection(url, user, password);
		} catch (ClassNotFoundException e) {
			System.out.println("드라이버 로딩 오류");
		} catch (SQLException e) {
			System.out.println("DB연결 실패");
			e.printStackTrace();
		}
	}
	
	
	// 로그인 성공
	public MemberVO isExists(String id, String pw) {
		sb.setLength(0);
		sb.append("SELECT * FROM MEM ");
		sb.append("WHERE ID = ? ");
		sb.append("AND PW = ?");
		MemberVO vo = null;
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setString(1, id);
			pstmt.setString(2, pw);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				String email = rs.getString("email");
				vo = new MemberVO(id,email,pw);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return vo;
	}
	
	// 추가
	
	public void insertOne(MemberVO vo) {
		sb.setLength(0);
		sb.append("INSERT INTO MEM ");
		sb.append("VALUES (?,?,?)");
		
		if(vo != null) {
			
			try {
				pstmt = conn.prepareStatement(sb.toString());
				pstmt.setString(1, vo.getId());
				pstmt.setString(2, vo.getEmail());
				pstmt.setString(3, vo.getPw());
				
				pstmt.executeUpdate();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	
	// 1건 조회
	
	public MemberVO selectOne(String id) {
		sb.setLength(0);
		sb.append("SELECT * FROM MEM ");
		sb.append("WHERE ID = ?");
		MemberVO vo = null;
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setString(1, id);

			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				String pw = rs.getString("pw");
				String email = rs.getString("email");
				vo = new MemberVO(id,email,pw);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return vo;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
