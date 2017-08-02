package project.bigdata.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Properties;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import project.bigdata.service.NextPage;
import project.bigdata.service.UserService;

/**
 * Servlet implementation class Controller
 */
@WebServlet(value="*.project",
initParams = {
		@WebInitParam(name = "url",
					value = "/project/bigdata/util/util.properties")
		})
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
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String url = request.getRequestURI();
		int cmdIdx = url.lastIndexOf("/")+1;
		String cmd = url.substring(cmdIdx);
		
		UserService service = map.get(cmd);
		System.out.println(cmd);
		NextPage nextPage = service.execute(request, response);
		
		if(nextPage == null) {
			System.out.println("Return Null. Change it");
		}
		else {
			if(nextPage.isRedirect()) {
				System.out.println("go NextPage");
				response.sendRedirect(nextPage.getPageName());
			}
			else {
				System.out.println("foward");
				request.getRequestDispatcher(nextPage.getPageName()).forward(request,response);
			}
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	
	@Override
	public void init(ServletConfig config) throws ServletException {
		
		Properties prop = new Properties();
		
		//getClass().getResourceAsStream(config.getInitParameter("url"));
		
		try {
			prop.load(getClass().getResourceAsStream(config.getInitParameter("url")));
			
			//System.out.println(prop);			
			Iterator<Object> it = prop.keySet().iterator();
			
			while(it.hasNext()) {
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
