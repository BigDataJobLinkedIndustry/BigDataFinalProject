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
		String gu = request.getParameter("gu");
		String serviceName = request.getParameter("serviceName");
		
		//2. DB 처리
		List<ResultDTO> list = new ArrayList<>();
		
		try {
			// 구 이름과 서비스 업종명에 해당하는 상권 정보 받기
			list = SearchDAO.getInstance().selectAll(gu, serviceName);
			
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
		nextPage.setPageName("./startbootstrap-modern-business-gh-pages/result.jsp");
		nextPage.setRedirect(false);
		return nextPage;
	}

}
