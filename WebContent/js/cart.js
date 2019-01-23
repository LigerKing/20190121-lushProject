/* 장바구니 영역 */

/* 금액표기 (콤마넣기) */
function number_format(num) {
	var num_str = num.toString();
	var result = '';
		
	for (var i = 0; i < num_str.length; i++) {
		var tmp = num_str.length-(i+1);
		if (i%3==0 && i!=0) result = ',' + result;
		result = num_str.charAt(tmp) + result;
	}
	
	return result;
}

/* 금액합계계산 */
function change(seq, num) {
	var number = document.getElementsByClassName("number")[seq]; //구매수량
	
	var price = document.getElementsByClassName("prod-price")[seq]; //상품가격
	var deliv = Number(document.getElementsByName("deliv")[seq].value);	//배송비
	
	var sum = document.getElementsByClassName("sum")[seq]; //합계
	
	var x = Number(number.value)+num;
	
	if (x < 1) {
		x = 1;
	}
	
	//구매수량조절
	number.value = x;
	
	//합계
	sum.innerHTML = number_format((Number(price.value) * x) + deliv);
}

/* 삭제하기 */
function del() {
	var delAmt = 0;	//체크된 갯수 
	
	var cartCheck = document.getElementsByName("check");
	var cartDel = document.getElementById("cart_del");
	
	for (var i = 0; i < cartCheck.length; i++) {
		if (cartCheck[i].checked == true) {
			delAmt++;
		}		
	}
	
	if (delAmt != 0) {
		var x = confirm("선택하신 " + delAmt + "개 상품을 장바구니에서 삭제하시겠습니까?");
		
		if (x) {
			var arrDel = new Array(delAmt);
			
			for (var i = 0; i < cartCheck.length; i++) {
				
				if (cartCheck[i].checked == true) {
					arrDel[i] = cartCheck[i].value;
				}	
				
			}
			cartDel.value = arrDel;
			console.log(arrDel);
		}
	} else {
		alert("선택하신 상품이 없습니다.");	
	}
}
