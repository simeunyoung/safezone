<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	
	<script src="https://code.jquery.com/jquery-latest.min.js"></script>
	<%-- Bootstrap --%>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" 
	integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" 
	integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
	
	
	<!-- 폰트어썸 아이콘 -->
	<script type="text/javascript" src="https://kit.fontawesome.com/f507061817.js" crossorigin="anonymous"></script>
	<link href="/safezone/resources/css/style.css" rel="stylesheet">
	
</head>
<body>
	<form name="" class="container" action="submitForm" method="post" enctype="multipart/form-data">
		<div class="row g-3">
			<div class="col-12">
				<select class="form-select" name="location_num">
					<option selected>지역</option>
					<option value="1">강남구</option>
					<option value="2">강동구</option>
					<option value="3">강북구</option>
					<option value="4">강서구</option>
					<option value="5">관악구</option>
					<option value="6">광진구</option>
					<option value="7">구로구</option>
					<option value="8">금천구</option>
					<option value="9">노원구</option>
					<option value="10">도봉구</option>
					<option value="11">동대문구</option>
					<option value="12">동작구</option>
					<option value="13">마포구</option>
					<option value="14">서대문구</option>
					<option value="15">서초구</option>
					<option value="16">성동구</option>
					<option value="17">성북구</option>
					<option value="18">송파구</option>
					<option value="19">양천구</option>
					<option value="20">영등포구</option>
					<option value="21">용산구</option>
					<option value="22">은평구</option>
					<option value="23">종로구</option>
					<option value="24">중구</option>
					<option value="25">중랑구</option>
				</select>
			</div>

			<div class="col-md-2">
				<select class="form-select" name="category">
					<option selected>카테고리</option>
					<option value="1">고장</option>
					<option value="2">위험</option>
					<option value="3">기타</option>
				</select>
			</div>
			<div class="col-md-10">
				<input class="form-control" type="text" name="title" placeholder="제목을 입력하세요">
			</div>
			<div class="col-12">
				<textarea class="form-control" name="content" rows="8" placeholder="내용을 입력하세요"></textarea>
			</div>
			<div class="mb-3">
				<input class="form-control" type="file" name="img1" id="formFileMultiple" multiple>
			</div>
			<div class="form-text">
				사진은 최대 3개까지만 가능합니다.
			</div>
			<div class="col-12">
				<button type="button" class="btn btn-light" onclick="">취소</button>
				<button type="submit" class="btn btn-primary">작성</button>
			</div>
		</div>
	</form>
</body>

	
</script>
</html>