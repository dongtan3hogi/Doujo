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
		$('#quiztypeinput').on("click", function(){ 
			var qt = document.getElementById("quiztypeinput").value; 
			if(qt == "shortanswer"){ 
				document.getElementById("quiztypeinput").value = "multiplechoice"; 
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
			} else if(qt == "multiplechoice"){	 
				document.getElementById("quiztypeinput").value = "shortanswer"; 
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
		alert("새로운 폴더명을 입력하세요."); 
		document.getElementById("newrecord").focus(); 
		document.getElementById("newrecord").select(); 
		return false; 
	} else if(q.value.length <= 0){ 
		alert("질문을 입력하세요."); 
		q.focus(); 
		q.select(); 
		return false; 
	} else if(a.value.length <= 0){ 
		alert("정답을 입력하세요."); 
		a.focus(); 
		a.select(); 
		return false; 
	} 
	 
	/* alert(a + q); */ 
	var radioVal = $('input[name="answernumber"]:checked').val(); 
	//alert(radioVal); 
	var quiz = { 
			"quizrecordname" : $("#quizrecordname").val() 
			, "newrecord" : $("#newrecord").val() 
			, "type" : $("#type").val() 
			, "teg" : $("#teg").val() 
			, "question" : $("#question").val() 
			, "answer1" : $("#answer1").val() 
			, "answer2" : $("#answer2").val() 
			, "answer3" : $("#answer3").val() 
			, "answer4" : $("#answer4").val() 
			, "answernumber" : radioVal 
			, "id" :  $("#id").val() 
	}; 
	alert("quizrecordname:" +quiz.quizrecordname + ", newrecord:" + quiz.newrecord + ", type:" + quiz.type  
			+ "\n, teg:" + quiz.teg + ", question:" + quiz.question  
			+ "\n, answer1:" + quiz.answer1 + ", answer2:" + quiz.answer2  
			+ ",\n answer3:" + quiz.answer3 + ", answer4:" + quiz.answer4 
			+ ",\n answernumber:" + quiz.answernumber + ",\n id:" + quiz.id);
	$.ajax({ 
		method   : 'post' 
		, url    : 'quizInsert' 
		, data   : JSON.stringify(quiz) 
		, dataType : 'json' 
		, contentType : 'application/json; charset=UTF-8' 
		, success: function (data){ 
			alert('[0] '+data.success + ', ' + data.newRecordName); 
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
	        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error); 
	    } 
			 
	}); 
	 
} 
</script>
<body class="hold-transition skin-blue sidebar-mini">
	<div class="wrapper">

		<header class="main-header">
			<!-- Logo -->
			<a href="redirect:/" class="logo"> <!-- mini logo for sidebar mini 50x50 pixels -->
				<span class="logo-mini"><b>Pm</b></span> <!-- logo for regular state and mobile devices -->
				<span class="logo-lg"><b>Planman</b></span>
			</a>

			<!-- Header Navbar: style can be found in header.less -->
			<nav class="navbar navbar-static-top">
				<!-- Sidebar toggle button-->
				<a href="#" class="sidebar-toggle" data-toggle="push-menu"
					role="button"> <span class="sr-only">Toggle navigation</span> <!--   <span class="icon-bar"></span> 
        <span class="icon-bar"></span> -->
				</a>

				<div class="navbar-custom-menu">
					<ul class="nav navbar-nav">
						<!-- Tasks: style can be found in dropdown.less -->
						<li class="dropdown tasks-menu"><a href="#"
							class="dropdown-toggle" data-toggle="dropdown"> <i
								class="fa fa-flag-o"></i> <span class="label label-danger">9</span>
						</a>
							<ul class="dropdown-menu">
								<li class="header">You have 9 tasks</li>
								<li>
									<!-- inner menu: contains the actual data -->
									<ul class="menu">
										<li>
											<!-- Task item --> <a href="#">
												<h3>
													Study <small class="pull-right">80%</small>
												</h3>
												<div class="progress xs">
													<div class="progress-bar progress-bar-aqua"
														style="width: 20%" role="progressbar" aria-valuenow="20"
														aria-valuemin="0" aria-valuemax="100">
														<span class="sr-only">80% Complete</span>
													</div>
												</div>
										</a>
										</li>
										<!-- end task item -->
										<li>
											<!-- Task item --> <a href="#">
												<h3>
													Health <small class="pull-right">40%</small>
												</h3>
												<div class="progress xs">
													<div class="progress-bar progress-bar-green"
														style="width: 40%" role="progressbar" aria-valuenow="20"
														aria-valuemin="0" aria-valuemax="100">
														<span class="sr-only">40% Complete</span>
													</div>
												</div>
										</a>
										</li>
										<!-- end task item -->
										<li>
											<!-- Task item --> <a href="#">
												<h3>
													Work <small class="pull-right">60%</small>
												</h3>
												<div class="progress xs">
													<div class="progress-bar progress-bar-red"
														style="width: 60%" role="progressbar" aria-valuenow="20"
														aria-valuemin="0" aria-valuemax="100">
														<span class="sr-only">60% Complete</span>
													</div>
												</div>
										</a>
										</li>
										<!-- end task item -->
									</ul>
								</li>
								<li class="footer"><a href="#">View all tasks</a></li>
							</ul></li>
						<!-- User Account: style can be found in dropdown.less -->
						<li class="dropdown user user-menu"><a href="#"
							class="dropdown-toggle" data-toggle="dropdown"> <img
								src="resources/main/dist/img/user2-160x160.jpg"
								class="user-image" alt="User Image"> <span
								class="hidden-xs">${sessionScope.member.id}</span>
						</a>
							<ul class="dropdown-menu">
								<!-- User image -->
								<li class="user-header"><img
									src="resources/main/dist/img/user2-160x160.jpg"
									class="img-circle" alt="User Image">

									<p>
										${sessionScope.member.id} <small>${sessionScope.member.nickname}</small>
									</p></li>
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
									</div> <!-- /.row -->
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
							</ul></li>
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
						<img src="resources/main/dist/img/user2-160x160.jpg"
							class="img-circle" alt="User Image">
					</div>
					<div class="pull-left info">
						<p>${sessionScope.member.id}</p>
						<a href="#"><i class="fa fa-circle text-success"></i> Online</a>
					</div>
				</div>
				<!-- search form -->
				<form action="#" method="get" class="sidebar-form">
					<div class="input-group">
						<input type="text" name="q" class="form-control"
							placeholder="Searchresources."> <span
							class="input-group-btn">
							<button type="submit" name="search" id="search-btn"
								class="btn btn-flat">
								<i class="fa fa-search"></i>
							</button>
						</span>
					</div>
				</form>
				<!-- /.search form -->
				<!-- sidebar menu: : style can be found in sidebar.less -->
				<ul class="sidebar-menu" data-widget="tree">
					<li class="header">MAIN NAVIGATION</li>
					<li class="treeview"><a href="#"> <i
							class="fa fa-dashboard"></i> <span>Study</span> <span
							class="pull-right-container"> <i
								class="fa fa-angle-left pull-right"></i>
						</span>
					</a>
						<ul class="treeview-menu">
							<li><a href="gotoQuiz"><i class="fa fa-circle-o"></i> Quiz</a></li> 
            				<li><a href="gotoGroupLobby"><i class="fa fa-circle-o"></i> Study Group</a></li>
						</ul>
					</li>
					<li class="treeview"><a href="#"> <i
							class="fa fa-dashboard"></i> <span>Work</span> <span
							class="pull-right-container"> <i
								class="fa fa-angle-left pull-right"></i>
						</span>
					</a>
						<ul class="treeview-menu">
							<li><a href=""><i class="fa fa-circle-o"></i> Work 1</a></li>
							<li><a href=""><i class="fa fa-circle-o"></i> Work 2</a></li>
						</ul></li>
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
					<li><a href="widgets.html"> <i class="fa fa-th"></i> <span>Widgets</span>
							<span class="pull-right-container"> <small
								class="label pull-right bg-green">new</small>
						</span>
					</a></li>
					<li><a href="https://adminlte.io/docs"><i
							class="fa fa-book"></i> <span>Documentation</span></a></li>
					<li class="header">LABELS</li>
					<li><a href="#"><i class="fa fa-circle-o text-red"></i> <span>Important</span></a></li>
					<li><a href="#"><i class="fa fa-circle-o text-yellow"></i>
							<span>Warning</span></a></li>
					<li><a href="#"><i class="fa fa-circle-o text-aqua"></i> <span>Information</span></a></li>
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
					Title01 <small>설명이 설명설명</small>
				</h1>
				<ol class="breadcrumb">
					<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
					<li class="active">title</li>
				</ol>
			</section>

			<!-- Main content -->
			<section class="content">
				<div class="row">
					<div class="col-md-3">
						<a href="compose.html"
							class="btn btn-primary btn-block margin-bottom">Button</a>

						<div class="box box-solid">
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
										<li>
											<a href="gotoQuiz">
												<i class="fa fa-inbox"></i>
												QUIZ
												<span class="label label-primary pull-right">12</span>
											</a>
										</li>
										<li class="active">
											<a href="#">
												<i class="fa fa-envelope-o"></i>
												MAKE
											</a>
										</li>
										<li>
											<a href="gotoQuizSolve">
												<i class="fa fa-file-text-o"></i>
												SOLVE
											</a>
										</li>
										<li>
											<a href="gotoGroup">
												<i class="fa fa-filter"></i>
												GROUP
												<span class="label label-warning pull-right">65</span>
											</a>
										</li>
									</ul>
								</ul>
							</div>
							<!-- /.box-body -->
						</div>
						<!-- /. box -->
					</div>
					<!-- /.col -->
					<div class="col-md-9">

						<!-- general form elements disabled -->
						<div class="box box-primary">
							<div class="box-header with-border">
								<h3 class="box-title">Insert the Quiz</h3>
							</div>
							<!-- /.box-header -->
							<div class="box-body">
								<form role="form">

									<input type="hidden" id="id" value="${sessionScope.ID}">

									<!-- TEG -->
									<div class="form-group">
										<label>문제 타입</label> <input type="text" class="form-control"
											id="quiztypeinput" value="multiplechoice" readonly="readonly">
										<input type="hidden" id="type" name="type"
											value="multiplechoice">
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


									<!-- TEG -->
									<div class="form-group">
										<label>태그</label> <input type="text" class="form-control"
											name="teg" id="teg" placeholder="#JPT450#listen">
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


									<a href="" class="btn btn-primary btn-block margin-bottom"
										onclick="check()">Button</a>



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
	</div>
	<!-- /.content-wrapper -->


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

	<!-- Control Sidebar -->
	<aside class="control-sidebar control-sidebar-dark">
		<!-- Create the tabs -->
		<ul class="nav nav-tabs nav-justified control-sidebar-tabs">
			<li><a href="#control-sidebar-home-tab" data-toggle="tab"><i
					class="fa fa-home"></i></a></li>
			<li><a href="#control-sidebar-settings-tab" data-toggle="tab"><i
					class="fa fa-gears"></i></a></li>
		</ul>
		<!-- Tab panes -->
		<div class="tab-content">
			<!-- Home tab content -->
			<div class="tab-pane" id="control-sidebar-home-tab">
				<h3 class="control-sidebar-heading">Recent Activity</h3>
				<ul class="control-sidebar-menu">
					<li><a href="javascript:void(0)"> <i
							class="menu-icon fa fa-birthday-cake bg-red"></i>

							<div class="menu-info">
								<h4 class="control-sidebar-subheading">Langdon's Birthday</h4>

								<p>Will be 23 on April 24th</p>
							</div>
					</a></li>
					<li><a href="javascript:void(0)"> <i
							class="menu-icon fa fa-user bg-yellow"></i>

							<div class="menu-info">
								<h4 class="control-sidebar-subheading">Frodo Updated His
									Profile</h4>

								<p>New phone +1(800)555-1234</p>
							</div>
					</a></li>
					<li><a href="javascript:void(0)"> <i
							class="menu-icon fa fa-envelope-o bg-light-blue"></i>

							<div class="menu-info">
								<h4 class="control-sidebar-subheading">Nora Joined Mailing
									List</h4>

								<p>nora@example.com</p>
							</div>
					</a></li>
					<li><a href="javascript:void(0)"> <i
							class="menu-icon fa fa-file-code-o bg-green"></i>

							<div class="menu-info">
								<h4 class="control-sidebar-subheading">Cron Job 254
									Executed</h4>

								<p>Execution time 5 seconds</p>
							</div>
					</a></li>
				</ul>
				<!-- /.control-sidebar-menu -->

				<h3 class="control-sidebar-heading">Tasks Progress</h3>
				<ul class="control-sidebar-menu">
					<li><a href="javascript:void(0)">
							<h4 class="control-sidebar-subheading">
								Custom Template Design <span
									class="label label-danger pull-right">70%</span>
							</h4>

							<div class="progress progress-xxs">
								<div class="progress-bar progress-bar-danger" style="width: 70%"></div>
							</div>
					</a></li>
					<li><a href="javascript:void(0)">
							<h4 class="control-sidebar-subheading">
								Update Resume <span class="label label-success pull-right">95%</span>
							</h4>

							<div class="progress progress-xxs">
								<div class="progress-bar progress-bar-success"
									style="width: 95%"></div>
							</div>
					</a></li>
					<li><a href="javascript:void(0)">
							<h4 class="control-sidebar-subheading">
								Laravel Integration <span class="label label-warning pull-right">50%</span>
							</h4>

							<div class="progress progress-xxs">
								<div class="progress-bar progress-bar-warning"
									style="width: 50%"></div>
							</div>
					</a></li>
					<li><a href="javascript:void(0)">
							<h4 class="control-sidebar-subheading">
								Back End Framework <span class="label label-primary pull-right">68%</span>
							</h4>

							<div class="progress progress-xxs">
								<div class="progress-bar progress-bar-primary"
									style="width: 68%"></div>
							</div>
					</a></li>
				</ul>
				<!-- /.control-sidebar-menu -->

			</div>
			<!-- /.tab-pane -->
			<!-- Stats tab content -->
			<div class="tab-pane" id="control-sidebar-stats-tab">Stats Tab
				Content</div>
			<!-- /.tab-pane -->
			<!-- Settings tab content -->
			<div class="tab-pane" id="control-sidebar-settings-tab">
				<form method="post">
					<h3 class="control-sidebar-heading">General Settings</h3>

					<div class="form-group">
						<label class="control-sidebar-subheading"> Report panel
							usage <input type="checkbox" class="pull-right" checked>
						</label>

						<p>Some information about this general settings option</p>
					</div>
					<!-- /.form-group -->

					<div class="form-group">
						<label class="control-sidebar-subheading"> Allow mail
							redirect <input type="checkbox" class="pull-right" checked>
						</label>

						<p>Other sets of options are available</p>
					</div>
					<!-- /.form-group -->

					<div class="form-group">
						<label class="control-sidebar-subheading"> Expose author
							name in posts <input type="checkbox" class="pull-right" checked>
						</label>

						<p>Allow the user to show his name in blog posts</p>
					</div>
					<!-- /.form-group -->

					<h3 class="control-sidebar-heading">Chat Settings</h3>

					<div class="form-group">
						<label class="control-sidebar-subheading"> Show me as
							online <input type="checkbox" class="pull-right" checked>
						</label>
					</div>
					<!-- /.form-group -->

					<div class="form-group">
						<label class="control-sidebar-subheading"> Turn off
							notifications <input type="checkbox" class="pull-right">
						</label>
					</div>
					<!-- /.form-group -->

					<div class="form-group">
						<label class="control-sidebar-subheading"> Delete chat
							history <a href="javascript:void(0)" class="text-red pull-right"><i
								class="fa fa-trash-o"></i></a>
						</label>
					</div>
					<!-- /.form-group -->
				</form>
			</div>
			<!-- /.tab-pane -->
		</div>
	</aside>
	<!-- /.control-sidebar -->
	<!-- Add the sidebar's background. This div must be placed 
       immediately after the control sidebar -->
	<div class="control-sidebar-bg"></div>
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
	<script> 
  $(function () { 
 
    /* initialize the external events 
     -----------------------------------------------------------------*/ 
    function init_events(ele) { 
      ele.each(function () { 
 
        // create an Event Object (http://arshaw.com/fullcalendar/docs/event_data/Event_Object/) 
        // it doesn't need to have a start or end 
        var eventObject = { 
          title: $.trim($(this).text()) // use the element's text as the event title 
        } 
 
        // store the Event Object in the DOM element so we can get to it later 
        $(this).data('eventObject', eventObject) 
 
        // make the event draggable using jQuery UI 
        $(this).draggable({ 
          zIndex        : 1070, 
          revert        : true, // will cause the event to go back to its 
          revertDuration: 0  //  original position after the drag 
        }) 
 
      }) 
    } 
 
    init_events($('#external-events div.external-event')) 
 
    /* initialize the calendar 
     -----------------------------------------------------------------*/ 
    //Date for the calendar events (dummy data) 
    var date = new Date() 
    var d    = date.getDate(), 
        m    = date.getMonth(), 
        y    = date.getFullYear() 
    $('#calendar').fullCalendar({ 
      header    : { 
        left  : 'prev,next today', 
        center: 'title', 
        right : 'month,agendaWeek,agendaDay' 
      }, 
      buttonText: { 
        today: 'today', 
        month: 'month', 
        week : 'week', 
        day  : 'day' 
      }, 
      //Random default events 
      events    : [ 
        { 
          title          : 'All Day Event', 
          start          : new Date(y, m, 1), 
          backgroundColor: '#f56954', //red 
          borderColor    : '#f56954' //red 
        }, 
        { 
          title          : 'Long Event', 
          start          : new Date(y, m, d - 5), 
          end            : new Date(y, m, d - 2), 
          backgroundColor: '#f39c12', //yellow 
          borderColor    : '#f39c12' //yellow 
        }, 
        { 
          title          : 'Meeting', 
          start          : new Date(y, m, d, 10, 30), 
          allDay         : false, 
          backgroundColor: '#0073b7', //Blue 
          borderColor    : '#0073b7' //Blue 
        }, 
        { 
          title          : 'Lunch', 
          start          : new Date(y, m, d, 12, 0), 
          end            : new Date(y, m, d, 14, 0), 
          allDay         : false, 
          backgroundColor: '#00c0ef', //Info (aqua) 
          borderColor    : '#00c0ef' //Info (aqua) 
        }, 
        { 
          title          : 'Birthday Party', 
          start          : new Date(y, m, d + 1, 19, 0), 
          end            : new Date(y, m, d + 1, 22, 30), 
          allDay         : false, 
          backgroundColor: '#00a65a', //Success (green) 
          borderColor    : '#00a65a' //Success (green) 
        }, 
        { 
          title          : 'Click for Google', 
          start          : new Date(y, m, 28), 
          end            : new Date(y, m, 29), 
          url            : 'http://google.com/', 
          backgroundColor: '#3c8dbc', //Primary (light-blue) 
          borderColor    : '#3c8dbc' //Primary (light-blue) 
        } 
      ], 
      editable  : true, 
      droppable : true, // this allows things to be dropped onto the calendar !!! 
      drop      : function (date, allDay) { // this function is called when something is dropped 
 
        // retrieve the dropped element's stored Event Object 
        var originalEventObject = $(this).data('eventObject') 
 
        // we need to copy it, so that multiple events don't have a reference to the same object 
        var copiedEventObject = $.extend({}, originalEventObject) 
 
        // assign it the date that was reported 
        copiedEventObject.start           = date 
        copiedEventObject.allDay          = allDay 
        copiedEventObject.backgroundColor = $(this).css('background-color') 
        copiedEventObject.borderColor     = $(this).css('border-color') 
 
        // render the event on the calendar 
        // the last `true` argument determines if the event "sticks" (http://arshaw.com/fullcalendar/docs/event_rendering/renderEvent/) 
        $('#calendar').fullCalendar('renderEvent', copiedEventObject, true) 
 
        // is the "remove after drop" checkbox checked? 
        if ($('#drop-remove').is(':checked')) { 
          // if so, remove the element from the "Draggable Events" list 
          $(this).remove() 
        } 
 
      } 
    }) 
 
    /* ADDING EVENTS */ 
    var currColor = '#3c8dbc' //Red by default 
    //Color chooser button 
    var colorChooser = $('#color-chooser-btn') 
    $('#color-chooser > li > a').click(function (e) { 
      e.preventDefault() 
      //Save color 
      currColor = $(this).css('color') 
      //Add color effect to button 
      $('#add-new-event').css({ 'background-color': currColor, 'border-color': currColor }) 
    }) 
    $('#add-new-event').click(function (e) { 
      e.preventDefault() 
      //Get value and make sure it is not null 
      var val = $('#new-event').val() 
      if (val.length == 0) { 
        return 
      } 
 
      //Create events 
      var event = $('<div />') 
      event.css({ 
        'background-color': currColor, 
        'border-color'    : currColor, 
        'color'           : '#fff' 
      }).addClass('external-event') 
      event.html(val) 
      $('#external-events').prepend(event) 
 
      //Add draggable funtionality 
      init_events(event) 
 
      //Remove event from text input 
      $('#new-event').val('') 
    }) 
  }) 
</script>
</body>
</html>
