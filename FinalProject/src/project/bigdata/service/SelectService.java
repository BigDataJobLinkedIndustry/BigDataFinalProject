package project.bigdata.service;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//import org.apache.hadoop.hive.ql.metadata.formatting.JsonMetaDataFormatter;

import org.json.simple.JSONValue;

import project.bigdata.service.NextPage;
import project.bigdata.dao.SearchDAO;
import project.bigdata.dto.ResultDTO;


public class SelectService implements UserService {

	@Override
	public NextPage execute(HttpServletRequest request, HttpServletResponse response) {
		//Service에 들어오는지 확인
		System.out.println("2. SelectService");
		
		//1. 파라미터인 구 이름과 서비스 업종명 받기
		//파라미터들어오는지 확인
		String jsonParam = request.getParameter("json");
		System.out.println(jsonParam);
		
		String guCd = jsonParam.substring(9, 14);
		String serviceCd = jsonParam.substring(29, 37);
		System.out.println(guCd);
		System.out.println(serviceCd);
		
		//2. DB 처리
		List<ResultDTO> list = null;
		String trdar_cd=null;
		String trdar_cd_nm=null;
		int danger=0;
		int sales_degree=0;
		PrintWriter out = null;
		
		ResultDTO result = new ResultDTO(trdar_cd,trdar_cd_nm,danger,sales_degree);
		
		try {
			// 구 코드와 서비스코드에 해당하는 상권 정보 받기
			list = SearchDAO.getInstance().crVIEW1(guCd, serviceCd);
			response.setCharacterEncoding("utf-8");
			out = response.getWriter();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		String listJson="";
		String temp = "";
		for(int i=0;i<list.size();i++){
			  temp +="{\"trdar_cd\":"+list.get(i).getTrdar_cd()
				+",\"trdar_cd_nm\":"+ "\"" + list.get(i).getTrdar_cd_nm() + "\""
				+",\"danger\":" + list.get(i).getDanger()
				+",\"sales_degree\":" + list.get(i).getSales_degree();

				if(i==list.size()-1){
					temp += "}";
				}else{
					temp += "},";
				}
		}

		listJson = "[" + temp +"]";
		
		//js로 내보내줌
		out.print(listJson);
		out.flush();
		out.close();
		System.out.println("----listJson----");
		System.out.println(listJson);
		System.out.println("깃허브테스트");
		System.out.println("충돌실험");
		return null;
	}

}
