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
  <link rel="stylesheet" href="./resources/style/profile.css">
  <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
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
    <a href="gotoCalendar" class="logo">
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
              <img src="./resources/userData/image/${sessionScope.member.id}.jpg" class="user-image" id="profileImg" onError="this.src='./resources/userData/image/unknown.png;'">
              <span class="hidden-xs">${sessionScope.member.id}</span>
            </a>
            <ul class="dropdown-menu">
              <!-- User image -->
              <li class="user-header">
                <img src="./resources/userData/image/${sessionScope.member.id}.jpg" class="img-circle" id="profileImg" onError="this.src='./resources/userData/image/unknown.png;'">
				
                <p>
                  ${sessionScope.member.id}
                  <small>${sessionScope.member.nickname}</small>
                </p>
              </li>
              
              <!-- Menu Footer-->
              <li class="user-footer">
                <div align="center">
                  <a href="gotoupdate" class="btn btn-primary btn-flat">My Page</a>
                  <a class="btn btn-primary btn-flat" onclick="profileImgBtn()">Profile</a>
                  <a href="gotologout" class="btn btn-primary btn-flat">Log Out</a>
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
          <img src="./resources/userData/image/${sessionScope.member.id}.jpg" class="img-circle" onError="this.src='./resources/userData/image/unknown.png;'">
        </div>
        <div class="pull-left info">
          <p>${sessionScope.member.id}</p>
          <a href="#"><i class="fa fa-circle text-success"></i> Online</a>
        </div>
      </div>

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
            <li><a href="goWC"><i class="fa fa-circle-o text-yellow"></i>Word Cloud</a></li>      
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
            <li><a href="gotoShowHospital"><i class="fa fa-circle-o text-red"></i> Hospital&Pharmacy</a></li>
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
            <li><a href="friendSchedule"><i class="fa fa-circle-o text-green"></i>Friend Schedule</a></li>
            <li><a href="friend3"><i class="fa fa-circle-o text-green"></i>Place Recommend</a></li>
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
    <div id="fortheprofilediv"></div>
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        Health
        <small>${sessionScope.member.id}のスケジュール / <span id="clock"></span><c:if test="${sessionScope.eventtitle!=null}"> / 今の日程: ${sessionScope.eventtitle}</c:if></small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active">Health</li>
      </ol>
    </section>
	
	
    <!-- Main content -->
    <section class="content">
      <div class="row">
      	<div class="col-md-12">	
          
          
      	<div class="box box-danger">
	      	<div class="box-header">
	              		<i class="fa fa-fw fa fa-heartbeat" style="color: #dd4b39"></i>
		                <h3 class="box-title">Add Activity</h3>
	        </div>
	    	<div align="right">
	    		日付選択&nbsp:&nbsp<input type="text" style="width: 150px;" class="datepicker" name="countday" id="addActDay" >&nbsp
	    		<input type="button" class="btn btn-Danger" id="addActivity" value="活動入力" style="margin-right: 10px;">
	    	</div>
	    	<br/>
	    	<div id="actType">
			 	<input id="tab1" value="歩き" type="radio" name="tabs" class="tab">
			 	<label for="tab1">歩き</label>
			 	<input id="tab2" value="階段" type="radio" name="tabs" class="tab">
			 	<label for="tab2">階段</label>
			 	<input id="tab3" value="登山" type="radio" name="tabs" class="tab">
			 	<label for="tab3">登山</label>
			 	<input id="tab4" value="水泳" type="radio" name="tabs" class="tab">
			 	<label for="tab4">水泳</label>
			 	<input id="tab5" value="ヨガ" type="radio" name="tabs" class="tab">
			 	<label for="tab5">ヨガ</label>
			 	<input id="tab6" value="ボクシング" type="radio" name="tabs" class="tab">
			 	<label for="tab6">ボクシング</label>
			 	<input id="tab7" value="縄飛び" type="radio" name="tabs" class="tab">
			 	<label for="tab7">縄飛び</label>
			 	<input id="tab8" value="自転車" type="radio" name="tabs" class="tab">
			 	<label for="tab8">自転車</label>
			 	<input id="tab9" value="ランニング" type="radio" name="tabs" class="tab">
			 	<label for="tab9">ランニング</label>
			 	<input id="tab10" value="スクワット" type="radio" name="tabs" class="tab">
			 	<label for="tab10">スクワット</label>
			 	<input id="tab11" value="サイクル" type="radio" name="tabs" class="tab">
			 	<label for="tab11">サイクル</label>
			 	<input id="tab12" value="スカッシュ" type="radio" name="tabs" class="tab">
			 	<label for="tab12">スカッシュ</label>
			 	<input id="tab13" value="フラフープ" type="radio" name="tabs" class="tab">
			 	<label for="tab13">フラフープ</label>
			 	<input id="tab14" value="ランニングマシン" type="radio" name="tabs" class="tab">
			 	<label for="tab14">ランニングマシン</label>
			 	<input id="tab15" value="ランニングマシン" type="radio" name="tabs" class="tab">
			 	<label for="tab15">ランニングマシン</label>
			 	<input id="tab16" value="シットアップ" type="radio" name="tabs" class="tab">
			 	<label for="tab16">シットアップ</label>
			</div>
			
			<div id="content" align="center" class="t">
			<!--  	<br><input type="text" id="weight" class="forkacl">kg&nbsp&nbspX&nbsp&nbsp<input type="text" id="time" value="10" class="forkacl">분&nbsp&nbsp=<input type="text" id="kacl" readonly="readonly" class="forkacl">kacl
				<div><img src="./resources/main/images/sp_pwalk.png" style="width:80%; height:250px;"></div>-->
			</div>
		
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

</div>
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
		 $('#weight').val(${sessionScope.member.weight});

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
		 $('#weight').val(${sessionScope.member.weight});
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
		 $('#weight').val(${sessionScope.member.weight});
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
		 $('#weight').val(${sessionScope.member.weight});
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
		 $('#weight').val(${sessionScope.member.weight});
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
		 $('#weight').val(${sessionScope.member.weight});
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
		 $('#weight').val(${sessionScope.member.weight});
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
		 $('#weight').val(${sessionScope.member.weight});
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
		 $('#weight').val(${sessionScope.member.weight});
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
		 $('#weight').val(${sessionScope.member.weight});
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
		 $('#weight').val(${sessionScope.member.weight});
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
		 $('#weight').val(${sessionScope.member.weight});
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
		 $('#weight').val(${sessionScope.member.weight});
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
		 $('#weight').val(${sessionScope.member.weight});
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
		 $('#weight').val(${sessionScope.member.weight});
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
		 $('#weight').val(${sessionScope.member.weight});
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
			alert('日付を選択してください.');
			return false;
		 }
		 
		 if(isNaN($('#kacl').val())||$('#kacl').val().length==0||$('#kacl').val()==0){
			alert('数字以外の値が入力されていたり、入力する値がありません.');
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
						alert("活動が入力されました.");
					}else{
						alert("入力に失敗しました.");
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
