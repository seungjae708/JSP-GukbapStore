function CheckAddGukbap() {

	var id = document.getElementById("id");
	var name = document.getElementById("name");
	var price = document.getElementById("price");
	var orderQuantity = document.getElementById("orderQuantity");
	var reviewCount = document.getElementById("reviewCount");
	var description = document.getElementById("description");

	
	
	// 메뉴번호 체크
	if (id.value.length == 0 || isNaN(id.value)) {
		alert("[메뉴번호]\n숫자만 입력하세요");
		//price.select();
		id.focus();
		return false;
	}
	
	if (id.value < 0) {
		alert("[메뉴번호]\n음수를 입력할 수 없습니다");
		//id.select();
		id.focus();
		return false;
	} 
		
	// 메뉴명 체크	
	if (name.value.length < 4 || name.value.length > 12) {
		alert("[메뉴명]\n최소 4자에서 최대 50자까지 입력하세요");
		//name.select();
		name.focus();
		return false;
	}
	// 메뉴 가격 체크
	if (price.value.length == 0 || isNaN(price.value)) {
		alert("[가격]\n숫자만 입력하세요");
		//price.select();
		price.focus();
		return false;
	}

	if (price.value < 0) {
		alert("[가격]\n음수를 입력할 수 없습니다");
		//unitPrice.select();
		price.focus();
		return false;
	} 

	// 총 주문수량 체크
	if (isNaN(orderQuantity.value)) {
		alert("[총 주문수량]\n숫자만 입력하세요");
		//orderQuantity.select();
		orderQuantity.focus();
		return false;
	}
	
	// 리뷰수 체크
	if (isNaN(reviewCount.value)) {
		alert("[리뷰수]\n숫자만 입력하세요");
		//reviewCount.select();
		reviewCount.focus();
		return false;
	}
	
	// 상세정보 체크
	if (description.value.length < 4) {
		alert("[상세정보]\n최소 4자이상 입력하세요");
		//description.select();
		description.focus();
		return false;
	}
	
	function check(regExp, e, msg) {

		if (regExp.test(e.value)) {
			return true;
		}
		alert(msg);
		//e.select();
		e.focus();
		return false;
	}

	 document.newGukbap.submit()
}
