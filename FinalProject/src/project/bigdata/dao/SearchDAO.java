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
	public List<ResultDTO> selectAll(String guCD, String serviceCD) throws SQLException {
		//DAO에 들어오는지 확인
		System.out.println("3. SearchDAO");
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<ResultDTO> list = new ArrayList<>();
		ResultDTO sbd;
		try {
			con = DBUtil.getConnection();
			String sql = /*"select * from AnalysisResult";*/
					/*"select DISTINCT ar.TRDAR_CD_NM,ar.SALES,ar.FC,ar.FS,ar.FD,ar.FHR from ANALYSISRESULT ar"
		               + " inner join TBGIS_ALLEY_TRDAR_RELM tatr on ar.TRDAR_CD = tatr.TRDAR_CD"
		               + " inner join TBSM_TRDAR_STOR tts on tts.TRDAR_CD = tatr.TRDAR_CD"
		               + " inner join SVC_INDUTY si on si.SVC_INDUTY_CD = tts.SVC_INDUTY_CD"
		               + " where tatr.SIGNGU_CD_NM =강남구 and si.SVC_INDUTY_CD_NM =중국집";*/
					"select DISTINCT ar.TRDAR_CD_NM,ar.SALES,ar.FC,ar.FS,ar.FD,ar.FHR from ANALYSISRESULT ar inner join"
					+ " TBGIS_ALLEY_TRDAR_RELM tatr on ar.TRDAR_CD = tatr.TRDAR_CD inner join"
					+ " TBSM_TRDAR_STOR tts on tts.TRDAR_CD = tatr.TRDAR_CD inner join"
					+ " SVC_INDUTY si on si.SVC_INDUTY_CD = tts.SVC_INDUTY_CD"
					+ " where tatr.SIGNGU_CD= ? and si.SVC_INDUTY_CD= ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, guCD);
			pstmt.setString(2, serviceCD);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				sbd = new ResultDTO(rs.getInt("sales"), 
						rs.getInt("fc"), 
						rs.getInt("fs"), 
						rs.getInt("fd"),
						rs.getInt("fhr"),  
						rs.getString("trdar_cd_nm"));
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
