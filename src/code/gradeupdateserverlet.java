package code;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import tools.DBUtil;
import tools.DBUtils;

/**
 * Servlet implementation class gradeupdateserverlet
 */
@WebServlet("/gradeupdateserverlet")
public class gradeupdateserverlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public gradeupdateserverlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		this.doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String index=request.getParameter("index");
		System.out.println(index);
		if(index.equals("1")) {
			DBUtils.update("UPDATE grade SET YEAR=YEAR+1");
			response.sendRedirect("tables.jsp");
			
		}else {
			DBUtils.update("UPDATE grade SET YEAR=YEAR-1");
			response.sendRedirect("tables.jsp");
		}
		
	}

}
