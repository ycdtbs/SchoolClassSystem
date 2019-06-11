package code;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import tools.DBUtils;

/**
 * Servlet implementation class updateteachersubjectname
 */
@WebServlet("/updateteachersubjectname")
public class updateteachersubjectname extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public updateteachersubjectname() {
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
		String subjectname = request.getParameter("subjectname");
		String teacherid = request.getParameter("id");
		subjectname=new String(subjectname.trim().getBytes("ISO-8859-1"), "UTF-8");
		System.out.println(subjectname);
		System.out.println(teacherid);
		String sql1="SELECT id FROM SUBJECT WHERE subjectname='"+subjectname+"'";
		List<Map<String, Object>> subjectid = DBUtils.query(sql1);
		for (Map<String, Object> sublist : subjectid) {
			Object object = sublist.get("id");
			String sql2="UPDATE teacher SET subjectid="+object+" WHERE id="+teacherid+"";
			DBUtils.update(sql2);
			System.out.println(sql2);
		}
		response.sendRedirect("calendar.jsp");
	}

}
