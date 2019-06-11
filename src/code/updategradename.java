package code;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import tools.DBUtils;

/**
 * Servlet implementation class updategradename
 */
@WebServlet("/updategradename")
public class updategradename extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public updategradename() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		this.doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("UTF-8"); 
		String id= request.getParameter("id");
		String newnames= request.getParameter("name");
		newnames=new String(newnames.trim().getBytes("ISO-8859-1"), "UTF-8");
		System.out.println(id);
		System.out.println(newnames);
		String sql="update grade set gradename='"+newnames+"' where id="+id+" ";
		DBUtils.update(sql);
		response.sendRedirect("tables.jsp");
		}

}
