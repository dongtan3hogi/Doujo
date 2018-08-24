<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>AdminLTE 2 | Registration Page</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <!-- Bootstrap 3.3.7 -->
  <link rel="stylesheet" href="resources/main/bower_components/bootstrap/dist/css/bootstrap.min.css">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="resources/main/bower_components/font-awesome/css/font-awesome.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="resources/main/bower_components/Ionicons/css/ionicons.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="resources/main/dist/css/AdminLTE.min.css">
  <!-- iCheck -->
  <link rel="stylesheet" href="resources/main/dist/css/blue.css">
  <!-- Google Font -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
  
</head>
<body class="hold-transition register-page">
<div class="register-box">
  <div class="register-logo">
    <a href="redirect:/"><b>Plan</b>Man</a>
  </div>

  <div class="register-box-body">
    <p class="login-box-msg">회원가입</p>

   <form action="insertMember" method="post" onsubmit="return insertChk()">
      <div class="form-group has-feedback">
        <input id="id" type="text" name="id"class="form-control" placeholder="ID">
        <p id="result1" style="color: green;"></p>
        <p id="result2" style="color: red;"></p>
        <span class="glyphicon glyphicon-user form-control-feedback"></span>
      </div>
      
      <div class="form-group has-feedback">
        <input id="password" type="password" name="password" class="form-control" placeholder="Password">
        <p id="result3" style="color: red;"></p>
        <p id="result4" style="color: green;"></p>
        
        <span class="glyphicon glyphicon-lock form-control-feedback"></span>
      </div>
      
      <div class="form-group has-feedback">
        <input id="password2" type="password" class="form-control" placeholder="Retype password">
        <p id="result5" style="color: green;"></p>
        <p id="result6" style="color: red;"></p>
        <span class="glyphicon glyphicon-lock form-control-feedback"></span>
      </div>
      
      <div class="form-group has-feedback">
        <input id="name" type="text" class="form-control" name="name" placeholder="Name">
        <span class="glyphicon glyphicon-user form-control-feedback"></span>
      </div>
      
      <div class="form-group has-feedback">
   		 <div align="center">성별</div>
     	      <select id="gender" name="gender" class="form-control">
			  	<option value="male" selected="selected">남자</option>
			  	<option value="female">여자</option>
			  </select>
      </div>
      
      <div class="form-group has-feedback">
        <input id="age" type="text" class="form-control" name="age" placeholder="Age">
      </div>
      
      <div class="form-group has-feedback" align="center" >
        <div align="center">직업</div>
			  <select id="job" name="job" class="form-control">
			  	<option value="student" selected="selected">학생</option>
			  	<option value="worker">회사원</option>
			  </select>	  
      </div>
      
      <p align="center">[선택 사항]</p>
      <div class="form-group has-feedback">
        <input id="nickname" type="text" class="form-control" name="nickname" placeholder="Nick name">
      </div>
      <div class="form-group has-feedback">
        <input id="hobby" type="text" class="form-control" name="hobby" placeholder="Hobby">
      </div>
      <div class="row">
        <div class="col-xs-8">
          <div class="checkbox icheck">
            <label>
              <input type="checkbox"> I agree to the <a href="#">terms</a>
            </label>
          </div>
        </div>
        <!-- /.col -->
        <div class="col-xs-4">
          <button type="submit" class="btn btn-primary btn-block btn-flat">가입하기</button>
        </div>
        <!-- /.col -->
      </div>
    </form>
    <a href="gotoLogin" class="text-center">로그인으로 가기</a>
  </div>
  <!-- /.form-box -->
</div>
<!-- /.register-box -->

<!-- jQuery 3 -->
<script src="resources/main/bower_components/jquery/dist/jquery.min.js"></script>
<!-- Bootstrap 3.3.7 -->
<script src="resources/main/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
<!-- iCheck -->
<script src="resources/main/dist/js/icheck.min.js"></script>
<script>
  var flag='';
  var flag2='';	

  $(function () {
    $('input').iCheck({
      checkboxClass: 'icheckbox_square-blue',
      radioClass: 'iradio_square-blue',
      increaseArea: '20%' /* optional */
    });
    
    $('#id').on('keyup', function(){
		var userid = $('#id').val();
		
		$.ajax({
			method : 'GET'
			, url : 'idcheck'
			, data : {"id":userid}
			, success : function(resp){
				if(resp.length == 0){	
					$('#result1').text("중복하지 않은 아이디입니다.");
					$('#result2').text('');
					flag=true;
				}
				if(resp.length != 0){
					$('#result1').text('');
					$('#result2').text("이미 사용중인 아이디입니다.");
					flag=false;
				}
			}
		});
	});
	
	$('#password').keyup(function(){
		
		if($('#password').val().length <3 || $('#password').val().length > 15){
			$('#result4').text('');
			$('#result3').text("비밀번호 길이는 3~15 사이 입니다.");
			flag2=false;
		}else{
			$('#result3').text('');	
			$('#result4').text("사용 가능합니다.");
			flag2=true;
		}
	});
	
	$('#password2').keyup(function(){
		var password = $('#password').val();
		var password2 = $('#password2').val();
		
		if(password == password2){
			$('#result6').text('');
			$('#result5').text("비밀번호가 일치합니다.");
			flag2=true;
		}else{
			$('#result5').text('');
			$('#result6').text("비밀번호가 일치하지 않습니다.");
			flag2=false;
		}		
	});
	
  });
  
  function insertChk(){
	  
	  if($('#id').val().length==0){
		  alert("아이디를 입력해 주세요");
		  return false;
	  }
	  
	  if($('#id').val().length < 3 || $('#id').val().length > 15){
		  alert("아이디 길이는 3~15 사이로 입력해주세요.");
		  return false;
	  }
	  
	  if(!flag){
		  alert("중복된 아이디로는 가입이 불가능 합니다.");
		  return false;
	  }
	  
	  if(!flag2){
		  alert("잘못된 비밀번호 입니다. 다시 입력해주세요.");
		  return false;
	  }
	  
	  if($('#password').val().length==0){
		  alert("비밀번호를 입력해 주세요");
		  return false;
	  }
	  
	  if($('#password2').val().length==0){
		  alert("비밀번호 확인을 입력해 주세요");
		  return false;
	  }
	  
	  if($('#name').val().length==0){
		  alert("이름을 입력해 주세요");
		  return false;
	  }
	  
	  if($('#age').val().length==0){
		  alert("나이를 입력해 주세요");
		  return false;
	  }
	  
	  return true;
  }
</script>
</body>
</html>
