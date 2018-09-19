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
 
$(function(){ 
	$(document).ready(function (){ 
		$('.quiztypeinput').on("click", function(){ 
			var qt = $(this).val(); 
			if(qt == "multiplechoice"){ 
				//document.getElementById("quiztypeinput").value = "multiplechoice"; 
				document.getElementById("type").value = "multiplechoice"; 
				 
				var contentAnswerDIV = '<div>'; 
				contentAnswerDIV += '<label><input type="radio" name="answernumber" value="1" class="minimal" checked>1번'; 
				contentAnswerDIV += '</label><input type="text" class="form-control" name="answer1" id="answer1"><br/>'; 
				contentAnswerDIV += '<label><input type="radio" name="answernumber" value="2" class="minimal">2번'; 
				contentAnswerDIV += '</label><input type="text" class="form-control" name="answer2" id="answer2"><br/>'; 
				contentAnswerDIV += '<label><input type="radio" name="answernumber" value="3" class="minimal">3번'; 
				contentAnswerDIV += ' </label><input type="text" class="form-control" name="answer3" id="answer3"><br/>'; 
				contentAnswerDIV += '<label> <input type="radio" name="answernumber" value="4" class="minimal">4번'; 
				contentAnswerDIV += '</label><input type="text" class="form-control" name="answer4" id="answer4">'; 
				contentAnswerDIV += '</div>'; 
				 
				$("#answerDIV > div").remove(); 
				$("#answerDIV").append(contentAnswerDIV);		 
			} else if(qt == "shortanswer"){	 
				//document.getElementById("quiztypeinput").value = "shortanswer"; 
				document.getElementById("type").value = "shortanswer"; 
				$("#answerDIV > div").remove(); 
				$("#answerDIV").append('<div><label>정답</label><input type="text" class="form-control" name="answer1" id="answer1"></div>'); 
				 
			} 
		}); 
	}); 
}); 
 
 
function changeSelect(){ 
	var select = document.getElementById("quizrecordname").value; 
	if(select == 'new'){ 
		document.getElementById("forNewName").innerHTML = '<input type="text" class="form-control" id="newrecord" name="newrecord">'; 
	} else{ 
		document.getElementById("forNewName").innerHTML = ''; 
	} 
} 
 
function check() { 
	var q = document.getElementsByName("question")[0]; 
	var a = document.getElementsByName("answer1")[0]; 
	var selecter = document.getElementById("quizrecordname"); 
	 
	if(selecter.value == 'new' && document.getElementById("newrecord").value.length <= 0){ 
		swal("새로운 폴더명을 입력하세요."); 
		document.getElementById("newrecord").focus(); 
		document.getElementById("newrecord").select(); 
		return false; 
	} else if(q.value.length <= 0){ 
		swal("질문을 입력하세요."); 
		q.focus(); 
		q.select(); 
		return false; 
	} else if(a.value.length <= 0){ 
		swal("정답을 입력하세요."); 
		a.focus(); 
		a.select(); 
		return false; 
	} 
	 
	/* swal(a + q); */ 
	var radioVal = $('input[name="answernumber"]:checked').val(); 
	//swal(radioVal); 
	var quiz = { 
			"quizrecordname" : $("#quizrecordname").val() 
			, "newrecord" : $("#newrecord").val() 
			, "type" : $("#type").val()
			, "question" : $("#question").val() 
			, "answer1" : $("#answer1").val() 
			, "answer2" : $("#answer2").val() 
			, "answer3" : $("#answer3").val() 
			, "answer4" : $("#answer4").val() 
			, "answernumber" : radioVal 
			, "id" :  $("#id").val() 
	}; 
	/* swal("quizrecordname:" +quiz.quizrecordname + ", newrecord:" + quiz.newrecord + ", type:" + quiz.type  
			+ "\n, teg:" + quiz.teg + ", question:" + quiz.question  
			+ "\n, answer1:" + quiz.answer1 + ", answer2:" + quiz.answer2  
			+ ",\n answer3:" + quiz.answer3 + ", answer4:" + quiz.answer4 
			+ ",\n answernumber:" + quiz.answernumber + ",\n id:" + quiz.id);*/
	$.ajax({ 
		method   : 'post' 
		, url    : 'quizInsert' 
		, data   : JSON.stringify(quiz) 
		, dataType : 'json' 
		, contentType : 'application/json; charset=UTF-8' 
		, success: function (data){ 
			//swal('[0] '+data.success + ', ' + data.newRecordName); 
			$("form").each(function() {   
	            this.reset(); 
	        }); 
			 
			var frm = document.getElementById('quizrecordname'); 
	        var op = new Option(); 
	        op.value = data.newRecordName; // 값 설정 
	        op.text = data.newRecordName; // 텍스트 설정 
	  
	        op.selected = true; // 선택된 상태 설정 (기본값은 false이며 선택된 상태로 만들 경우에만 사용) 
	  
	        frm.options.add(op); // 옵션 추가 
			//$('#quizrecordname').append(data.newRecordName); 
		} 
		, error: function(request,status,error){ 
	        //swal("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error); 
	    } 
			 
	}); 
	 
} 
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
		<!-- ========================================================================================================== -->
		<!-- ========================================================================================================== -->
		<!-- ========================================================================================================== -->


		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
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

						<!-- general form elements disabled -->
						<div class="box box-info"  style="width: 90%;">
							<div class="box-header with-border">
								<h3 class="box-title">Insert the Quiz</h3>
							</div>
							<!-- /.box-header -->
							<div class="box-body">
								<form role="form">

									<input type="hidden" id="id" value="${sessionScope.ID}">

									<!-- TYPE -->
									<div class="form-group">
										<label>문제 타입</label>
										<br/>
										<div class="btn-group">
										  <input type="button" class="btn btn-info quiztypeinput" value="multiplechoice" readonly="readonly">
										  <input type="button" class="btn btn-info quiztypeinput" value="shortanswer" readonly="readonly" style="margin-left: 10px;">
					                    </div> 
										
										<input type="hidden" id="type" name="type" value="multiplechoice">
									</div>

									<!-- Quiz folder -->
									<div class="form-group">
										<label>Quiz folder</label> <select class="form-control"
											id="quizrecordname" name="quizrecordname"
											onchange="changeSelect()">
											<option value="normal">normal</option>
											<option value="new">Create new folder</option>
											<c:forEach var="record" items="${recordList}">
												<option value="${record.NAME}">${record.NAME}</option>
											</c:forEach>
										</select>
										<div id="forNewName"></div>
									</div>


									


									<!-- Question -->
									<div class="form-group">
										<label>질문</label> <input type="text" class="form-control"
											id="question" name="question">
									</div>


									<!-- Answer -->
									<div class="form-group" id="answerDIV">

										<div>
											<br /> <label> <input type="radio"
												name="answernumber" value="1" class="minimal" checked>1번
											</label> <input type="text" class="form-control" name="answer1"
												id="answer1"> <br /> <label> <input
												type="radio" name="answernumber" value="2" class="minimal">2번
											</label> <input type="text" class="form-control" name="answer2"
												id="answer2"> <br /> <label> <input
												type="radio" name="answernumber" value="3" class="minimal">3번
											</label> <input type="text" class="form-control" name="answer3"
												id="answer3"> <br /> <label> <input
												type="radio" name="answernumber" value="4" class="minimal">4번
											</label> <input type="text" class="form-control" name="answer4"
												id="answer4">
										</div>
									</div>


									<a href="" class="btn btn-info btn-block margin-bottom"
										onclick="check()">문제 등록하기</a>



								</form>
							</div>
							<!-- /.box-body -->
						</div>

					</div>
					<!-- /. box -->
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

	<footer class="main-footer">
		<div class="pull-right hidden-xs">
			<b>Version</b> 2.4.0
		</div>
		<strong>Copyright &copy; 2014-2016 <a
			href="https://adminlte.io">Almsaeed Studio</a>.
		</strong> All rights reserved.
	</footer>
		
		
	</div>
	<!-- /.content-wrapper -->
	
	
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
	<script	src="resources/main/bower_components/fullcalendar/dist/fullcalendar.min.js"></script>
	<script type="text/javascript" src="<c:url value="/resources/study/sockjs-0.3.4.js"/>"></script>
	<script type="text/javascript">
	
	    var sock;
	
	    //웸소켓을 지정한 url로 연결한다.
	    sock = new SockJS("<c:url value="/echo2"/>");
	    
	</script>
	<script src="resources/main/js/messageBar.js"></script> 
	<!-- Page specific script -->
	
</body>
</html>
