package code;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import tools.DBUtils;

/**
 * Servlet implementation class addsubject
 */
@WebServlet("/addsubject")
public class addsubject extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public addsubject() {
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
		String subjectname=request.getParameter("name");
		if(subjectname!=""&&subjectname!=null) {
			System.out.println(subjectname);
			subjectname=new String(subjectname.trim().getBytes("ISO-8859-1"), "UTF-8");
			System.out.println(subjectname);
			
			String sql="INSERT INTO SUBJECT(subjectname) VALUES('"+subjectname+"')";
			DBUtils.update(sql);
			response.sendRedirect("stats.jsp");
		}else {
			response.sendRedirect("stats.jsp");
		}
		
		
	}

}
