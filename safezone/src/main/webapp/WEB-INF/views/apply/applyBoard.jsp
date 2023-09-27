<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<title>Insert title here</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
	<!-- 카카오맵API -->
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f4352b5c75fa4dee61f430ab3f1ff6f4&libraries=services,clusterer"></script>
<script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
<!-- Custom styles for this template -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css"
	rel="stylesheet">
	<script src="https://kit.fontawesome.com/f507061817.js""></script>
<link href="/safezone/resources/css/style.css" rel="stylesheet">
   <style>
    .map_wrap {position:relative;width:100%;height:350px;}
    .title {font-weight:bold;display:block;}
    .hAddr {position:absolute;left:10px;top:10px;border-radius: 2px;background:#fff;background:rgba(255,255,255,0.8);z-index:1;padding:5px;}
    #centerAddr {display:block;margin-top:2px;font-weight: normal;}
    .bAddr {padding:5px;text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}
</style>
</head>
<body>
	<div class="container-fluid">
	<form action="applyInsert" method="post">
		<div class="row">
			<div>이메일</div>
			<div><input type="text" name="email" /></div>
		</div>
		<div class="row">
			<div>주소</div>
			<div>
				<input id="addressInput" name="address" />
				<button type="button" id="addressSearchButton">주소검색</button>
				<!-- 주소 검색 팝업 모달 -->
				<div id="addressSearchModal" class="modal fade">
				    <div class="modal-dialog">
				        <div class="modal-content">
				            <div class="modal-header">
				                <h5 class="modal-title">주소 검색</h5>
				                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				            </div>
				            <div class="modal-body">
				              <div class="map_wrap">
								    <div id="map" style="width:100%;height:100%;position:relative;overflow:hidden;"></div>
								    <div class="hAddr">
								        <span class="title">지도중심기준 행정동 주소정보</span>
								        <span id="centerAddr"></span>
								    </div>
								</div>
								<div class="address-button">확인</div>
								<div class="address-input"></div>
				            </div>
				            <div class="modal-footer">
				                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        						<button type="button" class="btn btn-primary" id="submit">Save changes</button>
				            </div>
				        </div>
				    </div>
				</div>
			</div>
		</div>
		<div class="row">
			<div>설치/수리</div>
			<div>
				<div>
					<input type="radio" name="category" id="install" value="설치"/>
					<label for="install">설치</label>
				</div>
				<div>
					<input type="radio"name="category" id="repair" value="수리"/>
					<label for="repair">수리</label>
				</div>
			</div>
		</div>
		<button>작성</button>
		</form>
	</div>
	
<script	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js" integrity="sha512-v2CJ7UaYy4JwqLDIrZUI/4hqeoQieOmAZNXBeQyjo21dadnwR+8ZaIJVT8EE2iyI61OV8e6M8PP2/4hpQINQ/g==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>


<script type="text/javascript">
//1년이내 동일한 신청 이력이 있는 경우 출력
message = "${message}"

if (message === "1") {
   alert("일년 이내에 동일한 신청 건이 있습니다.");
}
</script>
<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
mapOption = {
    center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
    level: 1 // 지도의 확대 레벨
};  

//지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 

//주소-좌표 변환 객체를 생성합니다
var geocoder = new kakao.maps.services.Geocoder();

var marker = new kakao.maps.Marker(), // 클릭한 위치를 표시할 마커입니다
infowindow = new kakao.maps.InfoWindow({zindex:1}); // 클릭한 위치에 대한 주소를 표시할 인포윈도우입니다

//현재 지도 중심좌표로 주소를 검색해서 지도 좌측 상단에 표시합니다
searchAddrFromCoords(map.getCenter(), displayCenterInfo);

//지도를 클릭했을 때 클릭 위치 좌표에 대한 주소정보를 표시하도록 이벤트를 등록합니다
kakao.maps.event.addListener(map, 'click', function(mouseEvent) {
searchDetailAddrFromCoords(mouseEvent.latLng, function(result, status) {
    if (status === kakao.maps.services.Status.OK) {
    	var jibunAddress = result[0].address.address_name; // 지번 주소
        var detailAddr = !!result[0].road_address ? '<div>도로명주소 : ' + jibunAddress + '</div>' : '';
        detailAddr += '<div>지번 주소 : ' + result[0].address.address_name + '</div>';
        
        var content = '<div class="bAddr">' +
                        '<span class="title">법정동 주소정보</span>' + 
                        detailAddr + 
                    '</div>';
                    <!-- 주소 확인 버튼 클릭 시 주소 입력 -->
                    $(".address-button").click(function() {
                   	    $(".address-input").text(jibunAddress);
                    });
        // 마커를 클릭한 위치에 표시합니다 
        marker.setPosition(mouseEvent.latLng);
        marker.setMap(map);

        // 인포윈도우에 클릭한 위치에 대한 법정동 상세 주소정보를 표시합니다
        infowindow.setContent(content);
        infowindow.open(map, marker);
    }   
});
});

//중심 좌표나 확대 수준이 변경됐을 때 지도 중심 좌표에 대한 주소 정보를 표시하도록 이벤트를 등록합니다
kakao.maps.event.addListener(map, 'idle', function() {
searchAddrFromCoords(map.getCenter(), displayCenterInfo);
});

function searchAddrFromCoords(coords, callback) {
// 좌표로 행정동 주소 정보를 요청합니다
geocoder.coord2RegionCode(coords.getLng(), coords.getLat(), callback);         
}

function searchDetailAddrFromCoords(coords, callback) {
// 좌표로 법정동 상세 주소 정보를 요청합니다
geocoder.coord2Address(coords.getLng(), coords.getLat(), callback);
}

//지도 좌측상단에 지도 중심좌표에 대한 주소정보를 표출하는 함수입니다
function displayCenterInfo(result, status) {
if (status === kakao.maps.services.Status.OK) {
    var infoDiv = document.getElementById('centerAddr');

    for(var i = 0; i < result.length; i++) {
        // 행정동의 region_type 값은 'H' 이므로
        if (result[i].region_type === 'H') {
            infoDiv.innerHTML = result[i].address_name;
            break;
        }
    }
}    
}
</script>

<script>

$(document).ready(function() {
    // 주소검색 버튼 클릭 시 팝업 열기
    $("#addressSearchButton").click(function() {
        $("#addressSearchModal").modal("show");
    });
    
 	// "Save changes" 버튼 클릭 시 주소 입력
    $("#submit").click(function() {
        var jibunAddress = $(".address-input").text(); 
        $("#addressInput").val(jibunAddress); 
        $("#addressSearchModal").modal("hide");
    }); 
});


</script>
</body>
</html>