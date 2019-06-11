package code;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import tools.DBUtils;

/**
 * Servlet implementation class addgrade
 */
@WebServlet("/addgrade")
public class addgrade extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public addgrade() {
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
		String name = request.getParameter("name");
		name=new String(name.trim().getBytes("ISO-8859-1"), "UTF-8");
		System.out.println(name);
		String sql="INSERT INTO grade(gradename,YEAR)SELECT '"+name+"',MIN(YEAR)-1 FROM grade";
		System.out.println(sql);
		DBUtils.update(sql);
		response.sendRedirect("tables.jsp");
	}

}
