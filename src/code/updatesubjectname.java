package code;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import tools.DBUtils;

/**
 * Servlet implementation class updatesubjectname
 */
@WebServlet("/updatesubjectname")
public class updatesubjectname extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public updatesubjectname() {
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
		String subjectname=request.getParameter("subjectname");
		String subjectid=request.getParameter("id");
		System.out.println(subjectname);
		System.out.println(subjectid);
		subjectname=new String(subjectname.trim().getBytes("ISO-8859-1"), "UTF-8");
		String sql="UPDATE SUBJECT SET subjectname='"+subjectname+"'WHERE id="+subjectid+"";
		DBUtils.update(sql);
		response.sendRedirect("stats.jsp");
	
	}

}
