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
   
     #actType{
 		 display: inline-flex;
		 width: 100%;
	 }
	
	 .forkacl{
		 border:none;
		 width:40px;
		 text-align: right;
	 }
	
	 .tab {
	   display: none; 
	 }
	
	 label {
	   margin: 0 0 -1px;
	   padding: 10px 20px;
	   font-weight: 600;
	   text-align: center;
	   color: #708090;
	   border: 1px solid transparent;
	 }
	
	 .tab:checked + label {
	   color: #ffc6c3;
	   border: 1px solid #ddd;
	   border-top: 2px solid #ffc6c3;
	   border-bottom: 1px solid #ffffff;
	 } 
	
	 label:hover {
	   color: #b0e0e6;
	   cursor: pointer;
	 }
	
	 #content{
	   border: 2px solid #ffc6c3;
	   border-top: 2px solid #ffc6c3;
	   border-bottom: 2px solid #ffc6c3;
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
            <li><a href="mainWork"><i class="fa fa-circle-o text-yellow"></i> Work Main</a></li>
            <li><a href="goNewsMap"><i class="fa fa-circle-o text-yellow"></i> News</a></li>         
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
            <li><a href="gotoSearchFriend"><i class="fa fa-circle-o text-green"></i> Friend Main</a></li>
            <li><a href="friend2"><i class="fa fa-circle-o text-green"></i>Club Recommend</a></li>
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
	                <h3 class="box-title">Add Activity</h3>
        </div>
    	<div align="right">
    		날짜 선택&nbsp:&nbsp<input type="text" style="width: 150px;" class="datepicker" name="countday" id="addActDay" >&nbsp
    		<input type="button" class="btn btn-Danger" id="addActivity" value="활동 입력하기" style="margin-right: 10px;">
    	</div>
    	<br/>
    	<div id="actType">
		 	<input id="tab1" value="걷기" type="radio" name="tabs" class="tab">
		 	<label for="tab1">걷기</label>
		 	<input id="tab2" value="계단" type="radio" name="tabs" class="tab">
		 	<label for="tab2">계단</label>
		 	<input id="tab3" value="등산" type="radio" name="tabs" class="tab">
		 	<label for="tab3">등산</label>
		 	<input id="tab4" value="수영" type="radio" name="tabs" class="tab">
		 	<label for="tab4">수영</label>
		 	<input id="tab5" value="요가" type="radio" name="tabs" class="tab">
		 	<label for="tab5">요가</label>
		 	<input id="tab6" value="복싱" type="radio" name="tabs" class="tab">
		 	<label for="tab6">복싱</label>
		 	<input id="tab7" value="줄넘기" type="radio" name="tabs" class="tab">
		 	<label for="tab7">줄넘기</label>
		 	<input id="tab8" value="자전거" type="radio" name="tabs" class="tab">
		 	<label for="tab8">자전거</label>
		 	<input id="tab9" value="달리기" type="radio" name="tabs" class="tab">
		 	<label for="tab9">달리기</label>
		 	<input id="tab10" value="스쿼트" type="radio" name="tabs" class="tab">
		 	<label for="tab10">스쿼트</label>
		 	<input id="tab11" value="사이클" type="radio" name="tabs" class="tab">
		 	<label for="tab11">사이클</label>
		 	<input id="tab12" value="스쿼시" type="radio" name="tabs" class="tab">
		 	<label for="tab12">스쿼시</label>
		 	<input id="tab13" value="훌라후프" type="radio" name="tabs" class="tab">
		 	<label for="tab13">훌라후프</label>
		 	<input id="tab14" value="런닝머신" type="radio" name="tabs" class="tab">
		 	<label for="tab14">런닝머신</label>
		 	<input id="tab15" value="에어로빅" type="radio" name="tabs" class="tab">
		 	<label for="tab15">에어로빅</label>
		 	<input id="tab16" value="윗몸일으키키" type="radio" name="tabs" class="tab">
		 	<label for="tab16">윗몸일으키키</label>
		</div>
		
		<div id="content" align="center" class="t">
		<!--  	<br><input type="text" id="weight" class="forkacl">kg&nbsp&nbspX&nbsp&nbsp<input type="text" id="time" value="10" class="forkacl">분&nbsp&nbsp=<input type="text" id="kacl" readonly="readonly" class="forkacl">kacl
			<div><img src="./resources/main/images/sp_pwalk.png" style="width:80%; height:250px;"></div>-->
		</div>
		
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

	  $("#tab1").on('click',function(){
		 $("#content").text('');
		 $("#content").append("<br><input type='text' id='weight' class='forkacl'>kg&nbsp&nbspX&nbsp&nbsp<input type='text' id='time' value='10' class='forkacl'>분&nbsp&nbsp=<input type='text' id='kacl' readonly='readonly' class='forkacl'>kacl");
		 $("#content").append("<div><img src='./resources/main/images/ANY_pwalk.gif' style='width:20%; height:20%;'></div>");
		 
		 $('#weight').keyup(function(){
			var weight=$('#weight').val();
			var time=$('#time').val();
				
			$('#kacl').val((weight*time)/15);
	  	 });
		 
	 		 $('#time').keyup(function(){
			var weight=$('#weight').val();
			var time=$('#time').val();
					
			$('#kacl').val((weight*time)/15);
		 });
	  });
	 
	  $("#tab2").on('click',function(){
		 $("#content").text('');
		 $("#content").append("<br><input type='text' id='weight' class='forkacl'>kg&nbsp&nbspX&nbsp&nbsp<input type='text' id='time' value='10' class='forkacl'>분&nbsp&nbsp=<input type='text' id='kacl' readonly='readonly' class='forkacl'>kacl");
		 $("#content").append("<div><img src='./resources/main/images/ANY_stair.gif' style='width:20%; height:20%;'></div>");
		 
		 $('#weight').keyup(function(){
			var weight=$('#weight').val();
			var time=$('#time').val();
				
			$('#kacl').val((weight*time)/8.1);
	     });
		 
	 	 $('#time').keyup(function(){
			var weight=$('#weight').val();
			var time=$('#time').val();
					
			$('#kacl').val((weight*time)/8.1);
		 });
	  });

	  $("#tab3").on('click',function(){
		 $("#content").text('');
		 $("#content").append("<br><input type='text' id='weight' class='forkacl'>kg&nbsp&nbspX&nbsp&nbsp<input type='text' id='time' value='10' class='forkacl'>분&nbsp&nbsp=<input type='text' id='kacl' readonly='readonly' class='forkacl'>kacl");
		 $("#content").append("<div><img src='./resources/main/images/ANY_climb.gif' style='width:20%; height:20%;'></div>");
		 
		 $('#weight').keyup(function(){
			var weight=$('#weight').val();
			var time=$('#time').val();
				
			$('#kacl').val((weight*time)/7.1);
		 });
		 
		 $('#time').keyup(function(){
			var weight=$('#weight').val();
			var time=$('#time').val();
					
			$('#kacl').val((weight*time)/7.1);
		 });
	 });
	  
	 $("#tab4").on('click',function(){
		 $("#content").text('');
		 $("#content").append("<br><input type='text' id='weight' class='forkacl'>kg&nbsp&nbspX&nbsp&nbsp<input type='text' id='time' value='10' class='forkacl'>분&nbsp&nbsp=<input type='text' id='kacl' readonly='readonly' class='forkacl'>kacl");
		 $("#content").append("<div><img src='./resources/main/images/ANY_swim.gif' style='width:20%; height:20%; background:url(./resources/main/images/sp_bg_swim.png);'></div>");
		 
		 $('#weight').keyup(function(){
			var weight=$('#weight').val();
			var time=$('#time').val();
				
			$('#kacl').val((weight*time)/6.3);
		 });
		 
		 $('#time').keyup(function(){
			var weight=$('#weight').val();
			var time=$('#time').val();
					
			$('#kacl').val((weight*time)/6.3);
		 });
	 });
	 
	 $("#tab5").on('click',function(){
		 $("#content").text('');
		 $("#content").append("<br><input type='text' id='weight' class='forkacl'>kg&nbsp&nbspX&nbsp&nbsp<input type='text' id='time' value='10' class='forkacl'>분&nbsp&nbsp=<input type='text' id='kacl' readonly='readonly' class='forkacl'>kacl");
		 $("#content").append("<div><img src='./resources/main/images/ANY_yoga.gif' style='width:20%; height:20%;'></div>");
		 
		 $('#weight').keyup(function(){
			var weight=$('#weight').val();
			var time=$('#time').val();
				
			$('#kacl').val((weight*time)/23);
		 });
		 
		 $('#time').keyup(function(){
			var weight=$('#weight').val();
			var time=$('#time').val();
					
			$('#kacl').val((weight*time)/23);
		 });
	 });
	 
	 $("#tab6").on('click',function(){
		 $("#content").text('');
		 $("#content").append("<br><input type='text' id='weight' class='forkacl'>kg&nbsp&nbspX&nbsp&nbsp<input type='text' id='time' value='10' class='forkacl'>분&nbsp&nbsp=<input type='text' id='kacl' readonly='readonly' class='forkacl'>kacl");
		 $("#content").append("<div><img src='./resources/main/images/ANY_boxing.gif' style='width:20%; height:20%;'></div>");
		 
		 $('#weight').keyup(function(){
			var weight=$('#weight').val();
			var time=$('#time').val();
				
			$('#kacl').val((weight*time)/5.7);
		 });
		 
		 $('#time').keyup(function(){
			var weight=$('#weight').val();
			var time=$('#time').val();
					
			$('#kacl').val((weight*time)/5.7);
		 });
	 });
	 
	 $("#tab7").on('click',function(){
		 $("#content").text('');
		 $("#content").append("<br><input type='text' id='weight' class='forkacl'>kg&nbsp&nbspX&nbsp&nbsp<input type='text' id='time' value='10' class='forkacl'>분&nbsp&nbsp=<input type='text' id='kacl' readonly='readonly' class='forkacl'>kacl");
		 $("#content").append("<div><img src='./resources/main/images/ANY_pjump.gif' style='width:20%; height:20%;'></div>");
		 
		 $('#weight').keyup(function(){
			var weight=$('#weight').val();
			var time=$('#time').val();
				
			$('#kacl').val((weight*time)/5.7);
		 });
		 
		 $('#time').keyup(function(){
			var weight=$('#weight').val();
			var time=$('#time').val();
					
			$('#kacl').val((weight*time)/5.7);
		 });
	 });
	 
	 $("#tab8").on('click',function(){
		 $("#content").text('');
		 $("#content").append("<br><input type='text' id='weight' class='forkacl'>kg&nbsp&nbspX&nbsp&nbsp<input type='text' id='time' value='10' class='forkacl'>분&nbsp&nbsp=<input type='text' id='kacl' readonly='readonly' class='forkacl'>kacl");
		 $("#content").append("<div><img src='./resources/main/images/ANY_bike.gif' style='width:20%; height:20%;'></div>");
		 
		 $('#weight').keyup(function(){
			var weight=$('#weight').val();
			var time=$('#time').val();
				
			$('#kacl').val((weight*time)/7.1);
		 });
		 
		 $('#time').keyup(function(){
			var weight=$('#weight').val();
			var time=$('#time').val();
					
			$('#kacl').val((weight*time)/7.1);
		 });
	 });
	 
	 $("#tab9").on('click',function(){
		 $("#content").text('');
		 $("#content").append("<br><input type='text' id='weight' class='forkacl'>kg&nbsp&nbspX&nbsp&nbsp<input type='text' id='time' value='10' class='forkacl'>분&nbsp&nbsp=<input type='text' id='kacl' readonly='readonly' class='forkacl'>kacl");
		 $("#content").append("<div><img src='./resources/main/images/ANY_run.gif' style='width:20%; height:20%;'></div>");
		 
		 $('#weight').keyup(function(){
			var weight=$('#weight').val();
			var time=$('#time').val();
				
			$('#kacl').val((weight*time)/8.1);
		 });
		 
		 $('#time').keyup(function(){
			var weight=$('#weight').val();
			var time=$('#time').val();
					
			$('#kacl').val((weight*time)/8.1);
		 });
	 });
	 
	 $("#tab10").on('click',function(){
		 $("#content").text('');
		 $("#content").append("<br><input type='text' id='weight' class='forkacl'>kg&nbsp&nbspX&nbsp&nbsp<input type='text' id='time' value='10' class='forkacl'>분&nbsp&nbsp=<input type='text' id='kacl' readonly='readonly' class='forkacl'>kacl");
		 $("#content").append("<div><img src='./resources/main/images/ANY_psquat.gif' style='width:20%; height:20%;'></div>");
		 
		 $('#weight').keyup(function(){
			var weight=$('#weight').val();
			var time=$('#time').val();
				
			$('#kacl').val((weight*time)/8.1);
		 });
		 
		 $('#time').keyup(function(){
			var weight=$('#weight').val();
			var time=$('#time').val();
					
			$('#kacl').val((weight*time)/8.1);
		 });
	 });
	 
	 $("#tab11").on('click',function(){
		 $("#content").text('');
		 $("#content").append("<br><input type='text' id='weight' class='forkacl'>kg&nbsp&nbspX&nbsp&nbsp<input type='text' id='time' value='10' class='forkacl'>분&nbsp&nbsp=<input type='text' id='kacl' readonly='readonly' class='forkacl'>kacl");
		 $("#content").append("<div><img src='./resources/main/images/ANY_pbike.gif' style='width:20%; height:20%;'></div>");
		 
		 $('#weight').keyup(function(){
			var weight=$('#weight').val();
			var time=$('#time').val();
				
			$('#kacl').val((weight*time)/8.1);
		 });
		 
		 $('#time').keyup(function(){
			var weight=$('#weight').val();
			var time=$('#time').val();
					
			$('#kacl').val((weight*time)/8.1);
		 });
	 });
	 
	 $("#tab12").on('click',function(){
		 $("#content").text('');
		 $("#content").append("<br><input type='text' id='weight' class='forkacl'>kg&nbsp&nbspX&nbsp&nbsp<input type='text' id='time' value='10' class='forkacl'>분&nbsp&nbsp=<input type='text' id='kacl' readonly='readonly' class='forkacl'>kacl");
		 $("#content").append("<div><img src='./resources/main/images/ANY_tennis.gif' style='width:20%; height:20%;'></div>");
		 
		 $('#weight').keyup(function(){
			var weight=$('#weight').val();
			var time=$('#time').val();
				
			$('#kacl').val((weight*time)/4.7);
		 });
		 
		 $('#time').keyup(function(){
			var weight=$('#weight').val();
			var time=$('#time').val();
					
			$('#kacl').val((weight*time)/4.7);
		 });
	 });
	 
	 $("#tab13").on('click',function(){
		 $("#content").text('');
		 $("#content").append("<br><input type='text' id='weight' class='forkacl'>kg&nbsp&nbspX&nbsp&nbsp<input type='text' id='time' value='10' class='forkacl'>분&nbsp&nbsp=<input type='text' id='kacl' readonly='readonly' class='forkacl'>kacl");
		 $("#content").append("<div><img src='./resources/main/images/ANY_hula.gif' style='width:20%; height:20%;'></div>");
		 
		 $('#weight').keyup(function(){
			var weight=$('#weight').val();
			var time=$('#time').val();
				
			$('#kacl').val((weight*time)/14.2);
		 });
		 
		 $('#time').keyup(function(){
			var weight=$('#weight').val();
			var time=$('#time').val();
					
			$('#kacl').val((weight*time)/14.2);
		 });
	 });
	 
	 $("#tab14").on('click',function(){
		 $("#content").text('');
		 $("#content").append("<br><input type='text' id='weight' class='forkacl'>kg&nbsp&nbspX&nbsp&nbsp<input type='text' id='time' value='10' class='forkacl'>분&nbsp&nbsp=<input type='text' id='kacl' readonly='readonly' class='forkacl'>kacl");
		 $("#content").append("<div><img src='./resources/main/images/ANY_pwalk.gif' style='width:20%; height:20%;'></div>");
		 
		 $('#weight').keyup(function(){
			var weight=$('#weight').val();
			var time=$('#time').val();
				
			$('#kacl').val((weight*time)/5.4);
		 });
		 
		 $('#time').keyup(function(){
			var weight=$('#weight').val();
			var time=$('#time').val();
					
			$('#kacl').val((weight*time)/5.4);
		 });
	 });
	 
	 $("#tab15").on('click',function(){
		 $("#content").text('');
		 $("#content").append("<br><input type='text' id='weight' class='forkacl'>kg&nbsp&nbspX&nbsp&nbsp<input type='text' id='time' value='10' class='forkacl'>분&nbsp&nbsp=<input type='text' id='kacl' readonly='readonly' class='forkacl'>kacl");
		 $("#content").append("<div><img src='./resources/main/images/ANY_paerobic.gif' style='width:20%; height:20%;'></div>");
		 
		 $('#weight').keyup(function(){
			var weight=$('#weight').val();
			var time=$('#time').val();
				
			$('#kacl').val((weight*time)/9.5);
		 });
		 
		 $('#time').keyup(function(){
			var weight=$('#weight').val();
			var time=$('#time').val();
					
			$('#kacl').val((weight*time)/9.5);
		 });
	 });
	 
	 $("#tab16").on('click',function(){
		 $("#content").text('');
		 $("#content").append("<br><input type='text' id='weight' class='forkacl'>kg&nbsp&nbspX&nbsp&nbsp<input type='text' id='time' value='10' class='forkacl'>분&nbsp&nbsp=<input type='text' id='kacl' readonly='readonly' class='forkacl'>kacl");
		 $("#content").append("<div><img src='./resources/main/images/ANY_psitup.gif' style='width:20%; height:20%;'></div>");
		 
		 $('#weight').keyup(function(){
			var weight=$('#weight').val();
			var time=$('#time').val();
				
			$('#kacl').val((weight*time)/7.1);
		 });
		 
		 $('#time').keyup(function(){
			var weight=$('#weight').val();
			var time=$('#time').val();
					
			$('#kacl').val((weight*time)/7.1);
		 });
	 });
	 
	 $('#tab1').trigger('click');
	 
	 $('#addActivity').on('click',function(){
		 if($('#addActDay').val().length==0){
			alert('날짜를 선택해 주세요.');
			return false;
		 }
		 
		 if(isNaN($('#kacl').val())||$('#kacl').val().length==0||$('#kacl').val()==0){
			alert('숫자가 아닌 값이 입력되어 있거나 입력할 값이 없습니다.');
			return false;
		 }else{
			$.ajax({
				url:'addKacl'
				,type:'post'
				,data:{
					"countday":$('#addActDay').val(),
					"act":$('.tab:checked').val(),
					"kacl":$('#kacl').val()
				}
				,success: function (data){
					if(data=="success"){
						alert("활동이 입력 되었습니다.");
					}else{
						alert("입력에 실패 했습니다.");
					}
				}
		    });	
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
