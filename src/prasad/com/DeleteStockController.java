package prasad.com;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import parasad.com.Dao.StockDao;

/**
 * Servlet implementation class DeleteStockController
 */
public class DeleteStockController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		long rowStockId = Long.parseLong(request.getParameter("rowStockId"));
		boolean result = StockDao.deleteStock(rowStockId);

		if(result){
	    	request.setAttribute("msg", "stock deleted successful");
	    }else{
	    	request.setAttribute("msg", "stock delation failed");
	    }
		request.getRequestDispatcher("stock_list.jsp").forward(request,	response);
		
	}

}
