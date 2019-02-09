package prasad.com;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import parasad.com.Dao.StockDao;
import parasad.com.bo.RawStock;

public class UpdateRowStockConntroller extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		Long rowStockId = Long.parseLong(request.getParameter("rowStockId"));
		RawStock stock = StockDao.getStockById(rowStockId);
		request.setAttribute("stock", stock);
		request.getRequestDispatcher("update_stock.jsp").forward(request,response);
		
	
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		long stockID  = Long.parseLong(request.getParameter("stockID"));
		int unit  = Integer.parseInt(request.getParameter("totalUnit"));
		float price  =Float.parseFloat(request.getParameter("unitprice"));
		
		
		
		 RawStock stock = StockDao.getStockById(stockID);
		  if(stock!=null){
		  stock.setTotalUnit(unit);
		  stock.setPricePerUnit(price);
		  boolean result = StockDao.updateStock(stock);
		    if(result){
		    	request.setAttribute("msg", "stock updated successful");
		    }else{
		    	request.setAttribute("msg", "stock updated fail");
		    }
		  }
			request.getRequestDispatcher("stock_list.jsp").forward(request,	response);
	
	
	}

}
