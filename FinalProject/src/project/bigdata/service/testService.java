package project.bigdata.service;

import java.sql.SQLException;
import java.util.List;

import project.bigdata.dao.SearchDAO;
import project.bigdata.dto.ResultDTO;

public class testService {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		String gu ="강남구";
		String serviceName="중국집";
		
		List<ResultDTO> list = null;
		int fs=0;
		int fd=0;
		String trdar_cd_nm=null;
		int sales=0;
		int fc=0;
		int fhr=0;
		ResultDTO result = new ResultDTO(sales, fc, fs, fd, fhr, trdar_cd_nm);
		try {
			// 구 이름과 서비스 업종명에 해당하는 상권 정보 받기
			list = SearchDAO.getInstance().selectAll(gu, serviceName);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		//리스트가 잘 담겼는지 확인
		System.out.println(list.toString());
		System.out.println(list.size());
	}

}
