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
        <ul class="nav navbar-nav">
          <!-- Tasks: style can be found in dropdown.less -->
          <li class="dropdown tasks-menu">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
              <i class="fa fa-flag-o"></i>
              <span class="label label-danger">9</span>
            </a>
            <ul class="dropdown-menu">
              <li class="header">You have 9 tasks</li>
              <li>
                <!-- inner menu: contains the actual data -->
                <ul class="menu">
                  <li><!-- Task item -->
                    <a href="#">
                      <h3>
                        Study
                        <small class="pull-right">80%</small>
                      </h3>
                      <div class="progress xs">
                        <div class="progress-bar progress-bar-aqua" style="width: 20%" role="progressbar"
                             aria-valuenow="20" aria-valuemin="0" aria-valuemax="100">
                          <span class="sr-only">80% Complete</span>
                        </div>
                      </div>
                    </a>
                  </li>
                  <!-- end task item -->
                  <li><!-- Task item -->
                    <a href="#">
                      <h3>
                        Health
                        <small class="pull-right">40%</small>
                      </h3>
                      <div class="progress xs">
                        <div class="progress-bar progress-bar-green" style="width: 40%" role="progressbar"
                             aria-valuenow="20" aria-valuemin="0" aria-valuemax="100">
                          <span class="sr-only">40% Complete</span>
                        </div>
                      </div>
                    </a>
                  </li>
                  <!-- end task item -->
                  <li><!-- Task item -->
                    <a href="#">
                      <h3>
                        Work
                        <small class="pull-right">60%</small>
                      </h3>
                      <div class="progress xs">
                        <div class="progress-bar progress-bar-red" style="width: 60%" role="progressbar"
                             aria-valuenow="20" aria-valuemin="0" aria-valuemax="100">
                          <span class="sr-only">60% Complete</span>
                        </div>
                      </div>
                    </a>
                  </li>
                  <!-- end task item -->
                </ul>
              </li>
              <li class="footer">
                <a href="#">View all tasks</a>
              </li>
            </ul>
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
            <i class="fa fa-edit"></i> <span>Study</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li><a href="gotoQuiz"><i class="fa fa-circle-o text-aqua"></i> Quiz</a></li>
            <li><a href="gotoQuizMake"><i class="fa fa-circle-o text-aqua"></i> Study Group</a></li>
          </ul>
        </li>
        <li class="treeview">
          <a href="#">
            <i class="fa fa-suitcase"></i> <span>Work</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li><a href=""><i class="fa fa-circle-o text-yellow"></i> Work 1</a></li>
            <li><a href=""><i class="fa fa-circle-o text-yellow"></i> Work 2</a></li>
          </ul>
        </li>
        <li class="treeview">
          <a href="#">
            <i class="fa fa-heartbeat"></i> <span>Health</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li><a href="gotoHealth"><i class="fa fa-circle-o text-red"></i> Health Main</a></li>
            <li><a href="gotoMeal"><i class="fa fa-circle-o text-red"></i> Add Meal</a></li>
            <li><a href="gotoActivity"><i class="fa fa-circle-o text-red"></i> Add Activity</a></li>
            <li><a href="gotoNutrition"><i class="fa fa-circle-o text-red"></i> My Nutrition</a></li>
            <li><a href="gotoRecommend"><i class="fa fa-circle-o text-red"></i> Recommend</a></li>
            <li><a href="gotoShowHospital"><i class="fa fa-circle-o text-red"></i> Hospital&Pharmarcy</a></li>
          </ul>
        </li>
        <li class="treeview">
          <a href="#">
            <i class="fa fa-users"></i> <span>Friend</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li><a href=""><i class="fa fa-circle-o text-green"></i> Friend 1</a></li>
            <li><a href=""><i class="fa fa-circle-o text-green"></i> Friend 2</a></li>
          </ul>
        </li>
        <!-- <li>
          <a href="widgets.html">
            <i class="fa fa-th"></i> <span>Widgets</span>
            <span class="pull-right-container">
              <small class="label pull-right bg-green">new</small>
            </span>
          </a>
        </li>  -->
        <li><a href="https://adminlte.io/docs"><i class="fa fa-book"></i> <span>홈피 css설명서</span></a></li>
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
        Add Meal
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
        	<div id="sch-button" align="right"><input type="submit" id="addMeal" style="width: 200px;" value="음식 입력하기" class="btn btn-block btn-primary" onclick="return addMealChk()"/></div>
        </div>
    </div>

    <!-- Main content -->
    <section class="content">
      <div class="row">
    	<div align="right">날짜 선택 : <input type="text" style="width: 150px;" class="datepicker" name="countday" id="addActDay" ><input type="button" class="btn btn-primary" id="addActivity" value="활동 입력하기"></div>
    	
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
		
		
      	
      	
		<div>
        
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
	  
	  showtime();
	  
	  
	  setInterval(function(){
		  showtime();
	  },60000);

	  $("#tab1").on('click',function(){
		 $("#content").text('');
		 $("#content").append("<br><input type='text' id='weight' class='forkacl'>kg&nbsp&nbspX&nbsp&nbsp<input type='text' id='time' value='10' class='forkacl'>분&nbsp&nbsp=<input type='text' id='kacl' readonly='readonly' class='forkacl'>kacl");
		 $("#content").append("<div><img src='./resources/main/images/sp_pwalk.png' style='width:80%; height:250px;'></div>");
		 
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
		 $("#content").append("<div><img src='./resources/main/images/sp_pstair.png' style='width:80%; height:250px;'></div>");
		 
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
		 $("#content").append("<div><img src='./resources/main/images/sp_pclimb.png' style='width:80%; height:250px;'></div>");
		 
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
		 $("#content").append("<div><img src='./resources/main/images/sp_pswim.png' style='width:100%; height:250px; background:url(./resources/main/images/sp_bg_swim.png);'></div>");
		 
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
		 $("#content").append("<div><img src='./resources/main/images/sp_pyoga.png' style='width:80%; height:250px;'></div>");
		 
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
		 $("#content").append("<div><img src='./resources/main/images/sp_pboxing_v2.png' style='width:80%; height:250px;'></div>");
		 
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
		 $("#content").append("<div><img src='./resources/main/images/sp_pljump.png' style='width:80%; height:250px;'></div>");
		 
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
		 $("#content").append("<div><img src='./resources/main/images/sp_pbike.png' style='width:80%; height:250px;'></div>");
		 
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
		 $("#content").append("<div><img src='./resources/main/images/sp_prun.png' style='width:80%; height:250px;'></div>");
		 
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
		 $("#content").append("<div><img src='./resources/main/images/sp_psquat.png' style='width:80%; height:250px;'></div>");
		 
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
		 $("#content").append("<div><img src='./resources/main/images/sp_pcycle.png' style='width:80%; height:250px;'></div>");
		 
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
		 $("#content").append("<div><img src='./resources/main/images/sp_psquash.png' style='width:80%; height:250px;'></div>");
		 
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
		 $("#content").append("<div><img src='./resources/main/images/sp_phhp.png' style='width:80%; height:250px;'></div>");
		 
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
		 $("#content").append("<div><img src='./resources/main/images/sp_pruning_v2.png' style='width:80%; height:250px;'></div>");
		 
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
		 $("#content").append("<div><img src='./resources/main/images/sp_paerobic.png' style='width:80%; height:250px;'></div>");
		 
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
		 $("#content").append("<div><img src='./resources/main/images/sp_psit_up.png' style='width:80%; height:250px;'></div>");
		 
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
</body>
</html>
