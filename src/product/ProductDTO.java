package product;

public class ProductDTO {
	private String pcode;		//제품번호
	private String pnm;			//제품명
	private String category;	//제품 카테고리
	private int price;			//가격
	private String detail;		//제품상세설명
	private String img;			//제품이미지
	private int amount;			//제품수량 (장바구니용)
	
	public String getPcode() {
		return pcode;
	}
	public void setPcode(String pcode) {
		this.pcode = pcode;
	}
	public String getPnm() {
		return pnm;
	}
	public void setPnm(String pnm) {
		this.pnm = pnm;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getDetail() {
		return detail;
	}
	public void setDetail(String detail) {
		this.detail = detail;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
}
