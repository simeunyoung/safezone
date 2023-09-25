<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
   
</head>
<style>
.apply-push, .apply-cencle{cursor:pointer;}
.apply-cencle{display:none;}
</style>
<body>
	<div class="container-fluid">
		<table>
			<tr>
				<th>글번호</th>
				<th>신청인</th>
				<th>카테고리</th>
				<th>제목</th>
				<th>작성일</th>
				<th>추천수</th>
				<th></th>
			</tr>
			 <c:forEach var="item" items="${list}">
		      <tr>
		        <td>${item.apply_num}</td>
		       <td class="masked-email">${item.email}</td>
		        <td>${item.category}</td>
		        <td>${item.address}</td>
		        <td>${item.created_at}</td>
		        <td>${item.recommend}</td>
		        <td class="apply-button">
		        	<div class="apply-push" onclick="recommend(this)">추천하기</div>
       				<div class="apply-cencle" onclick="cancelRecommend(this)">추천취소</div>
		        </td>
		      </tr>
		    </c:forEach>
		</table>
		
		<c:set var="startPage" value="${currentPage - 5}" />
		<c:choose>
		    <c:when test="${startPage < 1}">
		        <c:set var="startPage" value="1" />
		    </c:when>
		    <c:otherwise>
		        <c:set var="startPage" value="${currentPage - 5}" />
		    </c:otherwise>
		</c:choose>
		
		<c:set var="endPage" value="${currentPage + 4}" />
		
		<nav aria-label="Page navigation">
		    <ul class="pagination justify-content-center">
		        <!-- 이전 페이지가 있는 경우 -->
		        <c:if test="${currentPage > 1}">
		            <li class="page-item">
		                <a class="page-link" href="applyList?page=${currentPage - 1}" aria-label="Previous">
		                    <span aria-hidden="true">&lt;</span>
		                </a>
		            </li>
		        </c:if>
		        <c:forEach var="pageNum" begin="${startPage}" end="${endPage}">
		            <c:if test="${pageNum >= 1 && pageNum <= totalPages}">
		                <li class="page-item"><a class="page-link" href="applyList?page=${pageNum}">${pageNum}</a></li>
		            </c:if>
		        </c:forEach>
		       <!-- 다음 페이지가 있는 경우-->
		        <c:if test="${currentPage + 10 <= totalPages}">
		            <li class="page-item">
		                <a class="page-link" href="applyList?page=${currentPage + 10}" aria-label="Next">
		                    <span aria-hidden="true">&rt;</span>
		                </a>
		            </li>
		        </c:if>
		    </ul>
		</nav>

	</div>
	
<script	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js" integrity="sha512-v2CJ7UaYy4JwqLDIrZUI/4hqeoQieOmAZNXBeQyjo21dadnwR+8ZaIJVT8EE2iyI61OV8e6M8PP2/4hpQINQ/g==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
  <script>
       // 이메일 주소를 마스킹하는 함수
       function maskEmail(email) {
           var atIndex = email.indexOf('@');
           if (atIndex > 0) {
               var maskedPortion = email.substring(0, 4);
               for (var i = 4; i < atIndex; i++) {
                   maskedPortion += '*';
               }
               return maskedPortion + email.substring(atIndex);
           }
           return email;
       }

       // 모든 td 요소에서 이메일 주소를 마스킹 처리
       $('td.masked-email').each(function () {
           var originalEmail = $(this).text();
           var maskedEmail = maskEmail(originalEmail);
           $(this).text(maskedEmail);
       });
       
    // 모든 버튼 그룹을 선택합니다.
       const buttonGroups = document.querySelectorAll('.apply-button');

       // 각 버튼 그룹에 대한 이벤트를 설정합니다.
       buttonGroups.forEach(buttonGroup => {
         // "추천하기" 버튼을 선택합니다.
         const recommendButton = buttonGroup.querySelector('.apply-push');
         // "추천 취소" 버튼을 선택합니다.
         const cancelRecommendButton = buttonGroup.querySelector('.apply-cencle');

         // "추천하기" 버튼을 클릭했을 때 실행되는 함수
         recommendButton.addEventListener('click', function() {
           // "추천하기" 버튼을 숨깁니다.
           recommendButton.style.display = 'none';
           // "추천 취소" 버튼을 보여줍니다.
           cancelRecommendButton.style.display = 'block';
         });

         // "추천 취소" 버튼을 클릭했을 때 실행되는 함수
         cancelRecommendButton.addEventListener('click', function() {
           // "추천 취소" 버튼을 숨깁니다.
           cancelRecommendButton.style.display = 'none';
           // "추천하기" 버튼을 보여줍니다.
           recommendButton.style.display = 'block';
         });
       });
       
       function recommend(button) {
    	   const applyNum = getApplyNumFromTableRow(button);

    	   // applyNum을 사용하여 DB에서 해당 항목의 추천 수를 +1 업데이트하고 Ajax 요청을 보냅니다.
    	   $.ajax({
    	     url: '/applyRecommed', // 컨트롤러의 URL로 변경하세요.
    	     type: 'POST',
    	     data: { applyNum: applyNum },
    	     success: function (data) {
    	       // Ajax 요청이 성공했을 때 수행할 작업을 여기에 추가하세요.
    	       // 예: 추천 수 업데이트, 버튼 상태 변경 등
    	       const recommendCountElement = button.closest('tr').querySelector('.recommend-count');
    	       const newRecommendCount = parseInt(recommendCountElement.textContent) + 1;
    	       recommendCountElement.textContent = newRecommendCount;
    	       
    	       // 추천하기 버튼을 숨기고 추천 취소 버튼을 보여줍니다.
    	       button.style.display = 'none';
    	       button.parentElement.querySelector('.apply-cencle').style.display = 'block';
    	     },
    	     error: function (error) {
    	       console.error('추천하기 Ajax 요청 실패:', error);
    	     }
    	   });
    	 }

    	 function cancelRecommend(button) {
    	   const applyNum = getApplyNumFromTableRow(button);

    	   // applyNum을 사용하여 DB에서 해당 항목의 추천 수를 -1 업데이트하고 Ajax 요청을 보냅니다.
    	   $.ajax({
    	     url: '/your-controller-url/cancelRecommend', // 컨트롤러의 URL로 변경하세요.
    	     type: 'POST',
    	     data: { applyNum: applyNum },
    	     success: function (data) {
    	       // Ajax 요청이 성공했을 때 수행할 작업을 여기에 추가하세요.
    	       // 예: 추천 수 업데이트, 버튼 상태 변경 등
    	       const recommendCountElement = button.closest('tr').querySelector('.recommend-count');
    	       const newRecommendCount = parseInt(recommendCountElement.textContent) - 1;
    	       recommendCountElement.textContent = newRecommendCount;

    	       // 추천 취소 버튼을 숨기고 추천하기 버튼을 보여줍니다.
    	       button.style.display = 'none';
    	       button.parentElement.querySelector('.apply-push').style.display = 'block';
    	     },
    	     error: function (error) {
    	       console.error('추천 취소 Ajax 요청 실패:', error);
    	     }
    	   });
    	 }

    	 function getApplyNumFromTableRow(button) {
    	   const tableRow = button.closest('tr');
    	   const applyNumElement = tableRow.querySelector('td:first-child');
    	   return parseInt(applyNumElement.textContent.trim());
    	 }


  
    	   
    </script>
</body>
</html>







</body>
</html>