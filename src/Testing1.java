import parasad.com.Dao.StockDao;
import parasad.com.bo.BagRequiredRawItem;
import parasad.com.bo.RawStock;


public class Testing1 {

	public static void main(String[] args) {
		/*List<BagRequiredRawItem> itemList = StockDao.getAllBagRequiredRawItem();

		for (BagRequiredRawItem obj : itemList) {
			System.out.println(obj.getId()+obj.getItemName());
		}*/
		/*
		1cloth
		2spange
		3chain
		4runner
		5stikers
		6bottlenet
		7plastic wrapper*/
		
		
		RawStock stock = new RawStock();
		BagRequiredRawItem item = new BagRequiredRawItem();
		item.setId(6);
		stock.setBagRequiredRawItem(item );
		stock.setTotalUnit(5);
		stock.setPricePerUnit(100f);
		
		RawStock obj = StockDao.addStock(stock );
		System.out.println(obj.getId());
	}

}
