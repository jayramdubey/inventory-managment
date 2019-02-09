import parasad.com.Dao.StockDao;
import parasad.com.bo.RawStock;


public class Test4 {

	public static void main(String[] args) {

	  RawStock stock = StockDao.getStockById(1);
	  if(stock!=null){
	  System.out.println(stock.getId()+stock.getBagRequiredRawItem().getItemName());
	  System.out.println(stock.getId()+""+stock.getTotalUnit());
	  System.out.println(stock.getId()+stock.getPricePerUnit());
	  
	  stock.setTotalUnit(60);
	  boolean result = StockDao.updateStock(stock);
	  System.out.println(result);
	  }
	 
	  
	  System.out.println("after update");
	  
	  RawStock stock1 = StockDao.getStockById(1);
	  if(stock1!=null){
	  System.out.println(stock1.getId()+stock.getBagRequiredRawItem().getItemName());
	  System.out.println(stock1.getId()+""+stock.getTotalUnit());
	  System.out.println(stock1.getId()+stock.getPricePerUnit());
	  
	  }
	  
	  
	}

}
