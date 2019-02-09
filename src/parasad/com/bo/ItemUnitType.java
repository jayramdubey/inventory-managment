package parasad.com.bo;

public class ItemUnitType {
	long id;
	String unitType;

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getUnitType() {
		return unitType;
	}

	public void setUnitType(String unitType) {
		this.unitType = unitType;
	}

	@Override
	public String toString() {
		return "ItemUnitType [id=" + id + ", unitType=" + unitType + "]";
	}

	
	
}
