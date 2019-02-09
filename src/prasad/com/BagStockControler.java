package prasad.com;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import parasad.com.util.PrasadDatabaseUtil;


public class BagStockControler extends HttpServlet{
	
	
	
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		//get parameters send by user
		
		String bag_name = req.getParameter("b_name");
		String bag_bname = req.getParameter("b_bname");
		String bag_mNO = req.getParameter("b_mmodelNo");
		float bag_price = Float.parseFloat(req.getParameter("b_price"));
		String bag_type = req.getParameter("b_type");
		String bag_size = req.getParameter("b_size");
		
		//perform jdbc task 
		/*INSERT INTO PRASAD_BAG
		(ID,BAG_NAME,BRAND_NAME,MODEL_NO,PRICE,BAG_TYPE,BAG_SIZE)
		VALUES(1,'AMERICON_TUR','AMRCN','A123',200,'MEN','800');
		 	*/		
		
		
		long newBagid = getMaxId();
		Connection con  = null;
		PreparedStatement  stmt = null;
		ResultSet rs  = null;
	
		try {
			con= PrasadDatabaseUtil.getConnection();
			String sql="INSERT INTO PRASAD_BAG "+
		"(ID,BAG_NAME,BRAND_NAME,MODEL_NO,PRICE,BAG_TYPE,BAG_SIZE)"+
		"VALUES(?,?,?,?,?,?,?)";
			stmt = con.prepareStatement(sql);
			stmt.setLong(1, getMaxId());
			stmt.setString(2, bag_name);
			stmt.setString(3,bag_bname );
			stmt.setString(4, bag_mNO);
			stmt.setFloat(5, bag_price);
			stmt.setString(6, bag_type);
			stmt.setString(7, bag_size);
			int executeUpdate = stmt.executeUpdate();
			System.out.println(executeUpdate);
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			PrasadDatabaseUtil.closeConnection(con);
			
		}
		
		
		
		//send to specific page
		
/*		RequestDispatcher rd =req.getRequestDispatcher("listmonitor.jsp");
		rd.forward(req, resp);
*/		
		
		req.setAttribute("msg", "stock added");
		req.getRequestDispatcher("ReadyBagsList.jsp").forward(req, resp);
		
		
		
	}
	
	
	private static long getMaxId(){
		long newBagid=0;
		try {
		Connection conID = PrasadDatabaseUtil.getConnection();
		Statement stmtID = conID.createStatement();
		ResultSet rsID = stmtID.executeQuery("select Max(ID) from PRASAD_BAG");
		if(rsID.next()){
			newBagid = rsID.getLong(1)+1;
		}
		PrasadDatabaseUtil.closeConnection(conID);
		} catch (Exception e) {
			// TODO: handle exception
		}
		System.out.println(newBagid+"===================");
		return newBagid;
	}
	

}
