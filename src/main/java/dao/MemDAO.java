package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import vo.MemVO;

public class MemDAO {
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:orcl";
	String user = "scott";
	String password = "tiger";
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	StringBuffer sb = new StringBuffer();

	public MemDAO() {
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
	public MemVO isExists(String id, String pw) {
		sb.setLength(0);
		sb.append("SELECT * FROM MEMUSER ");
		sb.append("WHERE ID = ? ");
		sb.append("AND PW = ?");
		MemVO vo = null;

		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setString(1, id);
			pstmt.setString(2, pw);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				String userno = rs.getString("userno");
				String name = rs.getString("name");
				String hp = rs.getString("hp");
				String addrs = rs.getString("addrs");
				String email = rs.getString("email");
				String gender = rs.getString("gender");
				String hobby = rs.getString("hobby");
				vo = new MemVO(name, userno, id, pw, hp, addrs, email, gender, hobby);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return vo;
	}

	// 추가

	public void insertOne(MemVO vo) {
		sb.setLength(0);
		sb.append("INSERT INTO MEMUSER  ");
		sb.append("VALUES (MEMUSER_NO_SEQ.NEXTVAL,?,?,?,?,?,?,?,?,?)");

		if (vo != null) {

			try {
				pstmt = conn.prepareStatement(sb.toString());
				pstmt.setString(1, vo.getName());
				pstmt.setString(2, vo.getUserno());
				pstmt.setString(3, vo.getId());
				pstmt.setString(4, vo.getPw());
				pstmt.setString(5, vo.getHp());
				pstmt.setString(6, vo.getAddrs());
				pstmt.setString(7, vo.getEmail());
				pstmt.setString(8, vo.getGender());
				pstmt.setString(9, vo.getHobby());

				pstmt.executeUpdate();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

	// 1건 조회

	public MemVO selectOne(String id) {
		sb.setLength(0);
		sb.append("SELECT * FROM MEMUSER  ");
		sb.append("WHERE ID = ?");
		MemVO vo = null;

		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setString(1, id);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				String userno = rs.getString("userno");
				String name = rs.getString("name");
				String pw = rs.getString("pw");
				String hp = rs.getString("hp");
				String addrs = rs.getString("addrs");
				String email = rs.getString("email");
				String gender = rs.getString("gender");
				String hobby = rs.getString("hobby");

				vo = new MemVO(name, userno, id, pw, hp, addrs, email, gender, hobby);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return vo;
	}
}
