package project.bigdata.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import project.bigdata.dto.Dto;
import project.bigdata.util.DBUtil;

public class SearchDAO {
	// 싱글턴 패턴--------------------------------------
	private static SearchDAO dao = new SearchDAO();

	private SearchDAO() {
	}

	public static SearchDAO getInstance() {
		return dao;
	}

	// ----------------------------------------------
	//구이름과 서비스 업종명 받고 해당 상권정보 리턴
	public List<Dto> selectAll(String gu, String serviceName) throws SQLException {
		//DAO에 들어오는지 확인
		System.out.println("3. SearchDAO");
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Dto> list = new ArrayList<>();
		Dto sbd;
		try {
			con = DBUtil.getConnection();
			String sql = "select b.bseatcode bsc, count(b.bseatcode) cnt"
					+ " from stadium s join game g on s.snum=g.snum"
					+ " join ballinfo b on b.gcode = g.gcode"
					+ " where s.sname=?"
					+ " group by b.bseatcode" 
					+ " order by b.bseatcode";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, gu);
			pstmt.setString(2, serviceName);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				sbd = new Dto(rs.getString("trdar_cd_nm"),
						rs.getString("svc_induty_cd_nm"),
						rs.getString("sales"),
						rs.getString("danger"));
				list.add(sbd);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBUtil.close(rs, pstmt, con);
		}
		System.out.println(list.size());
		return list;
	}

}
