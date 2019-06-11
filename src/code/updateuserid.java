package code;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import tools.DBUtils;

/**
 * Servlet implementation class updateuserid
 */
@WebServlet("/updateuserid")
public class updateuserid extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public updateuserid() {
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
		String oldid = request.getParameter("userid");
		String newid = request.getParameter("newuserid");
		System.out.println(oldid);
		System.out.println(newid);
		String sql1="UPDATE teacher SET userid="+newid+" WHERE userid="+oldid+"";
		String sql2="UPDATE user SET userid="+newid+" WHERE userid="+oldid+"";
		DBUtils.update(sql1);
		DBUtils.update(sql2);
		response.sendRedirect("calendar.jsp");
		
	}

}
