package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class userDAO {

	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public userDAO() {
		//실제로 mysql에 접속하게 해주는 부분
		try {
			String dbURL="jdbc:mysql://localhost:3306/BBS";
			String dbID="root";
			String dbPassword="root";
			Class.forName("com.mysql.jdbc.Driver");
			conn=DriverManager.getConnection(dbURL,dbID, dbPassword);		//dbURL에 dbID로 dbPassword를 이용해서 접속할 수 있도록 함
			//접속이 완료되면 conn객체 안에 정보가 담김
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public int login(String userID, String userPassword) {
		String SQL="SELECT userPassword FROM USER WHERE userID=?";		//물음표에 userID를 넣어줌
		
		try {
			pstmt=conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				if(rs.getString(1).equals(userPassword)) {
					return 1;	//로그인 성공
				}else {
					return 0;	//비밀번호 틀림
				}
			}
			return -1; //아이디가 없음
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return -2; 	//데이터베이스 오류
	}
}
