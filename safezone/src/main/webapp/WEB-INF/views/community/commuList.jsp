<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
	
	<style>
		.content{
			overflow: hidden;
			text-overflow: ellipsis;
			white-space: nowrap;
		}
	</style>
</head>
<body>
	<div class="container">
		<form name="listFilter" id="setOption" action="/safezone/community/home" class="row g-3" method="post">
			<input type="hidden" name="pageNum" id="thisPageInput" value="1">
			<div class="col-md-6">
				<select class="form-select" name="location_num">
					<option value="0">지역</option>
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
			<div class="col-md-6">
				<select class="form-select" name="category">
					<option value="0">카테고리</option>
					<option value="1" ${dto.category==1 ? 'selected' : ''}>고장</option>
					<option value="2" ${dto.category==2 ? 'selected' : ''}>위험</option>
					<option value="3" ${dto.category==3 ? 'selected' : ''}>기타</option>
				</select>
			</div>
			<div class="d-grid gap-2">
				<button type="button" class="btn btn-light" onclick="location='/safezone/community/home'">필터 해제</button>
				<button type="submit" class="btn btn-primary">필터 적용</button>
			</div>
		</form>
		<div class="list-group">
			<c:forEach items="${commuCut}" var="commuCut">
				<a href="/safezone/community/content?num=${commuCut.commu_num}" class="list-group-item list-group-item-action" aria-current="true">
					<span class="badge text-bg-secondary">${commuCut.category==1?'고장':commuCut.category==2?'위험':'기타'}</span>
					<div class="d-flex w-100 justify-content-between">
						<h5 class="mb-1">${commuCut.title}</h5>
						<small>${commuCut.created_at}</small>
					</div>
					<p class="mb-1 contents">${commuCut.content}</p>
				</a>
			</c:forEach>
		</div>
	</div>
	<div class="col-12">
		<button type="button" class="btn btn-primary" onclick="location='/safezone/community/form'">작성하기</button>
	</div>
	
	<div class="pagination">
	    <nav aria-label="Page navigation">
		    <ul class="pagination justify-content-center">
		        <c:if test="${totalPages > 1 && dto.pageNum!=1}">
		            <li class="page-item" onclick="handlePageLinkClick(${dto.pageNum - 1})">
		                <a class="page-link"  href="javascript:void(0)" aria-label="Previous">
		                    <span aria-hidden="true">&laquo;</span>
		                </a>
		            </li>
		        </c:if>
		        <c:choose>
		            <c:when test="${totalPages <= 10}">
		                <c:forEach begin="1" end="${totalPages}" varStatus="page">
		                    <li class="page-item ${page.index == dto.pageNum ? 'active' : ''}" onclick="handlePageLinkClick(${page.index})">
		                        <a class="page-link" href="javascript:void(0)">${page.index}</a>
		                    </li>
		                </c:forEach>
		            </c:when>
		            <c:otherwise>
		                <c:choose>
		                    <c:when test="${dto.pageNum <= 5}">
		                    	<c:if test="${totalPages>10}">
			                        <c:forEach begin="1" end="10" varStatus="page">
			                            <li class="page-item ${page.index == dto.pageNum ? 'active' : ''}" onclick="handlePageLinkClick(${page.index})">
			                                <a class="page-link" href="javascript:void(0)">${page.index}</a>
			                            </li>
			                        </c:forEach>
		                        </c:if>
		                    </c:when>
		                    <c:when test="${dto.pageNum >= totalPages - 4}">
		                    	<c:if test="${totalPages>10}">
			                        <c:forEach begin="${totalPages - 9}" end="${totalPages}" varStatus="page">
			                            <li class="page-item ${page.index == dto.pageNum ? 'active' : ''}" onclick="handlePageLinkClick(${page.index})">
			                                <a class="page-link" href="javascript:void(0)">${page.index}</a>
			                            </li>
			                        </c:forEach>
		                        </c:if>
		                    </c:when>
		                    <c:otherwise>
		                    	<c:if test="${totalPages>10}">
			                        <c:forEach begin="${dto.pageNum - 4}" end="${dto.pageNum + 5}" varStatus="page">
			                            <li class="page-item ${page.index == dto.pageNum ? 'active' : ''}" onclick="handlePageLinkClick(${page.index})">
			                                <a class="page-link" href="javascript:void(0)">${page.index}</a>
			                            </li>
			                        </c:forEach>
		                        </c:if>
		                    </c:otherwise>
		                </c:choose>
		            </c:otherwise>
		        </c:choose>
		        <c:if test="${totalPages > 1 && dto.pageNum!=totalPages}">
		            <li class="page-item" onclick="handlePageLinkClick(${dto.pageNum + 1})" >
		                <a class="page-link"  href="javascript:void(0)" aria-label="Next">
		                    <span aria-hidden="true">&raquo;</span>
		                </a>
		            </li>
		        </c:if>
		    </ul>
		</nav>
	</div>
</body>
</html>
<script>
// 페이지 링크 클릭 시 폼 제출 이벤트 핸들러
function handlePageLinkClick(pageNum) {
    // 폼 선택
    const form = document.getElementById('setOption');
    const inputThisPageElement = document.querySelector('input[name="thisPage"]');
    inputThisPageElement.value = pageNum;
    form.submit();
}
</script>