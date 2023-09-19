<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>safezone-community write</title>
	
	<script src="https://code.jquery.com/jquery-latest.min.js"></script>
	<%-- Bootstrap --%>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" 
	integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" 
	integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
	
	
	<!-- 폰트어썸 아이콘 -->
	<script type="text/javascript" src="https://kit.fontawesome.com/f507061817.js" crossorigin="anonymous"></script>
	<link href="/safezone/resources/css/style.css" rel="stylesheet">
	
	<script src="/safezone/resources/js/commuForm.js?ver=2"></script>
</head>
<body>
	<form name="myForm" class="container" action="submitForm" method="post" enctype="multipart/form-data" onsubmit="return validateForm()">
		<div class="row g-3">
			<div class="col-12">
				<select class="form-select" name="location_num">
					<option>지역</option>
					<option value="1" ${dto.location_num==1 ? 'selected' : ''}>강남구</option>
					<option value="2" ${dto.location_num==2 ? 'selected' : ''}>강동구</option>
					<option value="3" ${dto.location_num==3 ? 'selected' : ''}>강북구</option>
					<option value="4" ${dto.location_num==4 ? 'selected' : ''}>강서구</option>
					<option value="5" ${dto.location_num==5 ? 'selected' : ''}>관악구</option>
					<option value="6" ${dto.location_num==6 ? 'selected' : ''}>광진구</option>
					<option value="7" ${dto.location_num==7 ? 'selected' : ''}>구로구</option>
					<option value="8" ${dto.location_num==8 ? 'selected' : ''}>금천구</option>
					<option value="9" ${dto.location_num==9 ? 'selected' : ''}>노원구</option>
					<option value="10" ${dto.location_num==10 ? 'selected' : ''}>도봉구</option>
					<option value="11" ${dto.location_num==11 ? 'selected' : ''}>동대문구</option>
					<option value="12" ${dto.location_num==12 ? 'selected' : ''}>동작구</option>
					<option value="13" ${dto.location_num==13 ? 'selected' : ''}>마포구</option>
					<option value="14" ${dto.location_num==14 ? 'selected' : ''}>서대문구</option>
					<option value="15" ${dto.location_num==15 ? 'selected' : ''}>서초구</option>
					<option value="16" ${dto.location_num==16 ? 'selected' : ''}>성동구</option>
					<option value="17" ${dto.location_num==17 ? 'selected' : ''}>성북구</option>
					<option value="18" ${dto.location_num==18 ? 'selected' : ''}>송파구</option>
					<option value="19" ${dto.location_num==19 ? 'selected' : ''}>양천구</option>
					<option value="20" ${dto.location_num==20 ? 'selected' : ''}>영등포구</option>
					<option value="21" ${dto.location_num==21 ? 'selected' : ''}>용산구</option>
					<option value="22" ${dto.location_num==22 ? 'selected' : ''}>은평구</option>
					<option value="23" ${dto.location_num==23 ? 'selected' : ''}>종로구</option>
					<option value="24" ${dto.location_num==24 ? 'selected' : ''}>중구</option>
					<option value="25" ${dto.location_num==25 ? 'selected' : ''}>중랑구</option>
				</select>
			</div>

			<div class="col-md-2">
				<select class="form-select" name="category">
					<option>카테고리</option>
					<option value="1" ${dto.category==1 ? 'selected' : ''}>고장</option>
					<option value="2" ${dto.category==2 ? 'selected' : ''}>위험</option>
					<option value="3" ${dto.category==3 ? 'selected' : ''}>기타</option>
				</select>
			</div>
			<div class="col-md-10">
				<input class="form-control" type="text" name="title" placeholder="제목을 입력하세요" 
				value="${dto.title}" oninput="countCharacters('title', 'titleCount',50)">
				<span id="titleCount">0</span> / 50
			</div>
			<div class="col-12">
				<textarea class="form-control" name="content" rows="8" placeholder="내용을 입력하세요" 
				style="resize:none;" oninput="countCharacters('content', 'contentCount',1000)">${dto.content}</textarea>
				<span id="contentCount">0</span> / 1000
			</div>
			<c:if test="${dto.commu_num==null || dto.commu_num==0}">
				<div class="mb-3">
					<input class="form-control" type="file" name="file[]" id="formFileMultiple" multiple 
					accept=".jpg, .jpeg, .png"  onchange="previewFiles()" >
				</div>
				<div class="mb-3">
					<div id="previewContainer">
				        <!-- 미리보기 이미지 및 파일 이름이 여기에 표시됩니다. -->
				    </div>
				</div>
			</c:if>
			<c:if test="${dto.commu_num>0}">
				<input type="file" name="img1" accept=".jpg, .jpeg, .png">
				<input type="file" name="img2" accept=".jpg, .jpeg, .png">
				<input type="file" name="img3" accept=".jpg, .jpeg, .png">
			</c:if>
			<div class="form-text">
				사진은 JPEG, JPG, PNG 확장자만 가능하며 최대 3개 가능합니다.
			</div>
			<div class="col-12">
				<button type="button" class="btn btn-light" onclick="location='/safezone/community/home'">취소</button>
				<button type="submit" class="btn btn-primary">
					<c:if test="${dto.commu_num==null || dto.commu_num==0}">
						작성
					</c:if>
					<c:if test="${dto.commu_num>0}">
						수정
					</c:if>
				</button>
			</div>
		</div>
	</form>
	
</body>
</html>