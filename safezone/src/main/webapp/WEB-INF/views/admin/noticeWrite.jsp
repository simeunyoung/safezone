<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>safezone</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
        <link rel="stylesheet" href="/whou/resources/css/style.css">
        <script src="https://kit.fontawesome.com/dbaea98925.js" crossorigin="anonymous"></script>
        <script src="../resources/js/adminInputcheck.js" ></script>
        <script type="text/javascript" src="../resources/smarteditor/js/HuskyEZCreator.js" charset="utf-8"></script>
        <script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
        <script src="../resources/js/smartEditor.js" ></script> <%-- 스마트 에디터 --%>
<%--         <c:if test="${lv != 2}"> 관리자 레벨 검사
        	<script>
        		alert("잘못된 경로입니다.");
        		history.back();
        	</script>
        </c:if> --%>
    </head>
<body>
    <header class="py-5">
      <div class="container px-5">
     	 <h3 class="page-title" style="margin: 10px; padding: 20px;">문의사항 작성</h3>
      <div style="float: center; margin: 10px; padding: 20px; width: 1000px;">
		<form action="/whou/cs/noticeWrite" onsubmit="return submitPost();">
		<div class="mb-3">
			<label for="fruits">카테고리:</label>
		  	<select id="fruits">
			  <option value="x">선택</option>
			  <option value="apple">사과</option>
			  <option value="banana">바나나</option>
			  <option value="cherry">체리</option>
			  <option value="grape">포도</option>
			  <option value="orange">오렌지</option>
			</select>
		</div>
		<div class="mb-3">
		  <label for="exampleFormControlInput1" class="form-label">제목</label>
		  <input type="text" name="subject" class="form-control" id="exampleFormControlInput1" placeholder="제목을 입력해 주세요">
		</div>
		<div class="mb-3" style="height: 500px;">
		  <label for="exampleFormControlTextarea1" class="form-label">내용</label>
		  <textarea class="form-control" name="content" id="exampleFormControlTextarea1" rows="18" placeholder="내용을 입력해 주세요"></textarea>
		</div>
			<button type="submit" class="btn btn-light" style="float: right;">글작성</button>
			<button onclick="history.back();" type="button" class="btn btn-light" style="float: right;">돌아가기</button>
		</form>
		<script>
		</script>
	</div>
	</div>
	</header>
	<!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

