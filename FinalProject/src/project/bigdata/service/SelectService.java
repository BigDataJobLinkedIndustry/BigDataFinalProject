package project.bigdata.service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import project.bigdata.dao.SearchDAO;
import project.bigdata.dto.ResultDTO;


public class SelectService implements UserService {

	@Override
	public NextPage execute(HttpServletRequest request, HttpServletResponse response) {
		//Service에 들어오는지 확인
		System.out.println("2. SelectService");
		
		//1. 파라미터인 구 이름과 서비스 업종명 받기

		String guCd = request.getParameter("guCd");
		String serviceCd = request.getParameter("serviceCd");
		//파라미터들어오는지 확인
		System.out.println(guCd);
		System.out.println(serviceCd);
    
		//2. DB 처리
		List<ResultDTO> list = null;
		String trdar_cd=null;
		String trdar_cd_nm=null;
		int danger=0;
		int sales_degree=0;
		
		ResultDTO result = new ResultDTO(trdar_cd,trdar_cd_nm,danger,sales_degree);
		try {
			// 구 코드와 서비스코드에 해당하는 상권 정보 받기
			list = SearchDAO.getInstance().crVIEW1(guCd, serviceCd);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		//3. DB 결과 처리
		request.setAttribute("list", list);
		//리스트가 잘 담겼는지 확인
		System.out.println(list.toString());
		System.out.println(list.size());
		
		//이동할 다음 페이지 처리W
		NextPage nextPage = new NextPage();
		//이동할 페이지 url 넣을것
		nextPage.setPageName("./startbootstrap-modern-business-gh-pages/index.jsp");
		nextPage.setRedirect(false);
		return nextPage;
	}

}
