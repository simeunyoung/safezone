/**
 * 
 */

var map; // 전역 변수로 map 선언

if (navigator.geolocation) {
    navigator.geolocation.getCurrentPosition(function(position) {
        var lat = position.coords.latitude; // 위도
        var lon = position.coords.longitude; // 경도
        sendLocation(lat, lon); // 컨트롤러로 위도와 경도 보내기

        var locPosition = new kakao.maps.LatLng(lat, lon); // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다
        var message = '<div style="padding:5px;">현재 내 위치</div>'; // 인포윈도우에 표시될 내용입니다

        createMap(lat, lon); // 지도 생성
        // 마커와 인포윈도우를 표시합니다
        displayMarker(locPosition, message);

        // 주어진 객체로 원을 생성한다.
        createCircle(lat, lon, 500);
    });
} else {
    alert('위치 사용을 허락하지 않으면 서비스 이용이 불가합니다.');
}



// 지도 만들기
function createMap(lat, lon) {
    var mapContainer = document.getElementById('map'); // 지도를 표시할 div
    var mapOption = {
        center: new kakao.maps.LatLng(lat, lon), // 지도의 중심 좌표
        level: 5, // 지도의 확대 레벨
        mapTypeId: kakao.maps.MapTypeId.ROADMAP // 지도 종류
    };

    // 전역 변수로 선언한 map에 지도를 생성합니다
    map = new kakao.maps.Map(mapContainer, mapOption);

    // 지도에 확대 축소 컨트롤을 생성한다
    var zoomControl = new kakao.maps.ZoomControl();

    // 지도의 우측에 확대 축소 컨트롤을 추가한다
    map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
}



// 컨트롤러로 위도와 경도 보내는 메소드
function sendLocation(lat, lon) {
    var data = {
        lat: lat,
        lon: lon
    };

    $.ajax({
        type: "POST",
        url: "/safezone/map/bellLocation",
        data: JSON.stringify(data), // 데이터를 JSON 문자열로 변환
        contentType: "application/json", // 요청의 Content-Type 설정
        //dataType: "json",
        success: function(data) {
            alert('전달' + lat);
            var bellList = data.bellList;
            alert(bellList);
            $('#bellList').text(data);
        },
        error: function(xhr, status, error) {
            alert('에러 코드: ' + xhr.status + ' - ' + error);
        }
    });
}




// 지도에 마커와 인포윈도우를 표시하는 함수
function displayMarker(locPosition, message) {
    // 마커를 생성합니다
    var marker = new kakao.maps.Marker({
        map: map,
        position: locPosition
    });

    // 인포윈도우에 표시할 내용
    var iwContent = message, iwRemovable = true;

    // 인포윈도우를 생성합니다
    var infowindow = new kakao.maps.InfoWindow({
        content: iwContent,
        removable: iwRemovable
    });

    // 인포윈도우를 마커위에 표시합니다
    infowindow.open(map, marker);

    // 지도 중심 좌표를 접속 위치로 변경합니다
    map.setCenter(locPosition);
}




// 원으로 범위 만들기 메소드
function createCircle(lat, lon, radius) {
    var circle = new kakao.maps.Circle({
        map: map,
        center: new kakao.maps.LatLng(lat, lon),
        radius: radius,
        strokeWeight: 2,
        strokeColor: '#A8DF8E',
        strokeOpacity: 0.8,
        strokeStyle: 'solid',
        fillColor: '#F3FDE8',
        fillOpacity: 0.5
    });

    return circle;
}