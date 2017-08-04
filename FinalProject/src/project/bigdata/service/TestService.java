package project.bigdata.service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import project.bigdata.dao.SearchDAO;
import project.bigdata.dto.ResultDTO;

//test용 
public class TestService {

	public static void main(String[] args) {
		System.out.println("2. TestService");
		List<ResultDTO> list = new ArrayList<>();
		try {
			list = SearchDAO.getInstance().selectAll();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println(list.toString());
		System.out.println(list.size());
	}

}
