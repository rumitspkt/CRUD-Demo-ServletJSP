package bases;

import java.io.IOException;
import java.time.LocalDateTime;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.ws.Response;

import utils.MapUtil;

public abstract class BaseServlet extends HttpServlet implements InitServlet{
	private static final long serialVersionUID = 1L;
	
//	private String type = setUrlPattern();
	
	public void init(ServletConfig config) throws ServletException {
	    super.init(config);
	    initServlet();
	  }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		handleGet(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		handlePost(request, response);
	}
	
	protected String getAction(HttpServletRequest request) {
		System.out.println(LocalDateTime.now().toString() + ": " + request.getMethod() + " - " + request.getRequestURI());
		System.out.println("Parameters: " + MapUtil.mapToString(request.getParameterMap()));
		System.out.println("\n");
//		return request.getRequestURI().substring(request.getContextPath().length() + type.length());
		return request.getRequestURI().substring(request.getContextPath().length());
	}
	
	protected void sendRedirect(HttpServletRequest request, HttpServletResponse response, String subUri) throws IOException {
		response.sendRedirect(request.getContextPath() + subUri);
	}
	
	protected void forward(HttpServletRequest request, HttpServletResponse response, String subUri) throws ServletException, IOException {
		request.getRequestDispatcher(subUri).forward(request, response);
	}

}