/* 상세페이지 */

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
function change(num) {
	var number = document.getElementById("number"); //구매수량
	var hidden_num = document.getElementsByName("num");	//구매수량을 넣을 히든태그
	
	var price = document.getElementById("price").getAttribute("alt"); //상품가격
	var sum = document.getElementById("sum"); //합계
	
	var x = Number(number.value)+num;
	
	if (x < 1) {
		x = 1;
	}
	
	//구매수량조절
	number.value = x;
	hidden_num[0].value = x;
	hidden_num[1].value = x;
	
	//합계
	sum.innerHTML = number_format(Number(price) * x);
}