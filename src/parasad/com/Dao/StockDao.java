package parasad.com.Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import parasad.com.bo.BagRequiredRawItem;
import parasad.com.bo.ItemUnitType;
import parasad.com.bo.RawStock;
import parasad.com.util.PrasadDatabaseUtil;

public class StockDao {
	
	 static Map<Long,ItemUnitType> itemUnitTypeMap = null;
	 
	public static Map<Long,ItemUnitType> getItemUnitTypeMap(){
		
		if(itemUnitTypeMap==null){
			
		
		Connection con =null ;
		Statement stmt = null;
		ResultSet rs = null;
		
		try {
			con  = PrasadDatabaseUtil.getConnection();
			stmt = con.createStatement();
			rs = stmt.executeQuery("select *  from ITEM_UNIT_TYPE");
			itemUnitTypeMap  = new HashMap<Long, ItemUnitType>();
			while(rs.next()){
				long id = rs.getLong("ID");
				String ut = rs.getString("UNIT_TYPE");
				ItemUnitType itutypeObj  = new ItemUnitType();
				itutypeObj.setId(id);
				itutypeObj.setUnitType(ut);
				itemUnitTypeMap.put(id, itutypeObj);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			PrasadDatabaseUtil.closeConnection(con);
		}
		
		}//end if
		return itemUnitTypeMap;
	}
	
	
	public static List<BagRequiredRawItem>getAllBagRequiredRawItem(){
		List<BagRequiredRawItem> list = new ArrayList<BagRequiredRawItem>();
	
		Connection con =null ;
		Statement stmt = null;
		ResultSet rs = null;
		
		try {
			con  = PrasadDatabaseUtil.getConnection();
			stmt = con.createStatement();
			rs = stmt.executeQuery("select ID,ITEM_NAME from BAG_REQUIRED_RAW_ITEM");
			while(rs.next()){
				BagRequiredRawItem brrItem=new BagRequiredRawItem();
				brrItem.setId(rs.getLong("ID"));
				brrItem.setItemName(rs.getString("ITEM_NAME"));
				//rs.getLong("ITEM_UNIT_TYPE_ID");
				list.add(brrItem);
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			PrasadDatabaseUtil.closeConnection(con);
		}
		
		return list;
	}
	

	public static RawStock addStock(RawStock stock){
		
		Connection con =null ;
		PreparedStatement stmt = null;
		
		try {
			con  = PrasadDatabaseUtil.getConnection();
			String sql="insert into raw_stock"
					+ "(ID,BAG_REQUIRED_ROW_ITEM_ID,TOTAL__UNIT,PRICE_PER_UNIT)"
					+ "values (?,?,?,?)";
			stmt = con.prepareStatement(sql);
			
			long maxId = maxRawStockID(con);
			stock.setId(maxId);
			stmt.setLong(1, stock.getId());
			stmt.setLong(2, stock.getBagRequiredRawItem().getId());
			stmt.setInt(3, stock.getTotalUnit());
			stmt.setFloat(4, stock.getPricePerUnit());
			stmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			PrasadDatabaseUtil.closeConnection(con);
		}
		
		return stock;
	}
	
	
public static long maxRawStockID(Connection con)throws SQLException{
	long id=0;
		con = PrasadDatabaseUtil.getConnection();
		Statement stmt = con.createStatement();
		ResultSet rs = stmt.executeQuery("select max(ID) from raw_stock");
		if(rs.next()){
		 id=rs.getLong(1);
		}
	
	return id+1;
	
}	


public static List<RawStock> getAllStock(){
	
	List<RawStock> stockList  = new ArrayList<RawStock>();
	Connection con =null ;
	PreparedStatement stmt = null;
	ResultSet rs  = null;
	try {
		con  = PrasadDatabaseUtil.getConnection();
		String sql="select ID,BAG_REQUIRED_ROW_ITEM_ID,TOTAL__UNIT,PRICE_PER_UNIT "
				+ "from  raw_stock";
		stmt = con.prepareStatement(sql);
		rs  = stmt.executeQuery();
		while(rs.next()){
			RawStock stock = new RawStock();
			
			stock.setId(rs.getLong("ID"));
			long itemId = rs.getLong("BAG_REQUIRED_ROW_ITEM_ID");
			
			//fill 
			//Select * BAG_REQUIRED_RAW_ITEM" 
			//ID	ITEM_NAME	ITEM_UNIT_TYPE_ID
			
			Statement stmt2 = con.createStatement();
			ResultSet rs2 = stmt2.executeQuery("Select * FROM BAG_REQUIRED_RAW_ITEM where id="+itemId);
			if(rs2.next()){
				BagRequiredRawItem item = new BagRequiredRawItem();
				item.setId(itemId);

				item.setItemName(rs2.getString("ITEM_NAME"));
				long iutID = rs2.getLong("ITEM_UNIT_TYPE_ID");
				
				ItemUnitType iutObj =getItemUnitTypeMap().get(iutID);
				
				item.setItemUnitType(iutObj);
				stock.setBagRequiredRawItem(item);
			}
			
			
			/*//fill inner object BagRequiredRawItem
			      Statement stmt2 = con.createStatement();
			   ResultSet rs2 =  stmt2.executeQuery("select * from  BAG_REQUIRED_RAW_ITEM "
			      		+ " WHERE BAG_REQUIRED_ROW_ITEM_ID="+itemId);
			
			//endfill inner object BagRequiredRawItem
			 	*/			
			
			
			stock.setTotalUnit(rs.getInt("TOTAL__UNIT"));
			stock.setPricePerUnit(rs.getFloat("PRICE_PER_UNIT"));
			
			stockList.add(stock);
		}
		
	} catch (Exception e) {
		e.printStackTrace();
	}finally{
		PrasadDatabaseUtil.closeConnection(con);
	}
	
	return stockList;
}




public static RawStock getStockById(long id){
	
	Connection con =null ;
	PreparedStatement stmt = null;
	ResultSet rs  = null;
	try {
		con  = PrasadDatabaseUtil.getConnection();
		String sql="select* from  raw_stock  where ID=?" ;
		stmt = con.prepareStatement(sql);
		stmt.setLong(1, id);
		rs  = stmt.executeQuery();
		if(rs.next()){
			RawStock stock = new RawStock();
			
			stock.setId(rs.getLong("ID"));
			long itemId = rs.getLong("BAG_REQUIRED_ROW_ITEM_ID");
			Statement stmt2 = con.createStatement();
			ResultSet rs2 = stmt2.executeQuery("Select * FROM BAG_REQUIRED_RAW_ITEM where id="+itemId);
			if(rs2.next()){
				BagRequiredRawItem item = new BagRequiredRawItem();
				item.setId(itemId);

				item.setItemName(rs2.getString("ITEM_NAME"));
				long iutID = rs2.getLong("ITEM_UNIT_TYPE_ID");
				
				ItemUnitType iutObj =getItemUnitTypeMap().get(iutID);
				
				item.setItemUnitType(iutObj);
				stock.setBagRequiredRawItem(item);
			}
			
			
			stock.setTotalUnit(rs.getInt("TOTAL__UNIT"));
			stock.setPricePerUnit(rs.getFloat("PRICE_PER_UNIT"));
			
			return stock;
		}
		
	} catch (Exception e) {
		e.printStackTrace();
	}finally{
		PrasadDatabaseUtil.closeConnection(con);
	}
	
	return null;
}





public static boolean updateStock(RawStock stock){
	
	Connection con =null ;
	PreparedStatement stmt = null;
	boolean isUpdate = false;
	try {
		con  = PrasadDatabaseUtil.getConnection();
		String sql="update raw_stock "
				+ " SET TOTAL__UNIT=?,PRICE_PER_UNIT=? WHERE ID=?";
		stmt = con.prepareStatement(sql);
		
		stmt.setInt(1, stock.getTotalUnit());
		stmt.setFloat(2, stock.getPricePerUnit());
		stmt.setLong(3, stock.getId());
		int i = stmt.executeUpdate();
		if(i>0){
			isUpdate = true;
		}
		
	} catch (Exception e) {
		e.printStackTrace();
	}finally{
		PrasadDatabaseUtil.closeConnection(con);
	}
	
	return isUpdate;
}




public static boolean deleteStock(long stockId){
	
	Connection con =null ;
	PreparedStatement stmt = null;
	boolean isDelete = false;
	try {
		con  = PrasadDatabaseUtil.getConnection();
		String sql="delete from raw_stock WHERE ID=?";
		stmt = con.prepareStatement(sql);
		stmt.setLong(1, stockId);
		int i = stmt.executeUpdate();
		if(i>0){
			isDelete = true;
		}
		
	} catch (Exception e) {
		e.printStackTrace();
	}finally{
		PrasadDatabaseUtil.closeConnection(con);
	}
	
	return isDelete;
}





	
}
