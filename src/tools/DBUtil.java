package tools;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

//JDBC������
public class DBUtil {
	
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
	private final String URL ="jdbc:mysql://localhost:3308/classsystem";
	private final String USER= "root";
	private final String PWD = "mysql";
	private final String DRIVER = "com.mysql.jdbc.Driver";
	static DBUtil db = null;
	
	private DBUtil() {
		//���ž���
	}
	
	//����ģʽ,��֤�ڴ���ֻ��һ���������
	public static DBUtil getDB() {
		if(db == null) {
			//˵��֮ǰû��ֵ
			db = new DBUtil();
		}
		return db;
	}
	
	//�����������������
	public Connection getConn() {
		try {
			Class.forName(DRIVER);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		try {
			conn = DriverManager.getConnection(URL, USER, PWD);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return conn;
		
	}
	
	//������ɾ�Ĳ�����sql���
	public int update(String sql) {
		int num=0;
		conn=getConn();
		try {
			stmt=conn.createStatement();
			num=stmt.executeUpdate(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return num;
	}
	
	//�����ѯ������sql���
	public ResultSet query(String sql) {
		conn=getConn();
		try {
			stmt=conn.createStatement();
			rs = stmt.executeQuery(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return rs;
		
	}
	
	//�ͷ���Դ���ر����Ӷ���
	public void close() {
		try {
			if(rs != null) {
				rs.close();
			}
			
			if(stmt != null) {
				stmt.close();
			}
			
			if(conn != null) {
				conn.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}