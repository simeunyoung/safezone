	var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
		var options = { //지도를 생성할 때 필요한 기본 옵션
			center : new kakao.maps.LatLng(33.450701, 126.570667), //지도의 중심좌표.
			level : 3
		//지도의 레벨(확대, 축소 정도)
		};

		var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴

		// 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
		var mapTypeControl = new kakao.maps.MapTypeControl();

		// 지도에 컨트롤을 추가해야 지도위에 표시됩니다
		// kakao.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
		map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);

		// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
		var zoomControl = new kakao.maps.ZoomControl();
		map.addControl(zoomControl, kakao.maps.ControlPosition.BOTTOMRIGHT);
		
		// 지도에 클릭 이벤트를 등록합니다
		// 지도를 클릭하면 마지막 파라미터로 넘어온 함수를 호출합니다
		kakao.maps.event.addListener(map, 'click', function(mouseEvent) {        
		    
		    // 클릭한 위도, 경도 정보를 가져옵니다 
		    var latlng = mouseEvent.latLng;
		    
		    var message = '클릭한 위치의 위도는 ' + latlng.getLat() + ' 이고, ';
		    message += '경도는 ' + latlng.getLng() + ' 입니다';
		    
		    var resultDiv = document.getElementById('result'); 
		    resultDiv.innerHTML = message;
		    
		});
		var lat;
		var lon;
		// HTML5의 geolocation으로 사용할 수 있는지 확인합니다 
		if (navigator.geolocation) {
		    
		    // GeoLocation을 이용해서 접속 위치를 얻어옵니다
		    navigator.geolocation.getCurrentPosition(function(position) {
		        
		        	lat = position.coords.latitude, // 위도
		            lon = position.coords.longitude; // 경도
		        	console.log("안에 위도"+lat);
		        var locPosition = new kakao.maps.LatLng(lat, lon), // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다
		            message = '<div style="padding:5px;">여기에 계신가요?!</div>'; // 인포윈도우에 표시될 내용입니다
		        
		        // 마커와 인포윈도우를 표시합니다
		        displayMarker(locPosition, message);
		            
		      });
		    
		} else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다
		    
		    var locPosition = new kakao.maps.LatLng(33.450701, 126.570667),    
		        message = 'geolocation을 사용할수 없어요..'
		        
		    displayMarker(locPosition, message);
		}
		console.log(lat);

		// 지도에 마커와 인포윈도우를 표시하는 함수입니다
		function displayMarker(locPosition, message) {

		    // 마커를 생성합니다
		    var marker = new kakao.maps.Marker({  
		        map: map, 
		        position: locPosition
		    }); 
		    
		    var iwContent = message, // 인포윈도우에 표시할 내용
		        iwRemoveable = true;

		    // 인포윈도우를 생성합니다
		    var infowindow = new kakao.maps.InfoWindow({
		        content : iwContent,
		        removable : iwRemoveable
		    });
		    
		    // 인포윈도우를 마커위에 표시합니다 
		    infowindow.open(map, marker);
		    
		    // 지도 중심좌표를 접속위치로 변경합니다
		    map.setCenter(locPosition);      
		}    

		 $(".position-btn").on("click", () => {
             console.log("ajax"+typeof lat);
             
			 $.ajax({
	                url: '/safezone/haversine', // 컨트롤러의 엔드포인트 URL로 변경
	                method: 'POST', // HTTP 메서드 (GET, POST 등) 선택
	                data: {
	                    lat: lat,
	                    lon: lon
	                },
	                success: function (data) {
	                   var list = data.SafeHouseDTO;
	                   var bellList = data.EmgbellDTO;
	                   var distance = data.distance * 1000;               
	                	var positions = [];
	                	// 주어진 객체로 원을 생성한다.
       		 			createCircle(lat, lon, distance);
	                	for(var i = 0; i < list.length; i++){
	                		positions.push({
	                			content: '<div>' + list[i].storNm + ' ' + '<a href="https://map.kakao.com/link/to/' + list[i].storNm + ',' + list[i].latitude + ',' + list[i].longitude + '?sname='+ lat +','+ lon+'" style="color: blue" target="_blank">길찾기</a></div>',
                				latlng: new kakao.maps.LatLng(list[i].latitude, list[i].longitude),
                				iwRemoveable: true // removeable 속성을 ture 로 설정하면 인포윈도우를 닫을 수 있는 x버튼이 표시됩니다
	                		});
	                		
	                		var listItem = document.createElement('div'); // 새로운 <div> 요소 생성
                	        listItem.className = 'list-item'; // 클래스 설정

                	        var titleDiv = document.createElement('div'); // 제목을 담을 <div> 요소 생성
                	        titleDiv.className = 'list-title';
                	        titleDiv.textContent = list[i].storNm; // 리스트 항목의 제목 설정
                	        
                	        var disDiv = document.createElement('div'); // 제목을 담을 <div> 요소 생성
                	        disDiv.className = 'list-dis';
                	        var dis = parseFloat(list[i].distance);
                	        var distanceNum = dis.toFixed(2);
                	        disDiv.textContent = distanceNum + "km"; // 리스트 항목의 제목 설정
                	      
                	        var addressDiv = document.createElement('div'); // 주소를 담을 <div> 요소 생성
                	        addressDiv.className = 'list-address';
                	        addressDiv.textContent = list[i].rdnmadr; // 리스트 항목의 주소 설정
                	        
                	        var addressGuDiv = document.createElement('div'); // 주소를 담을 <div> 요소 생성
                	        addressGuDiv.className = 'list-address-gu';
                	        addressGuDiv.textContent = list[i].lnmadr; // 리스트 항목의 주소 설정

                	        var telDiv = document.createElement('div'); // 전화번호를 담을 <div> 요소 생성
                	        telDiv.className = 'list-tel';
                	        telDiv.textContent = list[i].phoneNumber; // 리스트 항목의 전화번호 설정

                	        // 생성한 <div> 요소들을 list-item에 추가
                	        listItem.appendChild(titleDiv);
                	        listItem.appendChild(addressDiv);
                	        listItem.appendChild(addressGuDiv);
                	        listItem.appendChild(telDiv);
                	        listItem.appendChild(disDiv);

                	        // list-item을 어딘가에 추가하려면 예를 들어 어떤 컨테이너 요소에 추가해야 합니다.
                	        // 예를 들어, id가 'container'인 요소에 추가하는 경우:
                	        var container = document.querySelector('.list-wrap');
                	        container.appendChild(listItem);
	                	}
	                	
	                	var bellPositions = [];
	                	for (var i = 0; i < bellList.length; i++) {
						    bellPositions.push({
						        content: '<div>' + bellList[i].ins_detail+' '+bellList[i].fclty_ty + ' ' + '<a href="https://map.kakao.com/link/to/' + bellList[i].ins_detail + ',' + bellList[i].lat + ',' + bellList[i].lon + '?sname='+ lat +','+ lon+'" style="color: blue" target="_blank">길찾기</a></div>',
						        latlng: new kakao.maps.LatLng(bellList[i].lat, bellList[i].lon),
						        iwRemoveable: true // removeable 속성을 ture 로 설정하면 인포윈도우를 닫을 수 있는 x버튼이 표시됩니다
						    });
						
						    var bellListItem = document.createElement('div'); // 새로운 <div> 요소 생성
						    bellListItem.className = 'list-item'; // 클래스 설정
						
						    var bellTitleDiv = document.createElement('div'); // 제목을 담을 <div> 요소 생성
						    bellTitleDiv.className = 'list-title';
						    bellTitleDiv.textContent = bellList[i].ins_detail+' '+bellList[i].fclty_ty; // 리스트 항목의 ins_detail과 fclty_ty 설정
						
						    var vellDisDiv = document.createElement('div'); // 거리를 담을 <div> 요소 생성
						    vellDisDiv.className = 'list-dis';
						    var bellDis = parseFloat(bellList[i].distance);
						    var bellDistanceNum = bellDis.toFixed(2);
						    vellDisDiv.textContent = bellDistanceNum + "km"; // 리스트 항목의 거리 설정
						
						    var bellAddressDiv = document.createElement('div'); // 도로 주소를 담을 <div> 요소 생성
						    bellAddressDiv.className = 'list-address';
						    bellAddressDiv.textContent = bellList[i].rn_adres; // 리스트 항목의 rn_adres 설정
						
						    var bellAddressGuDiv = document.createElement('div'); // 지번 주소를 담을 <div> 요소 생성
						    bellAddressGuDiv.className = 'list-address-gu';
						    bellAddressGuDiv.textContent = bellList[i].adres; // 리스트 항목의 adres 설정
						
						    var bellTelDiv = document.createElement('div'); // 전화번호를 담을 <div> 요소 생성
						    bellTelDiv.className = 'list-tel';
						    bellTelDiv.textContent = bellList[i].mng_tel; // 리스트 항목의 mng_tel 설정
						
						    // 생성한 <div> 요소들을 list-item에 추가
						    bellListItem.appendChild(bellTitleDiv);
						    bellListItem.appendChild(vellDisDiv);
						    bellListItem.appendChild(bellAddressDiv);
						    bellListItem.appendChild(bellAddressGuDiv);
						    bellListItem.appendChild(bellTelDiv);
						
						    // list-item을 어딘가에 추가하려면 예를 들어 어떤 컨테이너 요소에 추가해야 합니다.
						    // 예를 들어, id가 'container'인 요소에 추가하는 경우:
						    var bellContainer = document.querySelector('.list-wrap');
						    bellContainer.appendChild(bellListItem);
						}
	                	
	                	// 마커 이미지의 이미지 주소입니다
	                    var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 

	                    // 마커 이미지의 이미지 크기 입니다
	                    var imageSize = new kakao.maps.Size(24, 35); 

	                    // 마커를 생성하고 지도에 표시합니다
	                    for (var i = 0; i < positions.length; i++) {
	                        // 마커 이미지를 생성합니다
	                        var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize);

	                        // 마커를 생성합니다
	                        var marker = new kakao.maps.Marker({
	                            map: map, // 마커를 표시할 지도
	                            position: positions[i].latlng, // 마커를 표시할 위치
	                            clickable: true, // 마커를 클릭했을 때 지도의 클릭 이벤트가 발생하지 않도록 설정합니다
	                            image: markerImage // 마커 이미지
	                        });
	                     	// 마커에 표시할 인포윈도우를 생성합니다 
	                        var infowindow = new kakao.maps.InfoWindow({
	                            content: positions[i].content, // 인포윈도우에 표시할 내용
	                            position: positions[i].latlng,
	                            removable : positions[i].iwRemoveable
	                        });
	                     	// 마커에 클릭이벤트를 등록합니다
		                    kakao.maps.event.addListener(marker, 'click', makeOpenListener(map, marker, infowindow));

	                        // 마커에 mouseover 이벤트와 mouseout 이벤트를 등록합니다
	                        // 이벤트 리스너로는 클로저를 만들어 등록합니다 
	                        // for문에서 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
// 	                        kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
// 	                        kakao.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));
	                    }
	                    
	                    // bell 마커를 생성하고 지도에 표시합니다
	                    for (var i = 0; i < bellPositions.length; i++) {
	                        // 마커 이미지를 생성합니다
	                        var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize);

	                        // 마커를 생성합니다
	                        var marker = new kakao.maps.Marker({
	                            map: map, // 마커를 표시할 지도
	                            position: bellPositions[i].latlng, // 마커를 표시할 위치
	                            clickable: true, // 마커를 클릭했을 때 지도의 클릭 이벤트가 발생하지 않도록 설정합니다
	                            image: markerImage // 마커 이미지
	                        });
	                     	// 마커에 표시할 인포윈도우를 생성합니다 
	                        var infowindow = new kakao.maps.InfoWindow({
	                            content: bellPositions[i].content, // 인포윈도우에 표시할 내용
	                            position: bellPositions[i].latlng,
	                            removable : bellPositions[i].iwRemoveable
	                        });
	                     	// 마커에 클릭이벤트를 등록합니다
		                    kakao.maps.event.addListener(marker, 'click', makeOpenListener(map, marker, infowindow));

	                        // 마커에 mouseover 이벤트와 mouseout 이벤트를 등록합니다
	                        // 이벤트 리스너로는 클로저를 만들어 등록합니다 
	                        // for문에서 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
// 	                        kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
// 	                        kakao.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));
	                    }
	                    
	                    
	                    
	                 	// 인포윈도우를 표시하는 클로저를 만드는 함수입니다 
	                    function makeOpenListener(map, marker, infowindow) {
	                        return function() {
	                            infowindow.open(map, marker);
	                        };
	                    }

	                    // 인포윈도우를 닫는 클로저를 만드는 함수입니다 
	                    function makeCloseListener(infowindow) {
	                        return function() {
	                            infowindow.close();
	                        };
	                    }
	                	
	                 
	                    // 성공적으로 서버로 데이터를 전송한 경우 실행할 코드
	                    alert('위도와 경도를 서버로 전송했습니다.');
	                },
	                error: function (error) {
	                    // 오류가 발생한 경우 실행할 코드
	                    console.error('데이터 전송 중 오류가 발생했습니다.');
	                }
	            });
		 });
		 
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