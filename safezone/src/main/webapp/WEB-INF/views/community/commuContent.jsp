<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>safezone-community</title>

	<script src="https://code.jquery.com/jquery-latest.min.js"></script>
	<%-- Bootstrap --%>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" 
	integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" 
	integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
	
	<!-- 폰트어썸 아이콘 -->
	<script src="https://kit.fontawesome.com/f507061817.js" crossorigin="anonymous"></script>
	<link href="/safezone/resources/css/style.css" rel="stylesheet">
</head>
<body>
	<div class="card">
		<div class="card-body">
			<h5 class="card-title">${dto.title}</h5>
			<p class="card-text">
				<small class="text-body-secondary">작성자 ${dto.email}</small>
			</p>
			<p class="card-text">
				<small class="text-body-secondary">작성일 ${dto.created_at} </small>
				<c:if test="${dto.modify_at != null }">
					<small class="text-body-secondary">| 수정일 ${dto.modify_at}</small>
				</c:if>
			</p>
			<p class="card-text">
				${dto.content}
			</p>
		</div>
		<c:if test="${dto.img1 != null}">
			<div>
				<img src="${path}${dto.img1}" class="rounded">
					<c:if test="${dto.img2 != null}">
						<img src="${path}${dto.img2}" class="rounded">
					</c:if>
					<c:if test="${dto.img3 != null}">
						<img src="${path}${dto.img3}" class="rounded">
					</c:if>
			</div>
		</c:if>
	</div>
	<form action="/safezone/community/form">
		<input type="hidden" name="commu_num" value="${dto.commu_num}">
		<div class="col-12">
			<button type="button" class="btn btn-light" onclick="location='/safezone/community/home'">목록</button>
			<button type="button" class="btn btn-light">삭제</button>
			<button type="submit" class="btn btn-primary">수정</button>
		</div>
	</form>
</body>
</html>