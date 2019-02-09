package parasad.com.bo;

public class RawStock {
 long id;
 //BAG_REQUIRED_ROW_ITEM_ID
 BagRequiredRawItem bagRequiredRawItem;
 int totalUnit;
 float pricePerUnit;
public long getId() {
	return id;
}
public void setId(long id) {
	this.id = id;
}
public BagRequiredRawItem getBagRequiredRawItem() {
	return bagRequiredRawItem;
}
public void setBagRequiredRawItem(BagRequiredRawItem bagRequiredRawItem) {
	this.bagRequiredRawItem = bagRequiredRawItem;
}
public int getTotalUnit() {
	return totalUnit;
}
public void setTotalUnit(int totalUnit) {
	this.totalUnit = totalUnit;
}
public float getPricePerUnit() {
	return pricePerUnit;
}
public void setPricePerUnit(float pricePerUnit) {
	this.pricePerUnit = pricePerUnit;
}
 
 
}
