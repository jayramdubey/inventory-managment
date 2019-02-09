import java.util.List;

import parasad.com.Dao.StockDao;
import parasad.com.bo.BagRequiredRawItem;
import parasad.com.bo.RawStock;


public class Testing2 {

	public static void main(String[] args) {
		 List<RawStock> itemList = StockDao.getAllStock();
		 for (RawStock stock : itemList) {
			 System.out.println(stock.getId()+":"+stock.getPricePerUnit()+":"+ stock.getTotalUnit());
			System.out.println(stock.getBagRequiredRawItem().getId());
			System.out.println(stock.getBagRequiredRawItem().getItemName());
			System.out.println("--------");
		}

	}

}
