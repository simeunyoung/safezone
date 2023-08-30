<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<title>safezone</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM"
	crossorigin="anonymous">
<!-- Custom styles for this template -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css"
	rel="stylesheet">
<!-- 카카오맵API -->
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f4352b5c75fa4dee61f430ab3f1ff6f4&libraries=services,clusterer"></script>
<script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
<!-- 폰트어썸 아이콘 -->
<script src="https://kit.fontawesome.com/f507061817.js" crossorigin="anonymous"></script>
<link href="/safezone/resources/css/style.css" rel="stylesheet">
<style>

</style>
</head>
<body>
<body>
<%--
	<header class="navbar sticky-top bg-dark flex-md-nowrap p-0 shadow"
		data-bs-theme="dark">
		<a class="navbar-brand col-md-3 col-lg-2 me-0 px-3 fs-6 text-white"
			href="#">Company name</a>

		<ul class="navbar-nav flex-row d-md-none">
			<li class="nav-item text-nowrap">
				<button class="nav-link px-3 text-white" type="button"
					data-bs-toggle="collapse" data-bs-target="#navbarSearch"
					aria-controls="navbarSearch" aria-expanded="false"
					aria-label="Toggle search">
					<svg class="bi">
						<use xlink:href="#search" /></svg>
				</button>
			</li>
			<li class="nav-item text-nowrap">
				<button class="nav-link px-3 text-white" type="button"
					data-bs-toggle="offcanvas" data-bs-target="#sidebarMenu"
					aria-controls="sidebarMenu" aria-expanded="false"
					aria-label="Toggle navigation">
					<svg class="bi">
						<use xlink:href="#list" /></svg>
				</button>
			</li>
		</ul>

		<div id="navbarSearch" class="navbar-search w-100 collapse">
			<input class="form-control w-100 rounded-0 border-0" type="text"
				placeholder="Search" aria-label="Search">
		</div>
	</header>
 --%>
	<div class="container-fluid">
		<div class="row">
			<!-- side-bar -->
			<div class="side-bar col-md-3 col-lg-3" style="background:pink">
				
				<div class="sidebar-top">
					<div class="sidebar-top-menu mb-3">
						<div class="d-flex">
							<div class="menu-btn"><i class="fa-solid fa-bars fa-lg" style="color: #ffffff;"></i></div>
							<div class="ms-3">로고</div>
						</div>
						<div>현 지도 내장소검색</div>
					</div>
					<div class="search-wrap mb-3">
						<input type="search" class="search-input" placeholder="장소, 주소, 버스 검색">
						<span class="search-btn"><i class="fa-solid fa-magnifying-glass" style="color: #ddd;"></i></span>
					</div>
					<div class="tab">
						<ul class="nav nav-pills" id="pills-tab" role="tablist">
						  <li class="nav-item" role="presentation">
						    <button class="nav-link active" id="pills-home-tab" data-bs-toggle="pill" data-bs-target="#pills-home" type="button" role="tab" aria-controls="pills-home" aria-selected="true">검색</button>
						  </li>
						  <li class="nav-item" role="presentation">
						    <button class="nav-link" id="pills-profile-tab" data-bs-toggle="pill" data-bs-target="#pills-profile" type="button" role="tab" aria-controls="pills-profile" aria-selected="false">길찾기</button>
						  </li>
						  <li class="nav-item" role="presentation">
						    <button class="nav-link" id="pills-contact-tab" data-bs-toggle="pill" data-bs-target="#pills-contact" type="button" role="tab" aria-controls="pills-contact" aria-selected="false">신청</button>
						  </li>
						  <li class="nav-item" role="presentation">
						    <button class="nav-link" id="pills-disabled-tab" data-bs-toggle="pill" data-bs-target="#pills-disabled" type="button" role="tab" aria-controls="pills-disabled" aria-selected="false">문의</button>
						  </li>
						  <li class="nav-item" role="presentation">
						    <button class="nav-link" id="pills-disabled-tab" data-bs-toggle="pill" data-bs-target="#pills-disabled" type="button" role="tab" aria-controls="pills-disabled" aria-selected="false">더보기</button>
						  </li>
						</ul>
						
					</div>
				</div>
				<div class="sidebar-content">
					<button class="sidebar-button"><i class="fa-solid fa-chevron-left" style="color: #c2c2c2;"></i></button>
					<div class="tab-content" id="pills-tabContent">
					  <div class="tab-pane fade show active" id="pills-home" role="tabpanel" aria-labelledby="pills-home-tab" tabindex="0">.검색.</div>
					  <div class="tab-pane fade" id="pills-profile" role="tabpanel" aria-labelledby="pills-profile-tab" tabindex="0">.길찾기.</div>
					  <div class="tab-pane fade" id="pills-contact" role="tabpanel" aria-labelledby="pills-contact-tab" tabindex="0">신청..</div>
					  <div class="tab-pane fade" id="pills-disabled" role="tabpanel" aria-labelledby="pills-disabled-tab" tabindex="0">문의..</div>
					</div>
				</div>
				
			</div>

			<main class="col-md-12 col-lg-12">
				<div class="map-wrap">
					<button class="position-btn"><i class="fa-solid fa-crosshairs" style="color: #444;"></i></button>
					<div id="map" style="width: 100%; height: 100vh;"></div>
				</div>
			</main>
		</div>
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
		crossorigin="anonymous"></script>
	<script type="text/javascript">
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
	</script>
</body>
</html>
