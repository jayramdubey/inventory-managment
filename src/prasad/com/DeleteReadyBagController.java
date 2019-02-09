package prasad.com;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import parasad.com.util.PrasadDatabaseUtil;

/**
 * Servlet implementation class DeleteReadyBagController
 */
public class DeleteReadyBagController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest req, HttpServletResponse response) throws ServletException, IOException {
	
		 
		long mid = Long.parseLong(req.getParameter("readyBagId"));
		Connection con  = null;
		PreparedStatement  stmt = null;
		ResultSet rs  = null;
	
		try {
			
			
			con= PrasadDatabaseUtil.getConnection();
			String sql="delete from  PRASAD_BAG  where ID=?";
			stmt = con.prepareStatement(sql);
			stmt.setLong(1, mid);
			int i = stmt.executeUpdate();
			if(i>0){
			  req.setAttribute("msg", "stock Deleted successfuly");
			}else{
				req.setAttribute("msg", "stock not deleted");
			}
			req.getRequestDispatcher("ReadyBagsList.jsp").forward(req, response);
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			PrasadDatabaseUtil.closeConnection(con);
			
		}
		
		
		
		req.getRequestDispatcher("listmonitor.jsp").forward(req, response);
		
		
		
	}

}
