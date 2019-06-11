package code;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import tools.DBUtils;

/**
 * Servlet implementation class updatepassword2
 */
@WebServlet("/updatepassword2")
public class updatepassword2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public updatepassword2() {
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
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		String newpassword = request.getParameter("newpassword");
		String userid = request.getParameter("userid");
		String name=request.getParameter("username");
		name=new String(name.trim().getBytes("ISO-8859-1"), "UTF-8");
		System.out.println(newpassword);
		System.out.println(userid);
		System.out.println(name);
		String sql1="UPDATE USER SET  PASSWORD='"+newpassword+"' WHERE userid="+userid+"";
		DBUtils.update(sql1);
		System.out.println("updateΩÁ√Ê"+name);
		request.setAttribute("name",name );
		request.getRequestDispatcher("inf.jsp").forward(request, response);
	}

}
