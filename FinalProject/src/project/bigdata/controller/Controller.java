package project.bigdata.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.jasper.tagplugins.jstl.core.Out;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import project.bigdata.dto.ResultDTO;
import project.bigdata.service.NextPage;
import project.bigdata.service.UserService;

/**
 * Servlet implementation class Controller
 */
@WebServlet(value = "*.project", initParams = {
		@WebInitParam(name = "url", value = "/project/bigdata/util/util.properties") })
public class Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private Map<String, UserService> map = new HashMap<>();

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Controller() {
		super();
	}

	/**
	 * @return
	 * @return
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String url = request.getRequestURI();
		int cmdIdx = url.lastIndexOf("/") + 1;
		String cmd = url.substring(cmdIdx);

		UserService service = map.get(cmd);
		System.out.println(cmd);
		NextPage nextPage = service.execute(request, response);

		if (nextPage == null) {
			System.out.println("Return Null. Change it");

			PrintWriter out = response.getWriter();
			String listJson = "";
			String temp = "";

			// System.out.println(request.getAttribute("list"));

			// 리스트를 불러옴
			List<ResultDTO> list = (List<ResultDTO>) request.getAttribute("list");
			// System.out.println(list);

			// 불러온 데이터 리스트를 Json객체 형식으로 구현
			for (int i = 0; i < list.size(); i++) {
				temp += "{\"trdar_cd\":" + list.get(i).getTrdar_cd() + ",\"trdar_cd_nm\":" + "\""
						+ list.get(i).getTrdar_cd_nm() + "\"" + ",\"danger\":" + list.get(i).getDanger()
						+ ",\"sales_degree\":" + list.get(i).getSales_degree();

				if (i == list.size() - 1) {
					temp += "}";
				} else {
					temp += "},";
				}
			}

			listJson = "[" + temp + "]";
			// Json객체 리스트 확인
			System.out.println(listJson);
			System.out.println(listJson.length());
			// ajax로 내보냄
			URLEncoder.encode(listJson, "UTF-8");//한글 깨짐 방지를 위해 인코딩하기
			out.print(listJson.toString());
			out.flush();
			out.close();

		} else {
			if (nextPage.isRedirect()) {
				System.out.println("go NextPage");
				response.sendRedirect(nextPage.getPageName());
			} else {
				System.out.println("foward");
				request.getRequestDispatcher(nextPage.getPageName()).forward(request, response);
			}
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

	@Override
	public void init(ServletConfig config) throws ServletException {

		Properties prop = new Properties();

		// getClass().getResourceAsStream(config.getInitParameter("url"));

		try {
			prop.load(getClass().getResourceAsStream(config.getInitParameter("url")));

			// System.out.println(prop);
			Iterator<Object> it = prop.keySet().iterator();

			while (it.hasNext()) {
				String key = (String) it.next();

				Class clazz = Class.forName(prop.getProperty(key));

				UserService service = (UserService) clazz.newInstance();

				map.put(key, service);
			}

		} catch (IOException e) {
			e.printStackTrace();
		} catch (InstantiationException e) {
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}

}
