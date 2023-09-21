<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	
	<script src="https://code.jquery.com/jquery-latest.min.js">
	<%-- Bootstrap --%>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" 
	integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" 
	integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
	
	<!-- 폰트어썸 아이콘 -->
	<script src="https://kit.fontawesome.com/f507061817.js" crossorigin="anonymous"></script>
	<link href="/safezone/resources/css/style.css" rel="stylesheet">
	
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=00c5646bb9ebe4eed88e3ec456e4c0ea"></script>
</head>
<body>
	<main class="col-md-12 col-lg-12">
		<div class="map-wrap">
			<button class="position-btn"><i class="fa-solid fa-crosshairs" style="color: #444;"></i></button>
			<div id="map" style="width:500px;height:400px;"></div>
		</div>
	</main>
	
	<script src="/safezone/resources/js/emgBellMap.js?ver=3"></script>
	<div id="bellList">
		왜 안돼. ${bellList}
	</div>
</body>
</html>