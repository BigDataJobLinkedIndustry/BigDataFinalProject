package project.bigdata.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface UserService {
	/**
	 * @param request
	 * @param response
	 * @return
	 */
	public abstract NextPage execute(HttpServletRequest request, HttpServletResponse response);
	
}
