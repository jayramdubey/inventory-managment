package prasad.com;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import parasad.com.util.PrasadDatabaseUtil;

public class SignupControler extends HttpServlet{
	
	
	
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		//get parameters send by user
		
		
		String userID = req.getParameter("userId");
		String userName = req.getParameter("userName");
		String userPassword = req.getParameter("upass");
		String userType = req.getParameter("user_type");
		//sushil Dangi 
		
		//perform jdbc task 
		 
		//jay dubey
		
		long newid=getMaxId();
		Connection con  = null;
		PreparedStatement  stmt = null;
		ResultSet rs  = null;
	
		try {
			con= PrasadDatabaseUtil.getConnection();
			String sql="INSERT INTO LOGIN_PRASAD "+
		"(ID, USER_ID,USER_PASSWORD,USER_NAME,USER_TYPE)"+
		"VALUES(?,?,?,?,?)";
			stmt = con.prepareStatement(sql);
			stmt.setLong(1, getMaxId());
			stmt.setString(2, userID);
			stmt.setString(3, userPassword);
			stmt.setString(4, userName);
			stmt.setString(5, userType);
			int executeUpdate = stmt.executeUpdate();
			req.setAttribute("msg", "added successfuly");
			System.out.println(executeUpdate);
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			PrasadDatabaseUtil.closeConnection(con);
			
		}
		//send to specific page
 	
		req.getRequestDispatcher("homepage.jsp").forward(req, resp);
	}
	
	
	private static long getMaxId(){
		long newid=0;
		try {
		Connection conID = PrasadDatabaseUtil.getConnection();
		Statement stmtID = conID.createStatement();
		ResultSet rsID = stmtID.executeQuery("select Max(ID) from LOGIN_PRASAD");
		if(rsID.next()){
			newid = rsID.getLong(1)+1;
		}
		PrasadDatabaseUtil.closeConnection(conID);
		} catch (Exception e) {
			// TODO: handle exception
		}
		System.out.println(newid+"===================");
		return newid;
	}
	

}
