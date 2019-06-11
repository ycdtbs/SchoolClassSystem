package tools;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * JDBC宸ュ叿绫�
 * @author Tony
 */

public class DBUtils {
	
	private static Connection conn = null;
	private static Statement stmt = null;
	private static ResultSet rs = null;
	private static String url = "jdbc:mysql://localhost:3308/classsystem";
	private static String username = "root";
	private static String password = "mysql";
	
	/**
	 * @鎻忚堪:鐢ㄦ潵鍦ㄧ被涓渶鍏堟墽琛屾暟鎹簱鐨勯┍鍔ㄥ姞杞�
	 */
	static{
		
		try{
			Class.forName("com.mysql.jdbc.Driver");
		}catch(ClassNotFoundException e){
			System.out.println("璇锋鏌ラ┍鍔ㄥ寘鏄惁瀵煎叆鍥犱负鎵句笉鍒伴┍鍔ㄧ被锛�");
			e.printStackTrace();
		}
		
	}
	
	/**
	 * @鎻忚堪锛氬缓绔嬫暟鎹簱杩炴帴骞惰繑鍥炵粰寮�鍙戣�呰繛鎺ュ璞�
	 * @浣滆�咃細Tony
	 * @鍙傛暟锛欯return
	 * @杩斿洖鍊硷細Connection
	 */
	private static Connection getConn(){
		
		try{
			conn = DriverManager.getConnection(url,username,password);
			return conn;
		}catch(Exception e){
			System.out.println("瀵逛笉璧疯繛鎺ヤ笉涓婃暟鎹簱,璇锋鏌RL OR USERNAME OR PASSWORD");
			e.printStackTrace();
			return null;
		}
		
	}
	
	/**
	 * @鎻忚堪锛氭墽琛屾洿鏂版暟鎹簱鐨凷QL璇彞
	 * @浣滆�咃細Tony
	 * @鍙傛暟锛欯param sql
	 * @鍙傛暟锛欯return
	 * @杩斿洖鍊硷細int = 褰卞搷琛ㄤ腑璁板綍琛屾暟  鏇存柊鎴愬姛 = >0鐨勬暣鏁�  鏇存柊澶辫触 = 0
	 */
	public static int update(String sql){
		try{
			stmt = getConn().createStatement();
			return stmt.executeUpdate(sql);
		}catch(SQLException e){
			System.out.println("鏇存柊澶辫触璇锋鏌ql璇彞鐨勮娉曞強鏍煎紡");
			e.printStackTrace();
			return -1;
		}
	}
	
	/**
	 * @鎻忚堪锛氭墽琛屾煡璇㈡暟鎹簱鐨凷QL璇彞
	 * @浣滆�咃細Tony
	 * @鍙傛暟锛欯param sql
	 * @鍙傛暟锛欯return
	 * @杩斿洖鍊硷細List<Map<String,Object>>
	 */
	public static List<Map<String,Object>> query(String sql){
	
		try{
			
			ArrayList<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
			
			stmt = getConn().createStatement();
			rs = stmt.executeQuery(sql);
			//鑾峰緱缁撴瀯鍖栫殑缁撴灉闆嗗璞″寘鍚〃淇℃伅
			ResultSetMetaData rsmd = rs.getMetaData();
			//鑾峰緱鎴戞墍鏌ヨ鐨勮〃鐨勬�诲垪鏁�
			int columnCount = rsmd.getColumnCount();
			
			while(rs.next()){
				Map<String,Object> map = new HashMap<String,Object>();
				for(int i = 1; i<=columnCount; i++){
					String columnName = rsmd.getColumnLabel(i);
					Object columnValue = rs.getObject(columnName);
					map.put(columnName, columnValue);
				}
				list.add(map);
			}
			
			return list;
		}catch(SQLException e){
			System.out.println("鏌ヨ澶辫触璇锋鏌ql璇彞鐨勮娉曞強鏍煎紡");
			e.printStackTrace();
			return null;
		}
	}
	
	/**
	 * @鎻忚堪锛氬叧闂笁澶у璞�
	 * @浣滆�咃細Tony
	 * @鍙傛暟锛�
	 * @杩斿洖鍊硷細void
	 */
	private static void guanBi(){
		
		if(rs != null){
			try {
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if(stmt != null){
			try {
				stmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if(conn != null){
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	
	
}
