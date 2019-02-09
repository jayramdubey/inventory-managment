package parasad.com.bo;

public class BagRequiredRawItem {

	long id;
	String itemName;
	//ITEM_UNIT_TYPE_ID
	ItemUnitType itemUnitType;
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public String getItemName() {
		return itemName;
	}
	public void setItemName(String itemName) {
		this.itemName = itemName;
	}
	public ItemUnitType getItemUnitType() {
		return itemUnitType;
	}
	public void setItemUnitType(ItemUnitType itemUnitType) {
		this.itemUnitType = itemUnitType;
	}
	
	
	
}
