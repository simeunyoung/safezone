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
	
	.form-signin input[id="name"] {
	  margin-bottom: -1px;
	  border-bottom-right-radius: 0;
	  border-bottom-left-radius: 0;
	}
	
	.form-signin input[id="birth"] {
	  margin-bottom: -1px;
	  border-bottom-right-radius: 0;
	  border-bottom-left-radius: 0;
	  border-top-left-radius: 0;
	  border-top-right-radius: 0;
	}
	
	.form-signin input[id="tel"] {
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
         <p>비밀번호를 잊으셨나요? <a href="findPw">비밀번호 찾기</a></p>
         
         <div class="form-floating">
            <input type="text" class="form-control" id="name" placeholder="아이디 입력...">
            <label for="name">성명</label>
         </div>
         <div class="form-floating">
            <input type="text" class="form-control" id="birth" placeholder="Password">
            <label for="birth">생년월일</label>
         </div>
         <div class="form-floating">
            <input type="text" class="form-control" id="tel" placeholder="Password">
            <label for="tel">전화번호</label>
         </div>
         <button class="mb-3 w-100 btn btn-lg btn-primary" type="button" onclick="findEmail()">이메일 찾기</button>
      </form>
   </main>
   <!-- Bootstrap core JS-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	<script>
		function findEmail(){
			var name = $("#name").val();
            var birth = $("#birth").val();
            var tel = $("#tel").val();

            if (name === '' || birth == '' || tel == '') {
                alert("모든 항목을 입력해주세요.");
                return false;
            }
            
            $.ajax({
                url: "/safezone/user/findEmailPro",
                contentType: "application/x-www-form-urlencoded; charset=UTF-8",
                method: "POST",
                data: { name: name, birth: birth, tel: tel},
                error: function(xhr, status, error) {
                    var errorMessage = "오류: " + xhr.status + " " + xhr.statusText;
                    alert(errorMessage);
                },
                success: function(result) {
                    if (result === "") {
                        alert("회원정보를 찾을 수 없습니다. \n다시 입력해주세요.");
                    } else{
                    	alert(result);
                    }
                }
            });
		}
	</script>
</body>
</html>