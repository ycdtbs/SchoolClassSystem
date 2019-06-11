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
 * Servlet implementation class login
 */
@WebServlet("/login")
public class login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public login() {
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
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("utf-8");
		String id=request.getParameter("id");
		String pwd=request.getParameter("pwd");
		System.out.println("ÕËºÅÎª"+id);
		System.out.println("ÃÜÂëÎª"+pwd);
		String sql="SELECT username,role FROM user WHERE userid='"+id+"' AND password='"+pwd+"'";
		List<Map<String, Object>> resultlist = DBUtils.query(sql);
		if(resultlist.isEmpty()) {
			System.out.println("µÇÂ½Ê§°Ü");
			String index="mistake";
			request.setAttribute("key",index );
			request.getRequestDispatcher("login.jsp").forward(request, response);
			
		}else {
			for (Map<String, Object> map : resultlist) {
				Object object = map.get("role");
				Object object2 = map.get("username");
				
				int role= Integer.parseInt(object.toString());
				
				String username=object2.toString();
				System.out.println(username);
				System.out.println(role);
				
				if(role==2) {
					request.setAttribute("name",username );
					request.getRequestDispatcher("index.jsp").forward(request, response);
				}if(role==1) {
					System.out.println("111");
					System.out.println(username+"ceshi");
					request.setAttribute("name",username );
					request.getRequestDispatcher("index2.jsp").forward(request, response);
				}
			}
			
			
		}
		

	}
}
