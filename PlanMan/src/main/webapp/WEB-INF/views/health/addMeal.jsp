<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>Welcome PlanMan</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <!-- Bootstrap 3.3.7 -->
  <link rel="stylesheet" href="resources/main/bower_components/bootstrap/dist/css/bootstrap.min.css">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="resources/main/bower_components/font-awesome/css/font-awesome.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="resources/main/bower_components/Ionicons/css/ionicons.min.css">
  <!-- dataTable -->
  <link rel="stylesheet" type="text/css"  href="resources/main/bower_components/datatable/css/datatables.css">
  <!-- fullCalendar -->
  <link rel="stylesheet" href="resources/main/bower_components/fullcalendar/dist/fullcalendar.min.css">
  <link rel="stylesheet" href="resources/main/bower_components/fullcalendar/dist/fullcalendar.print.min.css" media="print">
  <!-- Theme style -->
  <link rel="stylesheet" href="resources/main/dist/css/AdminLTE.min.css">
  <!-- AdminLTE Skins. Choose a skin from the css/skins folder instead of downloading all of them to reduce the load. -->
  <link rel="stylesheet" href="resources/main/dist/css/skins/_all-skins.min.css">
  <!-- Google Font -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
  <!-- Date Picker -->
  <link rel="stylesheet" href="resources/main/bower_components/bootstrap-datepicker/dist/css/datepicker.css">

 <style type="text/css">
	 /* The Modal (background) */
     .modal {
         display: none; /* Hidden by default */
         position: fixed; /* Stay in place */
         z-index: 999; /* Sit on top */
         left: 0;
         top: 0;
         width: 100%; /* Full width */
         height: 100%; /* Full height */
         overflow: auto; /* Enable scroll if needed */
         background-color: rgb(0,0,0); /* Fallback color */
         background-color: rgba(0,0,0,0.6); /* Black w/ opacity */
     }
 
     /* Modal Content/Box */
     .modal-content {
         background-color: #fefefe;
         margin: 15% auto; /* 15% from the top and centered */
         padding: 20px;
         border: 1px solid #888;
         width: 30%; /* Could be more or less, depending on screen size */                          
     }
     /* The Close Button */
     .close {
         color: #aaa;
         float: right;
         font-size: 28px;
         font-weight: bold;
     }
     .close:hover,
     .close:focus {
         color: black;
         text-decoration: none;
         cursor: pointer;
     }
   
     
  </style>	

<!-- head -->
</head>
<body class="hold-transition skin-blue sidebar-mini">
<input type="hidden" id="MyID" value="${sessionScope.memberID}">
<input type="hidden" id="friendID" value="${sessionScope.friendID}">
<div class="wrapper">

  <header class="main-header">
    <!-- Logo -->
    <a href="redirect:/" class="logo">
      <!-- mini logo for sidebar mini 50x50 pixels -->
      <span class="logo-mini"><b>Pm</b></span>
      <!-- logo for regular state and mobile devices -->
      <span class="logo-lg"><b>Planman</b></span>
    </a>
    
    <!-- Header Navbar: style can be found in header.less -->
    <nav class="navbar navbar-static-top">
      <!-- Sidebar toggle button-->
      <a href="#" class="sidebar-toggle" data-toggle="push-menu" role="button">
        <span class="sr-only">Toggle navigation</span>
       <!--   <span class="icon-bar"></span>
        <span class="icon-bar"></span> -->
      </a>

      <div class="navbar-custom-menu">
        <ul class="nav navbar-nav" id="topMenuBarUl">
          <!-- Tasks: style can be found in dropdown.less -->
          <li class="dropdown messages-menu" id="pParentMessageBoard">
            
          </li>
          <!-- User Account: style can be found in dropdown.less -->
          <li class="dropdown user user-menu">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
              <img src="resources/main/dist/img/user2-160x160.jpg" class="user-image" alt="User Image">
              <span class="hidden-xs">${sessionScope.member.id}</span>
            </a>
            <ul class="dropdown-menu">
              <!-- User image -->
              <li class="user-header">
                <img src="resources/main/dist/img/user2-160x160.jpg" class="img-circle" alt="User Image">

                <p>
                  ${sessionScope.member.id}
                  <small>${sessionScope.member.nickname}</small>
                </p>
              </li>
              <!-- Menu Body -->
              <li class="user-body">
                <div class="row">
                  <div class="col-xs-4 text-center">
                    <a href="#">기능1</a>
                  </div>
                  <div class="col-xs-4 text-center">
                    <a href="#">기능2</a>
                  </div>
                  <div class="col-xs-4 text-center">
                    <a href="#">기능3</a>
                  </div>
                </div>
                <!-- /.row -->
              </li>
              <!-- Menu Footer-->
              <li class="user-footer">
                <div class="pull-left">
                  <a href="#" class="btn btn-default btn-flat">개인정보</a>
                </div>
                <div class="pull-right">
                  <a href="#" class="btn btn-default btn-flat">로그아웃</a>
                </div>
              </li>
            </ul>
          </li>
        </ul>
      </div>
    </nav>
  </header>
  <!-- Left side column. contains the logo and sidebar -->
  <aside class="main-sidebar">
    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">
      <!-- Sidebar user panel -->
      <div class="user-panel">
        <div class="pull-left image">
          <img src="resources/main/dist/img/user2-160x160.jpg" class="img-circle" alt="User Image">
        </div>
        <div class="pull-left info">
          <p>${sessionScope.member.id}</p>
          <a href="#"><i class="fa fa-circle text-success"></i> Online</a>
        </div>
      </div>
      <!-- search form -->
      <form action="#" method="get" class="sidebar-form">
        <div class="input-group">
          <input type="text" name="q" class="form-control" placeholder="Searchresources.">
          <span class="input-group-btn">
                <button type="submit" name="search" id="search-btn" class="btn btn-flat"><i class="fa fa-search"></i>
                </button>
              </span>
        </div>
      </form>
      <!-- /.search form -->
      <!-- sidebar menu: : style can be found in sidebar.less -->
      <ul class="sidebar-menu" data-widget="tree">
        <li class="header">MENU</li>
        <li class="treeview">
          <a href="#">
            <i class="fa fa-edit" style="color: #2ECCFA"></i> <span>Study</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu"> 
            <li><a href="gotoStudy"><i class="fa fa-circle-o text-aqua"></i> Study Main</a></li> 
            <li><a href="gotoQuiz"><i class="fa fa-circle-o text-aqua"></i> Quiz</a></li> 
            <li><a href="gotoGroupLobby"><i class="fa fa-circle-o text-aqua"></i> Study Group</a></li>
          </ul>
        </li>
        <li class="treeview">
          <a href="#">
            <i class="fa fa-suitcase" style="color: #F7D358"></i> <span>Work</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li><a href="gotoSearchFriend"><i class="fa fa-circle-o text-green"></i> Friend Main</a></li>
            <li><a href="friend2"><i class="fa fa-circle-o text-green"></i>Club Recommend</a></li>     
          </ul>
        </li>
        <li class="treeview">
          <a href="#">
            <i class="fa fa-heartbeat" style="color: #FF0040"></i> <span>Health</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li><a href="gotoHealth"><i class="fa fa-circle-o text-red"></i> Health Main</a></li>
            <li><a href="gotoMeal"><i class="fa fa-circle-o text-red"></i> Add Meal</a></li>
            <li><a href="gotoActivity"><i class="fa fa-circle-o text-red"></i> Add Activity</a></li>
            <li><a href="gotoNutrition"><i class="fa fa-circle-o text-red"></i> My Nutrition</a></li>
            <li><a href="gotoShowHospital"><i class="fa fa-circle-o text-red"></i> Hospital&Pharmarcy</a></li>
          </ul>
        </li>
        <li class="treeview">
          <a href="#">
            <i class="fa fa-users" style="color: #008000"></i> <span>Friend</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li><a href=""><i class="fa fa-circle-o text-green"></i> Friend 1</a></li>
            <li><a href=""><i class="fa fa-circle-o text-green"></i> Friend 2</a></li>
          </ul>
        </li>
        <li class="treeview">
          <a href="#">
            <i class="fa fa-calendar" style="color: #0000FF"></i> <span>Schdule</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li><a href="gotoCalendar"><i class="fa fa-circle-o text-blue"></i> Calendar</a></li>
            <li><a href="gotoTimeline"><i class="fa fa-circle-o text-blue"></i> Timeline</a></li>
          </ul>
        </li>
      </ul>
    </section>
    <!-- /.sidebar -->
  </aside>
  
  <!-- ========================================================================================================== -->
  <!-- ========================================================================================================== -->
  <!-- ========================================================================================================== -->
  
  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        Health
        <small>${sessionScope.member.id}님의 스케쥴 / <span id="clock"></span><c:if test="${sessionScope.eventtitle!=null}"> / 지금 일정: ${sessionScope.eventtitle}</c:if></small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active">Timeline</li>
      </ol>
    </section>
	
	<!-- The Modal -->
    <div id="myModal" class="modal">
 
    	<!-- Modal content -->
        <div class="modal-content">
        	<span class="close">&times;</span>
        	
        	<div>
        		<input type="hidden" id="foodnum">
        	</div>
        	<br/>
        	<div>
        		음식이름  :  <span id="fName"></span> 
        	</div>
        	<br/>
        	<div>
        		섭취량    <input type="number" style="width: 50px; height: 30px;" id="fGram" >g
        	</div>
        	<br/>
        	<div>
        		섭취일 <input type="text" style="width: 150px;" class="datepicker" id="eatday" > 
        	</div>
        	<br/>
        	<div id="sch-button" align="right"><input type="submit" id="addMeal" style="width: 200px;" value="음식 입력하기" class="btn btn-block btn-Danger" onclick="return addMealChk()"/></div>
        </div>
    </div>

    <!-- Main content -->
    <section class="content">
      <div class="row">
      	<div class="box box-danger" style="margin-left: 20px; margin-right: 20px; width: 90%;">
	      	<div class="box-header">
              		<i class="fa fa-fw fa fa-heartbeat" style="color: #dd4b39"></i>
	                <h3 class="box-title">Add Meal</h3>
        	</div>
	      	<br/>
	      	<div>식품군
	      		<form action="gotoMeal" method="get" style="display: inline;">
		      	<select name="FDGRP_NM">
		      		<option selected="selected">${foodgroup}</option>
		      		<option value="가공유류">가공유류</option>\
		      		<option value="감자 및 전분류">감자 및 전분류</option>
		      		<option value="견과류">견과류</option>
		      		<option value="곡류 및 그 제품">곡류 및 그 제품</option>
		      		<option value="곡류, 서류 제품">곡류, 서류 제품</option>
		      		<option value="과실류">과실류</option>
		      		<option value="과일·채소류음료">과일·채소류음료</option>
		      		<option value="과일류">과일류</option>
		      		<option value="과자">과자</option>
		      		<option value="과자류">과자류</option>
		      		<option value="구이류">구이류</option>
		      		<option value="국 및 탕류">국 및 탕류</option>
		      		<option value="기타">기타</option>
		      		<option value="기타음료">기타음료</option>
		      		<option value="김치류">김치류</option>
		      		<option value="나물/숙채류">나물/숙채류</option>
		      		<option value="난류">난류</option>
		      		<option value="농축유류">농축유류</option>
		      		<option value="다류">다류</option>
		      		<option value="당류">당류</option>
		      		<option value="당류 및 그 제품">당류 및 그 제품</option>
		      		<option value="두류 및 그 제품">두류 및 그 제품</option>
		      		<option value="두류, 견과 및 종실류">두류, 견과 및 종실류</option>
		      		<option value="두유류">두유류</option>
		      		<option value="면 및 만두류">면 및 만두류</option>
		      		<option value="면류">면류</option>
		      		<option value="발효유류">발효유류</option>
		      		<option value="발효음료류">발효음료류</option>
		      		<option value="밥류">밥류</option>
		      		<option value="버섯류">버섯류</option>
		      		<option value="볶음류">볶음류</option>
		      		<option value="분식">분식</option>
		      		<option value="분유류">분유류</option>
		      		<option value="빵 또는 떡류">빵 또는 떡류</option>
		      		<option value="빵 및 과자류">빵 및 과자류</option>
		      		<option value="생채/무침류">생채/무침류</option>
		      		<option value="소스류">소스류</option>
		      		<option value="수조어육류">수조어육류</option>
		      		<option value="시리얼류">시리얼류</option>
		      		<option value="식물성크림">식물성크림</option>
		      		<option value="아이스크림">아이스크림</option>
		      		<option value="아이스크림류">아이스크림류</option>
		      		<option value="어패류">어패류</option>
		      		<option value="영·유아용 곡류조제식">영·유아용 곡류조제식</option>
		      		<option value="우유 및 유제품">우유 및 유제품</option>
		      		<option value="우유류">우유류</option>
		      		<option value="유지류">유지류</option>
		      		<option value="육류 및 그 제품">육류 및 그 제품</option>
		      		<option value="음료">음료</option>
		      		<option value="음료 및 주류">음료 및 주류</option>
		      		<option value="음료 및 차류">음료 및 차류</option>
		      		<option value="인삼·홍삼음료">인삼·홍삼음료</option>
		      		<option value="장기보존식품">장기보존식품</option>
		      		<option value="장아찌/절임류">장아찌/절임류</option>
		      		<option value="전/ 적 및 부침류">전/ 적 및 부침류</option>
		      		<option value="젓갈류">젓갈류</option>
		      		<option value="제빵">제빵</option>
		      		<option value="조리가공식품류">조리가공식품류</option>
		      		<option value="조림류">조림류</option>
		      		<option value="조미료류">조미료류</option>
		      		<option value="죽 및 스프류">죽 및 스프류</option>
		      		<option value="즉석섭취·편의식품류">즉석섭취·편의식품류</option>
		      		<option value="찌개 및 전골류">찌개 및 전골류</option>
		      		<option value="찜류">찜류</option>
		      		<option value="채소류">채소류</option>
		      		<option value="체중조절용 조제식품">체중조절용 조제식품</option>
		      		<option value="카레">카레</option>
		      		<option value="커피">커피</option>
		      		<option value="코코아가공품류 또는 초콜릿류">코코아가공품류 또는 초콜릿류</option>
		      		<option value="탄산음료류">탄산음료류</option>
		      		<option value="특수의료용도등식품">특수의료용도등식품</option>
		      		<option value="피자">피자</option>
		      		<option value="해조류">해조류</option>
		      		<option value="햄버거">햄버거</option>
		      	</select>
	      		<input type="submit" value="식품군 보기" class="btn btn-Danger"/>
	      		</form>
	      		<form action="showtoMeal" method="get" onsubmit="return eatTable()" style="display: inline;">
	      			날짜 선택 : <input type="text" style="width: 150px;" class="datepicker" name="countday" id="eatTableDay" > 
	      			<input type="submit" value="식단표 보기" class="btn btn-Danger"/>
	      		</form>
	      	</div>
	      	
	      	
	      		
	      	
			<table width="100%" class="display" id="example" cellspacing="0">
	        <thead>
	            <tr>
	                <th>번호</th>
	                <th>식품이름</th>
	                <th>1회제공량(g)</th>
	                <th>열량(kcal)</th>
	                <th>탄수화물(g)</th>
	                <th>단백질(g)</th>
	                <th>지방(g)</th>
	                <th>당류(g)</th>
	                <th>나트륨(mg)</th>
	                <th>콜레스테롤(mg)</th>
	                <th>포화지방산(g)</th>
	                <th>트랜스지방(g)</th>
	                <th>가공업체명</th>
	                <th>구축년도</th>
	                <th style="display: none;">번호</th>
	            </tr>
	        </thead>
	        <tbody>
	        	<c:forEach var="foodList" items="${foodList}" varStatus="status" >
	        	<tr>
					<td>${status.count}</td>
					<td>${foodList.DESC_KOR}</td>
					<td>${foodList.SERVING_WT}</td>
					<td>${foodList.NUTR_CONT1}</td>
					<td>${foodList.NUTR_CONT2}</td>
					<td>${foodList.NUTR_CONT3}</td>
					<td>${foodList.NUTR_CONT4}</td>
					<td>${foodList.NUTR_CONT5}</td>
					<td>${foodList.NUTR_CONT6}</td>
					<td>${foodList.NUTR_CONT7}</td>
					<td>${foodList.NUTR_CONT8}</td>
					<td>${foodList.NUTR_CONT9}</td>
					<td>${foodList.ANIMAL_PLANT}</td>
					<td>${foodList.BGN_YEAR}</td>
					<td style="display: none;">${foodList.NUM}</td>
	            </tr>
			</c:forEach>
	        </tbody>
	        </table>
	        
	        
        </div>
      </div>
      <!-- /.row -->
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->
  

  <!-- ========================================================================================================== -->
  <!-- ========================================================================================================== -->
  <!-- ========================================================================================================== -->
  
  
  <footer class="main-footer">
    <div class="pull-right hidden-xs">
      <b>Version</b> 0.0.1
    </div>
    <strong>Copyright &copy; 2018 PlanMan.</strong>
  </footer>

<!-- ./wrapper -->

<!-- jQuery 3 -->
<script src="resources/main/bower_components/jquery/dist/jquery.min.js"></script>
<!-- Bootstrap 3.3.7 -->
<script src="resources/main/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
<!-- jQuery UI 1.11.4 -->
<script src="resources/main/bower_components/jquery-ui/jquery-ui.min.js"></script>
<!-- Slimscroll -->
<script src="resources/main/bower_components/jquery-slimscroll/jquery.slimscroll.min.js"></script>
<!-- FastClick -->
<script src="resources/main/bower_components/fastclick/lib/fastclick.js"></script>
<!-- AdminLTE App -->
<script src="resources/main/dist/js/adminlte.min.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="resources/main/dist/js/demo.js"></script>
<!-- fullCalendar -->
<script src="resources/main/bower_components/moment/moment.js"></script>
<script src="resources/main/bower_components/fullcalendar/dist/fullcalendar.min.js"></script>
<!-- dataTable -->
<script type="text/javascript" src="resources/main/bower_components/datatable/js/datatables.js"></script>
<!-- datepicker -->
<script src="//code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<!-- Page specific script -->
<script>
//Get the modal
var modal = document.getElementById('myModal');

// Get the <span> element that closes the modal
var span = document.getElementsByClassName("close")[0];



  $(function () {
	  
	  $('.datepicker').datepicker({
			dateFormat: 'yy-mm-dd'
	  });
	  
	  $('.datepicker').datepicker('setDate', 'today');
	  
	  showtime();
	  
	  
	  setInterval(function(){
		  showtime();
	  },60000);
	  
	  var table = $('#example').DataTable({
		  "scrollX": true
		  ,"select": true
	  });
	
	  $('#example tbody').on('click', 'tr', function(){
		    
		  	$('#foodnum').val(table.row( this ).data()[14]);
			$('#fName').append(table.row( this ).data()[1]);
			$('#fGram').val(table.row( this ).data()[2]);
		  	modal.style.display = "block";
		  	//When the user clicks on <span> (x), close the modal
		  	span.onclick = function() {
				$('#eatday').val('');
				$('#fName').text('');
				$('#fGram').val('');
		  	    modal.style.display = "none";
  		  	    $('.datepicker').datepicker('setDate', 'today');
		  	}

		  	// When the user clicks anywhere outside of the modal, close it
		  	window.onclick = function(event) {
		  	    if (event.target == modal) {
		  	    	$('#eatday').val('');
		  	    	$('#fName').text('');
		  	    	$('#fGram').val('');
		  	        modal.style.display = "none";
		  		    $('.datepicker').datepicker('setDate', 'today');
		  	    }
		  	}
		  	
	  });
	  
  })
  
  function showtime(){
	  var currentDate = new Date(); // 현재시간
	  var currentHours = addZeros(currentDate.getHours(),2); 
	  var currentMinute = addZeros(currentDate.getMinutes(),2);
	  var time=currentHours+":"+currentMinute;
	  $('#clock').text('');
	  $('#clock').append(time);
  }
  
  function addZeros(num, digit) { // 자릿수 맞춰주기
	  var zero = '';
	  num = num.toString();
	  if (num.length < digit) {
	    for (i = 0; i < digit - num.length; i++) {
	      zero += '0';
	    }
	  }
	  return zero + num;
  }
  
  function addMealChk(){
	  
	  if($('#eatday').val().length==0){
		  alert("날짜를 선택 해주세요.");
		  return false;
	  }
	  
	  if($('#fGram').val().length==0||$('#fGram').val()<=0){
		  alert("잘못된 섭취량 입니다.");
		  return false;
	  }
	  
	  $.ajax({
			 url:"addMeal"
			 ,type:"post"
			 ,data:{
				 "NUM":$('#foodnum').val()
			     ,"countday":$('#eatday').val()
			     ,"SERVING_WT":$('#fGram').val()
			 }
		     ,success:function(data){
		    	 if(data=="success"){
		    	 	alert("음식 입력이 완료되었습니다.");
		    	 	$('#eatday').val('');
		  	    	$('#fName').text('');
		  	    	$('#fGram').val('');
		  	        modal.style.display = "none";
		  	        return true;
		    	 }else{
		    		alert("입력에 실패했습니다.");
		    		$('#eatday').val('');
		  	    	$('#fName').text('');
		  	    	$('#fGram').val('');
		  	        modal.style.display = "none";
		  	        return false;
		    	 }
		     }
		     ,error:function(){
		    	 
		     }
	  });
	  
	  return true;
  }
  
  function eatTable(){
	  if($('#eatTableDay').val().length==0){
		  alert("날짜를 선택해주세요");
		  return false;
	  }
	  return true;
  }
  
</script>
<script type="text/javascript" src="<c:url value="/resources/study/sockjs-0.3.4.js"/>"></script>
<script type="text/javascript">

    var sock;

    //웸소켓을 지정한 url로 연결한다.
    sock = new SockJS("<c:url value="/echo2"/>");
    
</script>
<script src="resources/main/js/messageBar.js"></script> 
</body>
</html>
