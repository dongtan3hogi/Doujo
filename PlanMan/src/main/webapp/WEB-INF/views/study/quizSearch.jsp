<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Welcome PlanMan</title>
<!-- Tell the browser to be responsive to screen width -->
<meta
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
	name="viewport">
<!-- Bootstrap 3.3.7 -->
<link rel="stylesheet"
	href="resources/main/bower_components/bootstrap/dist/css/bootstrap.min.css">
<!-- Font Awesome -->
<link rel="stylesheet"
	href="resources/main/bower_components/font-awesome/css/font-awesome.min.css">
<!-- Ionicons -->
<link rel="stylesheet"
	href="resources/main/bower_components/Ionicons/css/ionicons.min.css">
<!-- fullCalendar -->
<link rel="stylesheet"
	href="resources/main/bower_components/fullcalendar/dist/fullcalendar.min.css">
<link rel="stylesheet"
	href="resources/main/bower_components/fullcalendar/dist/fullcalendar.print.min.css"
	media="print">
<!-- Theme style -->
<link rel="stylesheet" href="resources/main/dist/css/AdminLTE.min.css">
<!-- AdminLTE Skins. Choose a skin from the css/skins folder instead of downloading all of them to reduce the load. -->
<link rel="stylesheet"
	href="resources/main/dist/css/skins/_all-skins.min.css">
<!-- Google Font -->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">

<!-- head -->
</head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript"> 
 
 
</script>
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
		<!-- ========================================================================================================== -->
		<!-- ========================================================================================================== -->
		<!-- ========================================================================================================== -->


		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			<div id="fortheprofilediv"></div>
			<!-- Content Header (Page header) -->
			<section class="content-header">
				<h1>
					Study <small>Quiz room</small>
				</h1>
				<ol class="breadcrumb">
					<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
					<li class="active">study</li>
				</ol>
			</section>

			<!-- Main content -->
			<section class="content">
				<div class="row">
					<div class="col-md-4">
						<div class="box box-info">
							<div class="box-header with-border">
								<h3 class="box-title">STUDY</h3>

								<div class="box-tools">
									<button type="button" class="btn btn-box-tool"
										data-widget="collapse">
										<i class="fa fa-minus"></i>
									</button>
								</div>
							</div>
							<div class="box-body no-padding">
								<ul class="nav nav-pills nav-stacked">
									<ul class="nav nav-pills nav-stacked">
										<li><a href="gotoQuiz"><i class="fa fa-file-text-o"></i>QUIZ SOLVE</a></li>
										<li><a href="gotoQuizSearch"><i class="fa fa-envelope-o"></i>QUIZ SEARCH</a></li> 
              							<li><a href="gotoQuizMake"><i class="fa fa-envelope-o"></i>QUIZ MAKE</a></li> 
									</ul>
								</ul>
							</div>
							<!-- /.box-body -->
						</div>
						<!-- /. box -->
					</div>
					<!-- /.col -->
					
					
		<div class="col-md-8">
          <div class="box box-info">
            <div class="box-header">
              <h3 class="box-title">Quiz Search</h3>

              <div class="box-tools">
                <div class="input-group input-group-sm" style="width: 150px;">
                  <input type="text" name="table_search" class="form-control pull-right" placeholder="Search">

                  <div class="input-group-btn">
                    <button type="submit" class="btn btn-default"><i class="fa fa-search"></i></button>
                  </div>
                </div>
              </div>
            </div>
            <!-- /.box-header -->
            <div class="box-body no-padding">
                  <ul class="users-list clearfix">
                  <c:forEach var="RList" items="${searchResultList}">
                    <li>
                      <img src="resources/userData/image/${RList.ID}.jpg" alt="none" onError="this.src='resources/userData/image/unknown.png';" style="width:80px;height:80px;">
                      <a class="users-list-name" href="doTakeQuizMyFolder?friendId=${RList.ID}&title=${RList.TITLE}">${RList.TITLE}</a>
                      <span class="users-list-date">${RList.ID}</span>
                    </li>
                  </c:forEach>
                    
                    
                  </ul>
                  <!-- /.users-list -->
                </div>
                
	            <!-- /.box-body -->
	            <div class="box-footer clearfix">
	              <ul class="pagination pagination-sm no-margin pull-right">
	                <li><a href="gotoQuizSearch?page=${page-1}&search=${search}">«</a></li>
	                <c:forEach begin="${navi.startPageGroup}" end="${navi.endPageGroup}" step="1" varStatus="status">
	                    <li><a href="gotoQuizSearch?page=${navi.startPageGroup+status.count-1}">${navi.startPageGroup+status.count-1}	</a></li>
	                </c:forEach>
	                <li><a href="gotoQuizSearch?page=${page+1}&search=${search}">»</a></li>
	              </ul>
	            </div>
	          </div>
	          <!-- /.box -->
        
					
					
			</div>
			<!-- /.col -->
		</div>
		<!-- /.row -->
	</section>
	<!-- /.content -->
		
	<!-- ========================================================================================================== -->
	<!-- ========================================================================================================== -->
	<!-- ========================================================================================================== -->
	<!-- ========================================================================================================== -->
	<!-- ========================================================================================================== -->
	<!-- ========================================================================================================== -->

		
	</div>
	<!-- /.content-wrapper -->
	
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
	<script
		src="resources/main/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
	<!-- jQuery UI 1.11.4 -->
	<script
		src="resources/main/bower_components/jquery-ui/jquery-ui.min.js"></script>
	<!-- Slimscroll -->
	<script
		src="resources/main/bower_components/jquery-slimscroll/jquery.slimscroll.min.js"></script>
	<!-- FastClick -->
	<script
		src="resources/main/bower_components/fastclick/lib/fastclick.js"></script>
	<!-- AdminLTE App -->
	<script src="resources/main/dist/js/adminlte.min.js"></script>
	<!-- AdminLTE for demo purposes -->
	<script src="resources/main/dist/js/demo.js"></script>
	<!-- fullCalendar -->
	<script src="resources/main/bower_components/moment/moment.js"></script>
	<script
		src="resources/main/bower_components/fullcalendar/dist/fullcalendar.min.js"></script>
	
	<!-- Page specific script -->
	<script type="text/javascript" src="<c:url value="/resources/study/sockjs-0.3.4.js"/>"></script>
	<script type="text/javascript">

    var sock;

    //웸소켓을 지정한 url로 연결한다.
    sock = new SockJS("<c:url value="/echo2"/>");
    
	</script>
	<script src="resources/main/js/messageBar.js"></script> 
</body>
</html>
