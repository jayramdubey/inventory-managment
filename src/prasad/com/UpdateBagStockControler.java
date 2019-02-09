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
 * Servlet implementation class UpdateMonitorController
 */
public class UpdateBagStockControler extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	

	protected void doPost(HttpServletRequest req, HttpServletResponse response) throws ServletException, IOException {


		 
		long mid = Long.parseLong(req.getParameter("bagID"));
		String bagName = req.getParameter("bagName");
		String bname = req.getParameter("brandName");
		String mNO = req.getParameter("bagModelNo");
		float price = Float.parseFloat(req.getParameter("bagPrice"));
		String type = req.getParameter("bagType");
		String size = req.getParameter("bagSize");
		
		Connection con  = null;
		PreparedStatement  stmt = null;
		ResultSet rs  = null;
	
		try {
			
			
			con= PrasadDatabaseUtil.getConnection();
			String sql="update PRASAD_BAG "+
		" Set BAG_NAME=?,BRAND_NAME=?,MODEL_NO=?,PRICE=?,BAG_TYPE=?," +
		"BAG_SIZE=? where ID=?";
			
			stmt = con.prepareStatement(sql);
			stmt.setString(1, bagName);
			stmt.setString(2,bname );
			stmt.setString(3, mNO);
			stmt.setFloat(4, price);
			stmt.setString(5, type);
			stmt.setString(6, size);
			stmt.setLong(7, mid);
			int executeUpdate = stmt.executeUpdate();
			
			req.setAttribute("msg", "stock update");
			req.getRequestDispatcher("ReadyBagsList.jsp").forward(req, response);
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			PrasadDatabaseUtil.closeConnection(con);
			
		}
		
		
		
		req.getRequestDispatcher("listmonitor.jsp").forward(req, response);
		
		
		
		
	}

}
