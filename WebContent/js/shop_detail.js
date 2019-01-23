/* shop_info.jsp */

//구글 맵 추가하기
function initMap() {
	//위치값 가져오기
	var lats = document.getElementById('lat').value;
	var lngs = document.getElementById('lng').value;
	
	var lat_num = Number(lats);
	var lng_num = Number(lngs);
	
	//이름
	var snm = document.getElementById('snm').value;
	
	// 해당 지역의 위치값
	var shop_loca = {lat: lat_num, lng: lng_num};
	
	// 지도가 중심으로 가도록
	var map = new google.maps.Map(
		document.getElementById('map'), {zoom: 17, center: shop_loca});
	  
	// 마커찍기
	var marker = new google.maps.Marker({position: shop_loca, map: map});
	
	// 세부내용
	var contentString = '<div id="content">'+
	  '<div id="siteNotice">'+
	  '</div>'+
	  '<img src="/lushProject/img/map_logo.jpg" height=30px>'+
	  '<h3 id="firstHeading" class="firstHeading">' + snm + '</h3>';

	var infowindow = new google.maps.InfoWindow({
		content: contentString
		});
	
	marker.addListener('click', function() {
		infowindow.open(map, marker);
	});
}

function clk() {
	var sr = document.getElementById("sr").value;
	location.href = "/lushProject/shop/shop_sr.jsp?sr=" + sr;
}