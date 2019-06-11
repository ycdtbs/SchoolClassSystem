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
 * Servlet implementation class changelesson
 */
@WebServlet("/changelesson")
public class changelesson extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public changelesson() {
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
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("uft-8");
		Long classid = Long.parseLong(request.getParameter("classid").toString());
		int weekday =Integer.parseInt(request.getParameter("weekday").toString()) ;
		int lesson = Integer.parseInt(request.getParameter("lesson").toString());
		String  teacher= request.getParameter("teacher");
		teacher=new String(teacher.trim().getBytes("ISO-8859-1"), "UTF-8");
		System.out.println(classid);
		System.out.println(weekday);
		System.out.println(lesson);
		System.out.println(teacher);
		String sql="SELECT * FROM teacher WHERE teachername='"+teacher+"'";
		List<Map<String, Object>> teacherid = DBUtils.query(sql);
		 long tid=Long.parseLong(teacherid.get(0).get("id").toString());
		 String sql2="SELECT subject.id AS subjectid FROM SUBJECT JOIN teacher ON teacher.subjectid=subject.id WHERE teacher.id="+tid+"";
		 List<Map<String, Object>> subjectid = DBUtils.query(sql2);
		 long sid=Long.parseLong(subjectid.get(0).get("subjectid").toString());
		 String sql3="INSERT INTO lesson(weekdayid,subjectid,teacherid,clazzid,classnumber) VALUES ("+weekday+","+sid+","+tid+","+classid+","+lesson+")";
		 DBUtils.update(sql3);
		 response.sendRedirect("form.jsp?classid="+classid+"");
		
	}

}
