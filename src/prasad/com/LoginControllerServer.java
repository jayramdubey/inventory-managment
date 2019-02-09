package prasad.com;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


/**
 * Servlet implementation class LoginControllerServer
 */
public class LoginControllerServer extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginControllerServer() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

   //getting param values from user (request object)
		String uname = request.getParameter("u_name");
		String upass = request.getParameter("u_pass");
		
		
		//validation.3
		
		
		//jdbc
		System.out.println(uname+upass);
		Connection con =null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		//load diver
		User user= null;
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			String url="jdbc:oracle:thin:@localhost:1521:XE",
			username="system",
			userpassword="root";
			con = DriverManager.getConnection(url,username,userpassword);
			String query="select ID, USER_ID,USER_PASSWORD,USER_NAME,USER_TYPE from LOGIN_PRASAD where USER_ID=?" +
					" and USER_PASSWORD=?";
			stmt = con.prepareStatement(query);
			stmt.setString(1, uname);
			stmt.setString(2, upass);
			rs = stmt.executeQuery();
			
			if(rs.next()){
				//success
				
				long id =rs.getLong("ID");
				String userid = rs.getString("USER_ID");
				String name = rs.getString("USER_NAME");
				String type = rs.getString("USER_TYPE");
				
				user  = new User();
				user.setId(id);
				user.setUserID(userid);
				user.setUserName(name);
				user.setUserType(type);
			}else{
				//fails
				System.out.println("=============================");
			}
			
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			if(con!=null){
			try {
				con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			}
			
		}//finally
		
		
		RequestDispatcher rd = null;
		
		if(user!=null){
			//session add object user object
			
			HttpSession session = request.getSession();
			session.setAttribute("userkey", user);
			rd = request.getRequestDispatcher("homepage.jsp");
		}else{
			//request error message
			request.setAttribute("Error", "invalide user or password");
			rd = request.getRequestDispatcher("login.jsp");
		}
		rd.forward(request, response);
		
		
		
		
		
	}

}
