import java.util.Map;
import java.util.Set;

import parasad.com.Dao.StockDao;
import parasad.com.bo.ItemUnitType;


public class Test3 {

	public static void main(String[] args) {
		Map<Long, ItemUnitType> map = StockDao.getItemUnitTypeMap();
		
		//System.out.println(map.size());
		
		Set<Long> ids = map.keySet();
		for (Long id : ids) {
			//System.out.println(id);
			System.out.println(map.get(id).getId());
			System.out.println(map.get(id).getUnitType());
		}
		
		

	}

}
