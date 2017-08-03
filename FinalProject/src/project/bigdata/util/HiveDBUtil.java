package project.bigdata.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**�ڹ� DOC
 * DB���� ���� �����ϴ� Ŭ����
 * @author choi
 * Connection ����, ����
*/
public class HiveDBUtil {
	private static final String DRIVER_NAME="org.apache.hive.jdbc.HiveDriver";
	private static final String CON_URL="jdbc:hive2://210.114.91.91:23391/kdatademo_nn";
	private static final String CON_NAME="eduuser";
	private static final String CON_PWD="hello.edu";

	static {
		//JVM �������� Ŭ���� �ε�ɋ� �ѹ��� ����Ǵ°�. static����!!!!!!
		try {
			Class.forName(DRIVER_NAME);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	HiveDBUtil(){
		//������/ new�ɶ����� ����.
	}
	/**
	 * �����ͺ��̽� ���� �����ϴ� �޼ҵ�
	 * @return Connection �����ͺ��̽� �������� ��ü ��ȯ
	 * @throws SQLException 
	 */
	public static Connection getConnection() throws SQLException {
		return DriverManager.getConnection(CON_URL,CON_NAME,CON_PWD);
	}
	//�ʵ尡 ������ ���� new �� �ʿ䰡 ����.
	//static �޼ҵ�� ���� Ŭ������ �����ϸ� ��.
	/**
	 * �����ͺ��̽� ����� ����� �ڿ� ����
	 * @throws SQLException 
	 * 
	 */
	public static void close(Connection con, PreparedStatement pstmt) throws SQLException {
		pstmt.close();
		con.close();
	}
	public static void close(Connection con, PreparedStatement pstmt, ResultSet rs) throws SQLException {
		rs.close();
		pstmt.close();
		con.close();
	}
}
