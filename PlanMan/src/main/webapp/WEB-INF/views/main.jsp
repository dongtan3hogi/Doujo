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
  <!-- Time Picker -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-timepicker/0.5.2/css/bootstrap-timepicker.css">
  
  <style type="text/css">
	 /* The Modal (background) */
     .modal {
         display: none; /* Hidden by default */
         position: fixed; /* Stay in place */
         z-index: 5; /* Sit on top */
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
         width: 50%; /* Could be more or less, depending on screen size */                          
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
     
     .event {
  		display: none; 
	 }
	 
	 label {
	  	margin: 0 0 -1px;
	  	padding: 5px 20px;
   	    font-weight: 600;
	    text-align: center;
	    color: #708090;
	    border: 1px solid transparent;
	 }
	
	 .event:checked + label {
	  	color: #d73925;
	 } 
	
	 label:hover {
	   color: #b0e0e6;
	   cursor: pointer;
	 }
	 #datepicker{
	   display: inline;
	 }
	 
	 input[type="time"]{
	 	display: inline;
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
                  <a href="logout" class="btn btn-default btn-flat">로그아웃</a>
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
            <li><a href="gotoQuiz"><i class="fa fa-circle-o"></i> Quiz</a></li> 
            <li><a href="gotoGroupLobby"><i class="fa fa-circle-o"></i> Study Group</a></li>
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
            <li><a href=""><i class="fa fa-circle-o text-red"></i> Health 1</a></li>
            <li><a href=""><i class="fa fa-circle-o text-red"></i> Health 2</a></li>
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

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        Calendar
        <small>${sessionScope.member.id}님의 스케쥴  / <a href="gotoTimeline">Timeline</a></small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active">Calendar</li>
      </ol>
    </section>
    
	<!-- The Modal -->
    <div id="myModal" class="modal">
 
    	<!-- Modal content -->
        <div class="modal-content">
        	<span class="close">&times;</span>
        	<input type="hidden" id="seq" />     
        	<div>스케쥴 타입</div>
        	<div>
        		<input type="radio" id="event1" value="study" class="event" name="event">
        		<label for="event1">Study</label>
        		<input type="radio" id="event2" value="work" class="event" name="event">
        		<label for="event2">Work</label>
        		<input type="radio" id="event3" value="health" class="event" name="event">
        		<label for="event3">Health</label>
        		<input type="radio" id="event4" value="friend" class="event" name="event">
        		<label for="event4">Friend</label>
        		<input type="radio" id="event5" value="etc" class="event" name="event">
        		<label for="event5">etc</label>
        	</div>
        	<br/>
        	<div>
        		시작일 <input type="text" style="width: 150px;" class="datepicker" id="startday" > 
        	</div>
        	<br/>
        	<div>
        		스케쥴 기간 지정    <input type="number" style="width: 40px; height: 30px;" id="endday" value="1"> 일간 진행
        	</div>
        	<br/>
        	<div>시간대 <input id="timepicker" type="text" style="width: 120px;"> ~ <input id="timepicker2" type="text" style="width: 120px;"></div>
        	<br/>
        	<div>스케쥴명</div>
        	<div><input type="text" class="form-control" id="eventtitle" name="eventtitle" /></div>
        	<br/>
        	<div>스케쥴내용</div>
        	<div><textarea type="text" class="form-control" id="eventcontent" name="eventcontent" style="height: 200px;"></textarea></div>
        	<br/>
        	<div id="sch-button" align="right"><input type="submit" id="eventAdd" style="width: 200px;" value="스케쥴 입력하기" class="btn btn-block btn-primary" onclick="return addevent()"/></div>
        </div>
    </div>
    
    

    <!-- Main content -->
    <section class="content">
      <div class="row">
        
        <!-- /.col -->
        <div class="col-md-9">
          <div class="box box-primary">
            <div class="box-body no-padding">
              <!-- THE CALENDAR -->
              <div id="calendar"></div>
            </div>
            <!-- /.box-body -->
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
<!-- datepicker -->
<script src="//code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<!-- timepicker -->
<script type="text/javascript" src="resources/main/bower_components/bootstrap-timepicker/js/bootstrap-timepicker.js"></script>
<!-- Page specific script -->
<script>
  $(function () {
	$('.datepicker').datepicker({
		dateFormat: 'yy-mm-dd'
	});
	
	$('#timepicker').timepicker({
		maxHours : 24,
		showMeridian: false,
		minuteStep: 10
    });
	
	$('#timepicker2').timepicker({
		maxHours : 24,
		showMeridian: false,
		minuteStep: 10
    });
	

    $('#calendar').fullCalendar({
      header    : {
        left  : 'prev,next today',
        center: 'title',
        right : 'month,agendaWeek,agendaDay'
      },
      buttonText: {
        today: '오늘',
        month: 'month',
        week : 'week',
        day  : 'day'
      },
      dayClick: function(date){
    	
    	// Get the modal
        var modal = document.getElementById('myModal');
 
        // Get the <span> element that closes the modal
        var span = document.getElementsByClassName("close")[0];                                          
 
        // When the user clicks on the button, open the modal 
        $('#sch-button').text('');
        $('#sch-button').append("<input type='submit' id='eventAdd' style='width: 200px;' value='스케쥴 입력하기' class='btn btn-block btn-primary' onclick='return addevent()'/>");      	  
        modal.style.display = "block";
        $('#startday').val(date.format());
        
        // When the user clicks on <span> (x), close the modal
        span.onclick = function() {
        	$('#eventtitle').val('');
            $('#eventcontent').val('');
            $('.event').prop('checked', false);
            $('#timepicker').timepicker({
          		maxHours : 24,
        		showMeridian: false,
        		minuteStep: 10,
        		setTime: new Date()
              });
              $('#timepicker2').timepicker({
            		maxHours : 24,
            		showMeridian: false,
            		minuteStep: 10,
            		setTime: new Date()
              });
            modal.style.display = "none";
        }
 
        // When the user clicks anywhere outside of the modal, close it
        window.onclick = function(event) {
            if (event.target == modal) {
            	$('#eventtitle').val('');
                $('#eventcontent').val('');
                $('.event').prop('checked', false);  
                $('#timepicker').timepicker({
              		maxHours : 24,
            		showMeridian: false,
            		minuteStep: 10,
            		setTime: new Date()
                  });
                  $('#timepicker2').timepicker({
                		maxHours : 24,
                		showMeridian: false,
                		minuteStep: 10,
                		setTime: new Date()
                  });
                modal.style.display = "none";
            }
        }
      },
      events:function(start,end, timezone, callback){
    	  $.ajax({
    		  url:"selectSchdule"
    		  ,type:'post'
    		  ,success:function(data){
    			var events = [];
    			$(data).each(function(index, item) {
   				  events.push({
   					schseq: item.schseq,
   					id: item.id,	
   		            title: item.eventtitle,
   		            start: item.startday,
   		          	end: item.endday,
   		          	content: item.eventcontent,
   		          	event: item.eventtype,
   		         	diffDay : item.diffDay
   				  });
   		        });
   		        callback(events);
  			  }
    	  });
      },
      editable  : true,
      eventClick: function(calEvent) {
		  
		  var schseq=calEvent.schseq;
		  alert(schseq);
		  var eventtype=calEvent.event;
		  var startday = new Date(calEvent.start);
		  var s_date = startday.getDate();
	  	  var s_month = startday.getMonth() + 1;
	  	  var s_year = startday.getFullYear();
	  	  var start= s_year+"-"+s_month+"-"+s_date
    	  var modal = document.getElementById('myModal');
          var span = document.getElementsByClassName("close")[0];                                          
   		  
          $('#seq').val(schseq);
          if(eventtype==$('#event1').val()){
        	  $('#event1').prop('checked', true);
          }else if(eventtype==$('#event2').val()){
        	  $('#event2').prop('checked', true);
          }else if(eventtype==$('#event3').val()){
        	  $('#event3').prop('checked', true);
          }else if(eventtype==$('#event4').val()){
        	  $('#event4').prop('checked', true);
          }else if(eventtype==$('#event5').val()){
        	  $('#event5').prop('checked', true);
          }
          $('#eventtitle').val(calEvent.title);
          $('#eventcontent').val(calEvent.content);
          $('#startday').val(start);
          $('#endday').val(calEvent.diffDay);
          $('#sch-button').text('');
          $('#sch-button').append("<input type='submit' id='eventUpdate' style='width: 200px;' value='스케쥴 수정하기' class='btn btn-block btn-primary' onclick='return updateevent()'/><input type='submit' id='eventDel' style='width: 200px;' value='스케쥴 삭제하기' class='btn btn-block btn-primary' onclick='return deleteevent()'/>");      	
          modal.style.display = "block";
          
          
          span.onclick = function() {
          	  $('#eventtitle').val('');
              $('#eventcontent').val('');
              $('#endday').val(1);
              $('.event').prop('checked', false);
              $('#timepicker').timepicker({
          		maxHours : 24,
        		showMeridian: false,
        		minuteStep: 10
              });
              $('#timepicker2').timepicker({
            		maxHours : 24,
            		showMeridian: false,
            		minuteStep: 10
              });
              modal.style.display = "none";
          }

          window.onclick = function(event) {
              if (event.target == modal) {
              	$('#eventtitle').val('');
                $('#eventcontent').val('');
                $('#endday').val(1);
                $('.event').prop('checked', false);  
                $('#timepicker').timepicker({
             		maxHours : 24,
           			showMeridian: false,
           			minuteStep: 10
                });
                $('#timepicker2').timepicker({
               		maxHours : 24,
               		showMeridian: false,
               		minuteStep: 10
                });
                modal.style.display = "none";
              }
          } 
      }
   	
    })
    
  })
  
  function addevent(){
		
		var event=$('.event:checked').val();
		var startday=$('#startday').val()+" "+$('#timepicker').val();
		var startdatetime=new Date(startday);
		var enddatetime=new Date();
		var plusday=$('#endday').val();
		plusday *= 1;
		plusday -= 1;
		enddatetime.setDate(startdatetime.getDate()+plusday);
		var end_date = enddatetime.getDate();
		var end_month = enddatetime.getMonth() + 1;
		var end_year = enddatetime.getFullYear();
		var endday=end_year+"-"+end_month+"-"+end_date+" "+$('#timepicker2').val();
		var eventtitle=$('#eventtitle').val();
		var eventcontent=$('#eventcontent').val();    
  		
		if($('.event:checked').val()==null){
  			alert("이벤트 타입을 선택해 주세요.");
  			return false;
  		}
  		
  		if($('#endday').val()<=0){
  			alert("기간을 다시 선택해주세요.");
  			return false;
  		}
		
  		if($('#timepicker').val()>=$('#timepicker2').val()){
  			alert("시간대를 다시 선택해주세요.");
  			return false;
  		}
  		
  		if($('#eventtitle').val().length==0){
  			alert("이벤트 타이틀을 입력해주세요.");
  			return false;
  		}else{
  			$.ajax({
  				url:'addschdule'
  				,type:'post'
  				,data:{"id":"${sessionScope.member.id}"
  					,"eventtype":event
  					,"eventtitle":eventtitle
  					,"eventcontent":eventcontent
  					,"startday":startday
  					,"endday":endday
  					,"starttime": $('#timepicker').val()
  					,"endtime": $('#timepicker2').val()
  				}
  				,success: function (data){
					if(data=="success"){
						alert("스케쥴을 입력했습니다.");
						$('#eventtitle').val('');
			            $('#eventcontent').val('');
			            $('#endday').val(1);
			            $('.event').prop('checked', false);
			            var modal = document.getElementById('myModal');
			            modal.style.display = "none";
			            location.reload(); 
			            return true;
					}else{
						alert("스케쥴  입력에 실패했습니다.");
						return false;
					}
  				}
  			});	
  		}
  		
   }
  
   function updateevent(){

	   var schseq=$('#seq').val();
	   var event=$('.event:checked').val();
	   var startday=$('#startday').val()+" "+$('#timepicker').val();
	   var startdatetime=new Date(startday);
	   var enddatetime=new Date();
	   var plusday=$('#endday').val();
	   plusday *= 1;
	   plusday -= 1;
	   enddatetime.setDate(startdatetime.getDate()+plusday);
	   var end_date = enddatetime.getDate();
	   var end_month = enddatetime.getMonth() + 1;
	   var end_year = enddatetime.getFullYear();
	   var endday=end_year+"-"+end_month+"-"+end_date+" "+$('#timepicker2').val();
	   var eventtitle=$('#eventtitle').val();
	   var eventcontent=$('#eventcontent').val();  
   
	   if($('.event:checked').val()==null){
 			alert("이벤트 타입을 선택해 주세요.");
 			return false;
 		}
 		
	    if($('#endday').val()<=0){
			alert("기간을 다시 선택해주세요.");
			return false;
		}
	   
	    if($('#timepicker').val()>=$('#timepicker2').val()){
 			alert("시간대를 다시 선택해주세요.");
 			return false;
 		}
 		
 		if($('#eventtitle').val().length==0){
 			alert("이벤트 타이틀을 입력해주세요.");
 			return false;
 		}else{
 			$.ajax({
 				url:'updateschdule'
 				,type:'post'
 				,data:{"id":"${sessionScope.member.id}"
 					,"schseq": schseq
 					,"eventtype":event
 					,"eventtitle":eventtitle
 					,"eventcontent":eventcontent
 					,"startday":startday
 					,"endday":endday
  					,"starttime": $('#timepicker').val()
  					,"endtime": $('#timepicker2').val()
 				}
 				,success: function (data){
					if(data=="success"){
						alert("스케쥴을 변경했습니다.");
						$('#eventtitle').val('');
			            $('#eventcontent').val('');
			            $('#endday').val(1);
			            $('.event').prop('checked', false);
			            var modal = document.getElementById('myModal');
			            modal.style.display = "none";
			            location.reload(); 
			            return true;
					}else{
						alert("스케쥴  변경에 실패했습니다.");
						return false;
					}
 				}
 			});	
 		}
   }
   
   function deleteevent(){
	   var schseq=$('#seq').val();
	   $.ajax({
			url:'deleteschdule'
			,type:'post'
			,data:{"schseq": schseq}
			,success: function (data){
				if(data=="success"){
					alert("스케쥴을 삭제했습니다.");
					$('#eventtitle').val('');
		            $('#eventcontent').val('');
		            $('#endday').val(1);
		            $('.event').prop('checked', false);
		            var modal = document.getElementById('myModal');
		            modal.style.display = "none";
		            location.reload(); 
		            return true;
				}else{
					alert("스케쥴  삭제에 실패했습니다.");
					return false;
				}
			}
	   });	
   }
</script>
</body>
</html>
