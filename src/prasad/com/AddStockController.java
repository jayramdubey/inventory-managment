package prasad.com;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import parasad.com.Dao.StockDao;
import parasad.com.bo.BagRequiredRawItem;
import parasad.com.bo.RawStock;

/**
 * Servlet implementation class AddStockController
 */
public class AddStockController extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//get data from user
		long itemId  = Long.parseLong(request.getParameter("rawitemId"));
		int unit  = Integer.parseInt(request.getParameter("totalUnit"));
		float price  =Float.parseFloat(request.getParameter("unitprice"));
		
//call doa
		
		
		RawStock stock = new RawStock();
		stock.setTotalUnit(unit);
		stock.setPricePerUnit(price);
		
		BagRequiredRawItem item = new BagRequiredRawItem();
		item.setId(itemId);
		stock.setBagRequiredRawItem(item );
		RawStock obj = StockDao.addStock(stock );
//forward
		if(obj.getId()>0){
			request.setAttribute("msg", "stock added " +obj.getId());
			request.getRequestDispatcher("stock_list.jsp").forward(request,	response);
		}else{
			request.getRequestDispatcher("addstock.jsp").forward(request,	response);
			
		}
		
	}

}
