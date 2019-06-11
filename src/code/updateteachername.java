package code;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import tools.DBUtils;

/**
 * Servlet implementation class updateteachername
 */
@WebServlet("/updateteachername")
public class updateteachername extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public updateteachername() {
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
		String name = request.getParameter("name");
		String id = request.getParameter("id");
		name=new String(name.trim().getBytes("ISO-8859-1"), "UTF-8");
		id=new String(id.trim().getBytes("ISO-8859-1"), "UTF-8");
		System.out.println(name);
		System.out.println(id);
		String sql="UPDATE teacher SET teachername='"+name+"' WHERE id="+id+"";
		DBUtils.update(sql);
		response.sendRedirect("calendar.jsp");
	}

}
