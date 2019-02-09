package parasad.com.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import prasad.com.User;

public class PrasadDatabaseUtil {

  public static Connection getConnection(){
	  Connection con =null;
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			String url="jdbc:oracle:thin:@localhost:1521:XE",
			username="system",
			userpassword="root";
			con = DriverManager.getConnection(url,username,userpassword);
	  
		}catch (Exception e) {
			e.printStackTrace();
		}
	  
	  
	  return con;
  } 
	
  public static void closeConnection(  Connection con){
  
      if(con!=null){
    	  try {
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
    	  
      }
  }
}
