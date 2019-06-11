package code;


import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import tools.DBUtil;
import tools.DBUtils;

/**
 * Servlet implementation class loginServlet
 */
@WebServlet("/loginServlet")
public class loginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public loginServlet() {
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
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		String id=request.getParameter("id");
		String pwd=request.getParameter("pwd");
		System.out.println("ÕËºÅÎª"+id);
		System.out.println("ÃÜÂëÎª"+pwd);
		String sql="SELECT * FROM user WHERE userid='"+id+"' AND password='"+pwd+"'";
		List<Map<String, Object>> resultlist = DBUtils.query(sql);
		if(resultlist.isEmpty()) {
			System.out.println("µÇÂ½Ê§°Ü");
			String index="mistake";
			request.setAttribute("key",index );
			request.getRequestDispatcher("login.jsp").forward(request, response);
		}else {
			response.sendRedirect("index.jsp");
		}
		

	}

}
