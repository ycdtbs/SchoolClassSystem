package tools;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

//JDBC工具类
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
		//空着就行
	}
	
	//单例模式,保证内存中只有一个对象存在
	public static DBUtil getDB() {
		if(db == null) {
			//说明之前没有值
			db = new DBUtil();
		}
		return db;
	}
	
	//加载驱动，获得连接
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
	
	//处理增删改操作的sql语句
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
	
	//处理查询操作的sql语句
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
	
	//释放资源（关闭连接对象）
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