/* 주문정보 */

//도로명주소 팝업창
function goPopup(){
	// 주소검색을 수행할 팝업 페이지를 호출합니다.
	// 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrLinkUrl.do)를 호출하게 됩니다.
	var pop = window.open("/lushProject/popup/jusoPopup.jsp","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 
	
	// 모바일 웹인 경우, 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrMobileLinkUrl.do)를 호출하게 됩니다.
    //var pop = window.open("/popup/jusoPopup.jsp","pop","scrollbars=yes, resizable=yes"); 
}

//주소 반환하기
function jusoCallBack(roadAddrPart1, addrDetail, roadAddrPart2, zipNo){
	// 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.
	document.getElementById("zipNo").value = zipNo;	//우편번호
	
	var roadAddr = roadAddrPart1 + " " + roadAddrPart2;	//도로명주소 + 참고주소
	document.getElementById("roadAddr").value = roadAddr;
	
	document.getElementById("addrDetail").value = addrDetail;	//상세주소
}

//라디오버튼 == 직접입력 클릭시
function shipNew() {
	var delform = document.getElementsByClassName("delform");	//배송정보 텍스트필드
	console.log(delform[0].value);
	
	for (var i = 0; i < delform.length; i++) {
		delform[i].value = "";
	}
}

//라디오버튼 == 주문자정보와 동일 클릭시
function shipSame() {
	document.getElementById("receivName").value = document.getElementById("orderName").value;
	document.getElementById("receivTel").value = document.getElementById("orderTel").value;
}

//빈칸이 있는지 확인
function blank() {
	if (document.getElementById("orderName").value == "") {
		alert("주문하시는 분 정보를 입력해주세요.");
	} else if (document.getElementById("orderTel").value == "") {
		alert("주문하시는 분 휴대폰 번호 정보를 입력해 주세요.");
	} else if (document.getElementById("orderEmail").value == "") {
		alert("주문하시는 분 이메일 정보를 입력해 주세요.");
	} else if (document.getElementById("receivName").value == "") {
		alert("받으실 분 정보를 입력해 주세요.");
	} else if (document.getElementById("zipNo").value == "") {
		alert("받으실 곳 우편번호 정보를 입력해 주세요.");
	} else if (document.getElementById("addrDetail").value == "") {
		alert("받으실 곳 주소 정보를 입력해 주세요.");
	} else if (document.getElementById("receivTel").value == "") {
		alert("받으실 분 휴대폰 번호 정보를 입력해 주세요.");
	} else {
		pay();
	}
}

//결제하기 == 신용카드, 계좌이체 중 선택
function pay() {
	var radio = document.getElementsByName("pro-pay");	//선택버튼
	var total = document.getElementById("total-settle").value	//최종결제금액
	
	if (radio[0].checked == true) {
		location.href = "/lushProject/popup/payTest.jsp?total=" + total;
	} else {
		console.log("계좌이체");
	}
}