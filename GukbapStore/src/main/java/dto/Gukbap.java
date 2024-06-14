package dto;

import java.io.Serializable;

public class Gukbap implements Serializable {
	private static final long serialVersionUID=-4274700572038677000L;
	
	private String id;				//메뉴ID
	private String name;			//메뉴명
	private int price;				//가격
	private String description; 	//설명
	private String category; 		//분류
	private int orderQuantity; 		//주문수량
	private int reviewRating;		//리뷰평점
	private int reviewCount;		//리뷰수
	private String fileName;        //이미지
	private int shoppingBasket;		//장바구니에 담은 개수

	public Gukbap() {
		super();
	}

	public Gukbap(String id, String name, int price) {
		super();
		this.id = id;
		this.name = name;
		this.price = price;
	}

	public String getGukbapId() {
		return id;
	}

	public void setGukbapId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public int getOrderQuantity() {
		return orderQuantity;
	}

	public void setOrderQuantity(int orderQuantity) {
		this.orderQuantity = orderQuantity;
	}

	public int getReviewRating() {
		return reviewRating;
	}

	public void setReviewRating(int reviewRating) {
		this.reviewRating = reviewRating;
	}

	public int getReviewCount() {
		return reviewCount;
	}

	public void setReviewCount(int reviewCount) {
		this.reviewCount = reviewCount;
	}
	
	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	
	public int getShoppingBasket() {
		return shoppingBasket;
	}

	public void setShoppingBasket(int shoppingBasket) {
		this.shoppingBasket = shoppingBasket;
	}

	
}
