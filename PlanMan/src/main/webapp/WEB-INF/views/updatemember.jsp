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
  <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>  
</head>
<body class="hold-transition register-page">
<div class="register-box">
  <div class="register-logo">
    <a href="redirect:/"><b>Plan</b>Man</a>
  </div>

  <div class="register-box-body">
    <p class="login-box-msg">会員情報修正</p>

   <form action="updateMember" method="post" onsubmit="return insertChk()">
      <div class="form-group has-feedback">
        <input id="id" type="text" value="${sessionScope.member.id}" name="id"class="form-control" readonly="readonly">
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
        <input id="name" type="text" class="form-control" name="name" value="${sessionScope.member.name}">
        <span class="glyphicon glyphicon-user form-control-feedback"></span>
      </div>
      
      <div class="form-group has-feedback">
   		 <div align="center">性別</div>
     	      <c:if test="${sessionScope.member.gender== 'male' }">
     	      <select id="gender" name="gender" class="form-control">
			  	<option value="male" selected="selected">男子</option>
			  	<option value="female">女子</option>
			  </select>
			  </c:if>
			  <c:if test="${sessionScope.member.gender== 'female' }">
     	      <select id="gender" name="gender" class="form-control">
			  	<option value="male">男子</option>
			  	<option value="female" selected="selected">女子</option>
			  </select>
			  </c:if>
      </div>
      
      <div class="form-group has-feedback">
        <input id="age" type="text" class="form-control" value="${sessionScope.member.age}" name="age">
      </div>
      
      <div class="form-group has-feedback" align="center" >
        <div align="center">職業</div>
			  <select id="job" name="job" class="form-control">
			  	<option value="student" selected="selected">学生</option>
			  	<option value="salesman">会社員</option>
			  	<option value="teacher">先生</option>
			  	<option value="lawyer">弁護士</option>
			  	<option value="architect">アーキテクト</option>
			  	<option value="nurse">看護師</option>
			  	<option value="doctor">医師</option>
			  	<option value="accountant">会計士</option>
			  	<option value="nutritionist">栄養士</option>
			  	<option value="soldier">軍人</option>
			  	<option value="marine">海軍</option>
			  	<option value="developer">クリエイター</option>
			  	<option value="projectmanager">プロジェクトマネージャ</option>
			  	<option value="fireman">ファイアマン</option>
			  	<option value="scientist">かがくしゃ</option>
			  	<option value="writer">作家</option>
			  	<option value="photographer">写真家</option>
			  	<option value="actor">俳優</option>
			  	<option value="singer">歌手</option>
			  	<option value="journalist">記者</option>
			  </select>	  
      </div>
      
      
      <div class="form-group has-feedback">
        <input id="nickname" type="text" class="form-control" value="${sessionScope.member.nickname }" name="nickname">
      </div>
      
      <div class="form-group has-feedback">
        	<input id="hobby" type="text" class="form-control" name="hobby" value="${sessionScope.member.hobby}">
      </div>
      
      <div class="form-group has-feedback">
        	<input id="height" type="number" class="form-control" name="height" value="${sessionScope.member.height}">
      </div>
      
      <div class="form-group has-feedback">
        	<input id="weight" type="number" class="form-control" name="weight" value="${sessionScope.member.weight}">
      </div>
     
      <div class="row">
        
        <div>
          <button type="submit" class="btn btn-primary btn-block btn-flat">会員情報修正</button>
        </div>
        <!-- /.col -->
      </div>
    </form>
    <div align="right">
    	<a href="gotoLogin" class="text-center">ログイン</a>
    </div>
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
    
    
	
	$('#password').keyup(function(){
		
		if($('#password').val().length <3 || $('#password').val().length > 15){
			$('#result4').text('');
			$('#result3').text("暗証番号の長さは3~15の間です.");
			flag2=false;
		}else{
			$('#result3').text('');	
			$('#result4').text("使用可能です.");
			flag2=true;
		}
	});
	
	$('#password2').keyup(function(){
		var password = $('#password').val();
		var password2 = $('#password2').val();
		
		if(password == password2){
			$('#result6').text('');
			$('#result5').text("暗証番号が一致します.");
			flag2=true;
		}else{
			$('#result5').text('');
			$('#result6').text("暗証番号が一致しません.");
			flag2=false;
		}		
	});
	
  });
  
  function insertChk(){
	  
	  
	  if(!flag2){
		  swal("間違ったパスワードです。 再入力してください.");
		  return false;
	  }
	  
	  if($('#password').val().length==0){
		  swal("暗証番号をご入力ください.");
		  return false;
	  }
	  
	  if($('#password2').val().length==0){
		  swal("暗証番号確認を入力してください.");
		  return false;
	  }
	  
	  if($('#name').val().length==0){
		  swal("名前を入力してください.");
		  return false;
	  }
	  
	  if($('#age').val().length==0){
		  swal("年齢を入力してください.");
		  return false;
	  }
	  
	  if($('#height').val().length==0){
		  swal("年齢を入力してください.");
		  return false;
	  }
	  
	  if($('#weight').val().length==0){
		  swal("年齢を入力してください.");
		  return false;
	  }
	  
	  return true;
  }
</script>
</body>
</html>
