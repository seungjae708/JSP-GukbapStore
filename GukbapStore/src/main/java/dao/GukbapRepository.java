package dao;

import java.util.ArrayList;
import dto.Gukbap;

public class GukbapRepository {
	
	private ArrayList<Gukbap> listOfGukbaps = new ArrayList<Gukbap>();
	
	private static GukbapRepository instance = new GukbapRepository();

	public static GukbapRepository getInstance(){
		return instance;
	} 
	
	public GukbapRepository() {
	
		Gukbap gukbap1= new Gukbap("01","순대국밥", 10000);
		gukbap1.setDescription("24시간 우려낸 사골 국물에 순대,머리고기.내장을 더하여 끓여낸 탕");
		gukbap1.setCategory("국밥");
		gukbap1.setOrderQuantity(5000);		
		gukbap1.setReviewRating(5);
		gukbap1.setReviewCount(1000);
		gukbap1.setFileName("순대국밥.jpg");
		
		
		Gukbap gukbap2= new Gukbap("02","내장국밥", 10000);
		gukbap2.setDescription("24시간 우려낸 사골 국물에 내장,콩나물,을 더하여 끓어낸 탕");
		gukbap2.setCategory("국밥");
		gukbap2.setOrderQuantity(3000);		
		gukbap2.setReviewRating(4);
		gukbap2.setReviewCount(600);
		gukbap2.setFileName("내장국밥.jpg");
		
		Gukbap gukbap3= new Gukbap("03","맑은소고기국밥", 11000);
		gukbap3.setDescription("소고기 육수에 소고기볼살.인삼.대추.버섯.당면을 더하여 끓여낸 탕");
		gukbap3.setCategory("국밥");
		gukbap3.setOrderQuantity(4000);		
		gukbap3.setReviewRating(5);
		gukbap3.setReviewCount(800);
		gukbap3.setFileName("맑은소고기국밥.jpg");
		
		Gukbap gukbap4= new Gukbap("04","얼큰소고기국밥", 11000);
		gukbap4.setDescription("소고기 육수에 소고기볼살,인삼,버섯,당면을 더하여 얼큰하게 끓인탕");
		gukbap4.setCategory("국밥");
		gukbap4.setOrderQuantity(2500);		
		gukbap4.setReviewRating(4);
		gukbap4.setReviewCount(500);
		gukbap4.setFileName("얼큰소고기국밥.jpg");
		
		Gukbap gukbap5= new Gukbap("05","모듬순대", 15000);
		gukbap5.setDescription("김치순대,야채순대,백순대 3가지맛을 한접시에 담았습니다");
		gukbap5.setCategory("순대");
		gukbap5.setOrderQuantity(1500);		
		gukbap5.setReviewRating(5);
		gukbap5.setReviewCount(300);
		gukbap5.setFileName("모듬순대.jpg");
		
		Gukbap gukbap6= new Gukbap("06","암뽕순대", 15000);
		gukbap6.setDescription("돼지막창에 선지,양배추,콩나물,다짐육,등을 넣어 만든 토종순대");
		gukbap6.setCategory("순대");
		gukbap6.setOrderQuantity(1000);		
		gukbap6.setReviewRating(5);
		gukbap6.setReviewCount(200);
		gukbap6.setFileName("암뽕순대.jpg");
		
		Gukbap gukbap7= new Gukbap("07","찰순대", 4000);
		gukbap7.setDescription("당면순대");
		gukbap7.setCategory("순대");
		gukbap7.setOrderQuantity(500);		
		gukbap7.setReviewRating(5);
		gukbap7.setReviewCount(50);
		gukbap7.setFileName("찰순대.jpg");
		
		listOfGukbaps.add(gukbap1);
		listOfGukbaps.add(gukbap2);
		listOfGukbaps.add(gukbap3);
		listOfGukbaps.add(gukbap4);
		listOfGukbaps.add(gukbap5);
		listOfGukbaps.add(gukbap6);
		listOfGukbaps.add(gukbap7);
				
	}
	public ArrayList<Gukbap> getAllGukbaps() {
		return listOfGukbaps;
	}
	
	public Gukbap getGukbapById(String GukbapId) {
		Gukbap gukbapById = null;

		for (int i = 0; i < listOfGukbaps.size(); i++) {
			Gukbap gukbap = listOfGukbaps.get(i);
			if (gukbap != null && gukbap.getGukbapId() != null && gukbap.getGukbapId().equals(GukbapId)) {
				
				gukbapById = gukbap;
				break;
			}
		}
		return gukbapById;
	}
	
	public void addBook(Gukbap gukbap) {
		listOfGukbaps.add(gukbap);
	}
}
