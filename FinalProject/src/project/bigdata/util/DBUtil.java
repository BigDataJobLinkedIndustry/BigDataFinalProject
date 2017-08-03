package project.bigdata.util;
//javadoc
/**
 * DB ���� ���� �����ϴ� Ŭ����(1,2,6)
 * @author cse
 *
 */
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DBUtil {

	private static final String DRIVER_NAME = "oracle.jdbc.driver.OracleDriver";
	private static final String CON_URL = "jdbc:oracle:thin:@localhost:1521:xe";
	//private static final String CON_URL = "jdbc:hive2://210.114.91.91:23391/kdatademo_nn";
	//private static final String DRIVER_NAME = "org.apache.hadoop.hive.jdbc.HiveDriver";
	private static final String USER_ID = "eduuser";
	private static final String USER_PWD = "hello.edu";
	
	static {
		try {
			Class.forName(DRIVER_NAME);
	} catch (ClassNotFoundException e) {
		e.printStackTrace();
	}
		
	}
	
	/**
	 * �����ͺ��̽� ���� �����ϴ� �޼ҵ�
	 * @return Connection ������ ���̽� ���� ���� ��ü ��ȯ
	 * @throws SQLException
	 */
	public static Connection getConnection() throws SQLException {

		return DriverManager.getConnection(CON_URL,USER_ID,USER_PWD);
	}
	
	/**
	 * ������ ���̽� ����� ����� �ڿ� ����
	 * @param
	 * @return
	 * 
	 */

	public static void close(PreparedStatement pstmt,Connection con) {
		if(pstmt != null)
			try {
				pstmt.close();
			} catch (SQLException e) {

				e.printStackTrace();
			}
		
		if(con != null)
			try {
				con.close();
			} catch (SQLException e) {

				e.printStackTrace();
			}
		
	}
	
	public static void close(ResultSet rs,PreparedStatement pstmt,Connection con) throws SQLException {
		if(rs != null) {
			rs.close();
		}
		if(pstmt != null) {
			pstmt.close();
		}
		if(con != null) {
			con.close();
		}
	}

}
