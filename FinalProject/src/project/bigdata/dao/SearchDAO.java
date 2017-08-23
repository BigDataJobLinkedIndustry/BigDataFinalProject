package project.bigdata.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import project.bigdata.dto.ResultDTO;
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
	public List<ResultDTO> crVIEW1(String guCd, String serviceCd) throws SQLException {
		//DAO에 들어오는지 확인
		System.out.println("3. SearchDAO");
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<ResultDTO> list = new ArrayList<>();
		ResultDTO sbd;
		try {
			con = DBUtil.getConnection();
			String sql ="select trdar_cd, trdar_cd_nm, round(avg(danger)) as danger, round(avg(sales_degree)) as sales_degree\r\n" + 
					"from(select r.stdr_ym_cd, r.trdar_cd, r.TRDAR_CD_NM,r.svc_induty_cd_nm, r.danger, r.avg_sales, r.SALES_DEGREE\r\n" + 
					"from result r inner join location l on r.trdar_cd = l.trdar_cd\r\n" + 
					"where r.svc_induty_cd = ? and l.SIGNGU_CD = ?)\r\n" + 
					"group by trdar_cd, trdar_cd_nm";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, serviceCd);
			pstmt.setString(2, guCd);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				sbd = new ResultDTO(rs.getString("trdar_cd"),
						rs.getString("trdar_cd_nm"),
						rs.getInt("danger"),
						rs.getInt("sales_degree"));
				list.add(sbd);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBUtil.close(rs, pstmt, con);
		}
		return list;
	}
}
