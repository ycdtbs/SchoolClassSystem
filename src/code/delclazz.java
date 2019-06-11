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
 * Servlet implementation class delclazz
 */
@WebServlet("/delclazz")
public class delclazz extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public delclazz() {
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
		String year=request.getParameter("year");
		
		String clazzname=request.getParameter("clazzname");
		clazzname=new String(clazzname.trim().getBytes("ISO-8859-1"), "UTF-8");
		System.out.println(year);
		System.out.println(clazzname);
		String sql="DELETE FROM clazz WHERE clazzname='"+clazzname+"'AND YEAR="+year+"";
		DBUtils.update(sql);
		System.out.println(sql);
		response.sendRedirect("tables.jsp");
	}

}
