<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	
	.form-signin input[type="text"] {
	  margin-bottom: -1px;
	  border-bottom-right-radius: 0;
	  border-bottom-left-radius: 0;
	}
	
	.form-signin input[type="password"] {
	  margin-bottom: 10px;
	  border-top-left-radius: 0;
	  border-top-right-radius: 0;
	}
	
	.form-signin p{margin-bottom: 30px;}
	.form-signin p a{font-weight: 600;font-size: 15px;}
	
	.find-wrap{width: 100%;text-align: right; }
	.find-wrap a{font-weight: 600;font-size: 15px; color:#999;}
	
</style>
</head>
<body class="text-center">
   <main class="form-signin">
      <form action="loginPro" method="post">
      	<!-- 로고 이미지 -->
         <a href="/safezone/main"><img class="mb-4" src="" alt="" width="72" height="57"></a>
         <p>회원이 아니신가요? <a href="sign">회원가입하기</a></p>
         
         <div class="form-floating">
            <input type="text" class="form-control" id="email" placeholder="아이디 입력...">
            <label for="email">이메일</label>
         </div>
         <div class="form-floating">
            <input type="password" class="form-control" id="pw" placeholder="Password">
            <label for="pw">비밀번호</label>
         </div>
         
         <!-- <div class="checkbox mb-3">
            <label>
               <input type="checkbox" value="remember-me"> 아이디 저장
            </label>
         </div> -->
         <button class="mb-3 w-100 btn btn-lg btn-primary" type="button" onclick="login()">로그인</button>
<!--          <button class="mb-1 w-100 btn btn-lg btn-outline-primary" type="button" onclick="location='sign'">회원가입</button>
 -->         <div class="find-wrap">
            <a href="/safezone/user/findEmail">이메일/비밀번호 찾기</a>
          </div>
      </form>
   </main>
   <!-- Bootstrap core JS-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	<script>
		function login(){
			var email = $("#email").val();
            var pw = $("#pw").val();

            if (email === '' || pw == '') {
                alert("모든 항목을 입력해주세요.");
                return false;
            }
            
            $.ajax({
                url: "/safezone/user/loginPro",
                contentType: "application/x-www-form-urlencoded; charset=UTF-8",
                method: "POST",
                data: { email: email, pw: pw },
                error: function(xhr, status, error) {
                    var errorMessage = "오류: " + xhr.status + " " + xhr.statusText;
                    alert(errorMessage);
                },
                success: function(result) {
                    if (result == "1") {
                        alert("이메일을 다시 확인해주세요.");
                    } else if (result == "2") {
                        window.location.href = "/safezone/main";
                    } else if (result == "0") {
                        alert("비밀번호가 일치하지 않습니다.\n다시 입력해주세요.");
                    }
                }
            });
		}
	</script>
</body>
</html>