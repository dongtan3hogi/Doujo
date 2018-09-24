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
  <!-- Theme style -->
  <link rel="stylesheet" href="resources/main/dist/css/AdminLTE.min.css">
  <!-- AdminLTE Skins. Choose a skin from the css/skins folder instead of downloading all of them to reduce the load. -->
  <link rel="stylesheet" href="resources/main/dist/css/skins/_all-skins.min.css">
  <!-- Google Font -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
  <link rel="stylesheet" href="./resources/style/profile.css">
  <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

 <style type="text/css">
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
	                <h3 class="box-title">My Nutrition</h3>
          </div>
      	  <form action="gotoNutrition" method="get">
    	  <input type="submit" class="btn btn-Danger" value="今日の栄養情報の表示">
    	  </form>
    	  <form action="showWeekNut" method="post">
    	  <input type="hidden" value="${countday}" name="countday">
    	  <input type="submit" class="btn btn-Danger" value="今週栄養情報の表示">
    	  </form>
    	  <form action="showMonthNut" method="post">
    	  <input type="hidden" value="${countday}" name="countday">
    	  <input type="submit" class="btn btn-Danger" 	value="今月栄養情報の表示">
    	  </form>	
    	  <div class="box">
            <div class="box-header">
              <h3 class="box-title">${countday}の栄養情報</h3>
            </div>
            <!-- /.box-header -->
            <div class="box-body no-padding">
              <c:if test="${mynut!=null}">
              <table class="table table-striped">
                <tr>
                  <th style="width: 5%;">順番</th>
                  <th style="width: 15%;">栄養素</th>
                  <th style="width: 70%;">1日、推奨量対比の摂取率</th>
                  <th style="width: 10%">栄養状態</th>
                </tr>
                <tr>
                  <td>1.</td>
                  <td>カロリー</td>
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
                  <td>カーボハイドレート</td>
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
                  <td>たんぱく質</td>
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
                  <td>ファット</td>
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
                  <td>糖類</td>
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
                  <td>ナトリウム</td>
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
                  <td>コレステロール</td>
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
                  <td>飽和脂肪酸</td>
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
                  <td>トランス脂肪酸</td>
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
             	<div align="center"><h3>入力された今日の献立表が存在しません.</h3></div>
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

<!-- Page specific script -->
<script>
  $(function () {
	  
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
