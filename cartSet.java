package Model;

public class cartSet {
	private int id;
	private int quantity;
//	private double price;

//	public cartSet(int id, int quantity) {
//		super();
//		this.id = id;
//		this.quantity = quantity;
//	}
	
	public void setId(int id){
		this.id = id;
	}

	public int getId() {
		return id;
	}
	
	public void setQuantity(int quantity){
		this.quantity = quantity;
	}

	public int getQuantity() {
		return quantity;
	}

//	public double getPrice() {
//		return price;
//	}
//
//	public void setPrice(double price) {
//		this.price = price;
//	}
}
