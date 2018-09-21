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
     
     form{
     	display: inline;
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
				<i class="fa fa-camera upload-button"></i>
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
        <small>${sessionScope.member.id}님의 스케쥴 / <span id="clock"></span><c:if test="${sessionScope.eventtitle!=null}"> / 지금 일정: ${sessionScope.eventtitle}</c:if></small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active">Health</li>
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
      	<div class="col-md-12">
          <div class="box box-danger">
      	  <div class="box-header">
              		<i class="fa fa-fw fa fa-heartbeat" style="color: #dd4b39"></i>
	                <h3 class="box-title">My Nutrition</h3>
          </div>
      	  <form action="gotoNutrition" method="get">
    	  <input type="submit" class="btn btn-Danger" value="오늘의 영양정보 보기">
    	  </form>
    	  <form action="showWeekNut" method="post">
    	  <input type="hidden" value="${countday}" name="countday">
    	  <input type="submit" class="btn btn-Danger" value="이번주 영양정보 보기">
    	  </form>
    	  <form action="showMonthNut" method="post">
    	  <input type="hidden" value="${countday}" name="countday">
    	  <input type="submit" class="btn btn-Danger" 	value="이번달 영양정보 보기">
    	  </form>	
    	  <div class="box">
            <div class="box-header">
              <h3 class="box-title">이번주 영양정보</h3>
            </div>
            <!-- /.box-header -->
            <div class="box-body no-padding">
              <c:if test="${mynut!=null}">
              <table class="table table-striped">
                <tr>
                  <th style="width: 5%;">순번</th>
                  <th style="width: 15%;">영양소</th>
                  <th style="width: 70%;">1일 권장량 대비 섭취율</th>
                  <th style="width: 10%">영양상태</th>
                </tr>
                <tr>
                  <td>1.</td>
                  <td>칼로리</td>
                  <td>
                    <div class="progress progress-xs">
                      <c:if test="${mynut.kacl<=100}"><div class="progress-bar progress-bar-success" style="width: ${mynut.kacl}%"></div></c:if>
                      <c:if test="${mynut.kacl>100}"><div class="progress-bar progress-bar-danger" style="width: ${mynut.kacl}%"></div></c:if>
                    </div>
                  </td>
                  <td>
                  	<c:if test="${mynut.kacl<=100}"><span class="badge bg-green">${mynut.kacl}%</span></c:if>
                  	<c:if test="${mynut.kacl>100}"><span class="badge bg-red">Danger/${mynut.kacl}%</span></c:if>
                  </td>
                </tr>
                <tr>
                  <td>2.</td>
                  <td>탄수화물</td>
                  <td>
                    <div class="progress progress-xs">
                      <c:if test="${mynut.carbo<=100}"><div class="progress-bar progress-bar-success" style="width: ${mynut.carbo}%"></div></c:if>
                      <c:if test="${mynut.carbo>100}"><div class="progress-bar progress-bar-danger" style="width: ${mynut.carbo}%"></div></c:if>
                    </div>
                  </td>
                  <td>
                  	<c:if test="${mynut.carbo<=100}"><span class="badge bg-green">${mynut.carbo}%</span></c:if>
                  	<c:if test="${mynut.carbo>100}"><span class="badge bg-red">Danger/${mynut.carbo}%</span></c:if>
                  </td>
                </tr>
                <tr>
                  <td>3.</td>
                  <td>단백질</td>
                  <td>
                    <div class="progress progress-xs progress-striped active">
                     <c:if test="${mynut.protein<=100}"><div class="progress-bar progress-bar-success" style="width: ${mynut.protein}%"></div></c:if>
                     <c:if test="${mynut.protein>100}"><div class="progress-bar progress-bar-danger" style="width: ${mynut.protein}%"></div></c:if>
                    </div>
                  </td>
                  <td>
                  	<c:if test="${mynut.protein<=100}"><span class="badge bg-green">${mynut.protein}%</span></c:if>
                  	<c:if test="${mynut.protein>100}"><span class="badge bg-red">Danger/${mynut.protein}%</span></c:if>
                  </td>
                </tr>
                <tr>
                  <td>4.</td>
                  <td>지방</td>
                  <td>
                    <div class="progress progress-xs progress-striped active">
                     <c:if test="${mynut.fat<=100}"><div class="progress-bar progress-bar-success" style="width: ${mynut.fat}%"></div></c:if>
                     <c:if test="${mynut.fat>100}"><div class="progress-bar progress-bar-danger" style="width: ${mynut.fat}%"></div></c:if>
                    </div>
                  </td>
                  <td>
                  	<c:if test="${mynut.fat<=100}"><span class="badge bg-green">${mynut.fat}%</span></c:if>
                  	<c:if test="${mynut.fat>100}"><span class="badge bg-red">Danger/${mynut.fat}%</span></c:if>
                  </td>
                </tr>
                <tr>
                  <td>5.</td>
                  <td>당류</td>
                  <td>
                    <div class="progress progress-xs">
                     <c:if test="${mynut.sugar<=100}"><div class="progress-bar progress-bar-success" style="width: ${mynut.sugar}%"></div></c:if>
                     <c:if test="${mynut.sugar>100}"><div class="progress-bar progress-bar-danger" style="width: ${mynut.sugar}%"></div></c:if>
                    </div>
                  </td>
                  <td>
                  	<c:if test="${mynut.sugar<=100}"><span class="badge bg-green">${mynut.sugar}%</span></c:if>
                  	<c:if test="${mynut.sugar>100}"><span class="badge bg-red">Danger/${mynut.sugar}%</span></c:if>
                  </td>
                </tr>
                <tr>
                  <td>6.</td>
                  <td>나트륨</td>
                  <td>
                    <div class="progress progress-xs">
                     <c:if test="${mynut.sodium<=100}"><div class="progress-bar progress-bar-success" style="width: ${mynut.sodium}%"></div></c:if>
                     <c:if test="${mynut.sodium>100}"><div class="progress-bar progress-bar-danger" style="width: ${mynut.sodium}%"></div></c:if>
                    </div>
                  </td>
                  <td>
                  	<c:if test="${mynut.sodium<=100}"><span class="badge bg-green">${mynut.sodium}%</span></c:if>
                  	<c:if test="${mynut.sodium>100}"><span class="badge bg-red">Danger/${mynut.sodium}%</span></c:if>
                  </td>
                </tr>
                <tr>
                  <td>7.</td>
                  <td>콜레스테롤</td>
                  <td>
                    <div class="progress progress-xs progress-striped active">
                     <c:if test="${mynut.cholesterol<=100}"><div class="progress-bar progress-bar-success" style="width: ${mynut.cholesterol}%"></div></c:if>
                     <c:if test="${mynut.cholesterol>100}"><div class="progress-bar progress-bar-danger" style="width: ${mynut.cholesterol}%"></div></c:if>
                    </div>
                  </td>
                  <td>
                  	<c:if test="${mynut.cholesterol<=100}"><span class="badge bg-green">${mynut.cholesterol}%</span></c:if>
                  	<c:if test="${mynut.cholesterol>100}"><span class="badge bg-red">Danger/${mynut.cholesterol}%</span></c:if>
                  </td>
                </tr>
                <tr>
                  <td>8.</td>
                  <td>불포화지방</td>
                  <td>
                    <div class="progress progress-xs progress-striped active">
                     <c:if test="${mynut.fatty<=100}"><div class="progress-bar progress-bar-success" style="width: ${mynut.fatty}%"></div></c:if>
                     <c:if test="${mynut.fatty>100}"><div class="progress-bar progress-bar-danger" style="width: ${mynut.fatty}%"></div></c:if>
                    </div>
                  </td>
                  <td>
                  	<c:if test="${mynut.fatty<=100}"><span class="badge bg-green">${mynut.fatty}%</span></c:if>
                  	<c:if test="${mynut.fatty>100}"><span class="badge bg-red">Danger/${mynut.fatty}%</span></c:if>
                  </td>
                </tr>
                <tr>
                  <td>9.</td>
                  <td>트랜스지방</td>
                  <td>
                    <div class="progress progress-xs progress-striped active">
                     <c:if test="${mynut.transfat<=100}"><div class="progress-bar progress-bar-success" style="width: ${mynut.transfat}%"></div></c:if>
                     <c:if test="${mynut.transfat>100}"><div class="progress-bar progress-bar-danger" style="width: ${mynut.transfat}%"></div></c:if>
                    </div>
                  </td>
                  <td>
                  	<c:if test="${mynut.transfat<=100}"><span class="badge bg-green">${mynut.transfat}%</span></c:if>
                  	<c:if test="${mynut.transfat>100}"><span class="badge bg-red">Danger/${mynut.transfat}%</span></c:if>
                  </td>
                </tr>
              </table>
              </c:if>
              <c:if test="${mynut==null}">
             	<div align="center"><h3>입력된 이번주 식단표가 존재하지 않습니다.</h3></div>
              </c:if>
            </div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->
       
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
	  
	  showtime();
	  
	  
	  setInterval(function(){
		  showtime();
	  },60000);
	  
	  
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
