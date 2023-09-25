<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>/user/login</title>
    <!-- Favicon-->
    <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
    <!-- Bootstrap icons-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet" />
    <!-- Core theme CSS (includes Bootstrap)-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
    <link rel="stylesheet" href="/whou/resources/css/style.css">
    <script src="https://kit.fontawesome.com/dbaea98925.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <style>
        html,
        body {
            height: 100%;
        }

        body {
            display: flex;
            align-items: center;
            padding-top: 40px;
            padding-bottom: 40px;
            background-color: #f5f5f5;
        }

        .form-signin {
            width: 100%;
            max-width: 330px;
            padding: 15px;
            margin: auto;
        }

        .form-signin .checkbox {
            font-weight: 400;
        }

        .form-signin .form-floating:focus-within {
            z-index: 2;
        }

        .form-signin input {
            margin-bottom: 10px;
        }
    </style>
</head>
<body class="text-center">
   <main class="form-signin">
      <form action="signPro" method="post">
         <!-- 로고 이미지 -->
         <a href="/safezone/main"><img class="mb-4" src="" alt="" width="72" height="57"></a>
         <h1 class="h3 mb-3 fw-normal">회원가입</h1>

         <div class="form-floating">
            <input type="text" class="form-control" id="email">
            <label for="email">이메일</label>
         </div>
         <div class="form-floating">
            <input type="password" class="form-control" id="pw">
            <label for="pw">비밀번호</label>
         </div>
         <div class="form-floating">
            <input type="password" class="form-control" id="pw2">
            <label for="pw2">비밀번호 확인</label>
         </div>
         <div class="form-floating">
            <input type="text" class="form-control" id="name">
            <label for="name">성명</label>
         </div>
         <div class="form-floating">
            <input type="text" class="form-control" id="birth">
            <label for="birth">생년월일</label>
         </div>

         <div class="btn-group" role="group" aria-label="Basic radio toggle button group">
		  <input type="radio" class="btn-check" name="gender" id="gender1" autocomplete="off" value="1">
		  <label class="btn btn-outline-primary" for="gender1">남성</label>
		
		  <input type="radio" class="btn-check" name="gender" id="gender2" autocomplete="off" value="2">
		  <label class="btn btn-outline-primary" for="gender2">여성</label>
		</div>

         <div class="form-floating">
            <input type="text" class="form-control" id="tel">
            <label for="tel">연락처</label>
         </div>
         <c:if test="${statu != 2}">
	         <div class="form-floating">
	            <input type="text" class="form-control" id="emg_tel">
	            <label for="emg_tel">긴급연락망</label>
	         </div>
         </c:if>

         <button class="w-100 btn btn-lg btn-primary" type="button" onclick="sign()">회원가입</button>
         <p class="mt-5 mb-3 text-muted">&copy; 2017–2021</p>
      </form>
   </main>
   <!-- Bootstrap core JS-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        function sign() {
        	var statu = ${statu};
            var email = $("#email").val();
            var pw = $("#pw").val();
            var pw2 = $("#pw2").val();
            var name = $("#name").val();
            var birth = $("#birth").val();
            var gender = $("input[name='gender']:checked").val(); // 라디오 버튼의 선택값 읽기
            var tel = $("#tel").val();
            var emg_tel = $("#emg_tel").val();

            if (email === '' || pw == '' || pw2 == '' || name == '' || birth == '' || gender == undefined || tel == '' || emg_tel == '') {
                alert("모든 항목을 입력해주세요.");
                return false;
            }

            var data = {
                email: email,
                pw: pw,
                name: name,
                birth: birth,
                gender: gender, // 선택된 라디오 버튼의 값 사용
                tel: tel,
                emg_tel: emg_tel
                statu: statu
            };

            $.ajax({
                url: "/safezone/user/signPro",
                contentType: "application/x-www-form-urlencoded; charset=UTF-8",
                method: "POST",
                data: data,
                error: function (xhr, status, error) {
                    var errorMessage = "오류: " + xhr.status + " " + xhr.statusText;
                    alert(errorMessage + " " + email + " " + pw + " " + name + " " + birth + " " + gender + " " + tel + " " + emg_tel);
                },
                success: function (result) {
                    if (result == 0) {
                        alert("입력 내용을 다시 확인해주세요.");
                    } else if (result == 1) {
                        alert("회원가입이 완료되었습니다.");
                        window.location.href = "/safezone/main";
                    }
                }
            });
        }
    </script>
</body>
</html>
