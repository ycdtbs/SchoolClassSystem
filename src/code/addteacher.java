package code;

import java.io.IOException;
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
 * Servlet implementation class addteacher
 */
@WebServlet("/addteacher")
public class addteacher extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public addteacher() {
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
		response.setCharacterEncoding("utf-8");
		String subjectname=request.getParameter("subjectname");//���տ�Ŀ����
		String teachername=request.getParameter("teachername");//���ս�ʦ����
		String userid=request.getParameter("userid");//�����û���
		String password=request.getParameter("password");//��������
		System.out.println(password);
		System.out.println(teachername);
		if(teachername==null||teachername=="") {
			response.sendRedirect("calendar.jsp");//�ж��Ƿ�Ϊ��ֵ
		}else {
			System.out.println(subjectname);
			System.out.println(teachername);
			String sql="SELECT id FROM SUBJECT WHERE subjectname='"+subjectname+"'";
			
			Object object=null;
			List<Map<String, Object>> id = DBUtils.query(sql);//���ݿ�Ŀ���Ʋ��Ŀid
			for (Map<String, Object> map : id) {
				 object = map.get("id");//�����õ���Ŀid
				
			}
			String sql2="INSERT INTO teacher(teachername,subjectid,userid) VALUES('"+teachername+"',"+object+",'"+userid+"')";
			DBUtils.update(sql2);//���ʦ���в�������
			String sql3="INSERT INTO USER(userid,username,PASSWORD,role) VALUES ("+userid+",'"+teachername+"',"+password+",1)";
			DBUtils.update(sql3);//��user���в�������
			response.sendRedirect("calendar.jsp");
		}
		
	}

}
