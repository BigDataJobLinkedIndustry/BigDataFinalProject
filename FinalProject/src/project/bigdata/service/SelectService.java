package project.bigdata.service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import project.bigdata.service.NextPage;
import project.bigdata.dao.SearchDAO;
import project.bigdata.dto.ResultDTO;

public class SelectService implements UserService {

	@Override
	public NextPage execute(HttpServletRequest request, HttpServletResponse response) {
		// Service에 들어오는지 확인
		System.out.println("2. SelectService");

		// 1. 파라미터인 구 이름과 서비스 업종명 받기

		// 파라미터들어오는지 확인

		/* System.out.println(serviceCd); */

		String jsonParam = request.getParameter("json");
		System.out.println(jsonParam);

		String guCd = jsonParam.substring(9, 14);
		String serviceCd = jsonParam.substring(29, 37);
		System.out.println(guCd);
		System.out.println(serviceCd);
		// 2. DB 처리
		List<ResultDTO> list = null;
		String trdar_cd = null;
		String trdar_cd_nm = null;
		int danger = 0;
		int sales_degree = 0;

		ResultDTO result = new ResultDTO(trdar_cd, trdar_cd_nm, danger, sales_degree);
		try {
			// 구 코드와 서비스코드에 해당하는 상권 정보 받기
			list = SearchDAO.getInstance().crVIEW1(guCd, serviceCd);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println(list);

		//3. DB 결과 처리
		request.setAttribute("list", list);
		//request.setAttribute("list", jArray);
		return null;

		// 리스트가 잘 담겼는지 확인
		/* System.out.println(list.toString()); */
		/*
		 * NextPage nextPage = new NextPage(); nextPage.setPageName(
		 * "/startbootstrap-modern-business-gh-pages/lndex.jsp");
		 * nextPage.setRedirect(false); System.out.println(nextPage);
		 */
	}

}
