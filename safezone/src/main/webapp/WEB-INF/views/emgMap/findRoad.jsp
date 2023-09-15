<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<script src="http://code.jquery.com/jquery-1.11.0.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/proj4js/2.7.5/proj4.js"></script>
	<script>
    $(function() {        
        // Geolocation API에 액세스할 수 있는지를 확인
        if (navigator.geolocation) {
            // 위치 정보를 얻기
            navigator.geolocation.getCurrentPosition(function(pos) {
                // 위도와 경도를 가져옵니다.
                var latitude = pos.coords.latitude;
                var longitude = pos.coords.longitude;
                $('#x').html(latitude);
                $('#y').html(longitude);
                
             	// UTM 좌표로 변환하기 위해 proj4.js를 사용합니다.
                // proj4 설정: WGS84 좌표계에서 UTMK 좌표계로 변환
		        proj4.defs("EPSG:4326", "+proj=longlat +ellps=WGS84 +datum=WGS84 +no_defs");
		        proj4.defs("EPSG:5179", "+proj=tmerc +lat_0=38 +lon_0=127.5 +k=0.9996 +x_0=1000000 +y_0=2000000 +ellps=bessel +towgs84=115.808,-474.856,674.112,1.0188,0.8142,1.6449,8.4661 +units=m +no_defs");
		        const utmkCoordinates = proj4("EPSG:4326", "EPSG:5179", [37.464195, 126.9043606]);

                
                var utmX = utmkCoordinates[0];
                var utmY = utmkCoordinates[1];
                
                $('#utmX').html(utmX);
                $('#utmY').html(utmY);
                
                var link = $('h1 a');
                
                
                var data = {
                        lat: latitude,
                        lon: longitude
                };
                
                
                $.ajax({
                    url:'/safezone/map/sendLo',
                    method:'POST',
                    data: JSON.stringify(data),
                    contentType: "application/json",
                    success: function(response){
                    	var arr = response;
                        var sendX = arr[0];
                        var sendY = arr[1];
                        
                        $('#sendX').html(sendX);
                        $('#sendY').html(sendY);
                        
		                // 링크에 x와 y 값을 추가합니다.
		                link.attr('href', 'https://map.naver.com/p/directions/' + utmX + ',' + utmY+',,PLACE_POI/'
		                		+sendX+','+sendY+',,PLACE_POI/-/walk');
                    },
                    error: function(jqXHR, textStatus, errorThrown) {
                    	console.error("AJAX 요청 실패 - 상태 코드:", jqXHR.status);
                        console.error("에러 정보:", errorThrown);
                    }
                });
            });
        } else {
            alert("이 브라우저에서는 Geolocation이 지원되지 않습니다.")
        }
    });
    </script>
</head>
<body>
	 <ul>
        <li>위도:<span id="x"></span></li>
        <li>경도:<span id="y"></span></li>
        <li>UTM X 좌표: <span id="utmX"></span></li>
        <li>UTM Y 좌표: <span id="utmY"></span></li>
        <li>도착지 X:<span id="sendX"></span></li>
        <li>도착지 Y:<span id="sendY"></span></li>
    </ul>
    <h1>
    	<a href="">지도로 가라</a>
    </h1>
</body>
</html>