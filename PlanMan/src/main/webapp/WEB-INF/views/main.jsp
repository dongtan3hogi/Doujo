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
  <link rel="stylesheet" href="./resources/main/bower_components/bootstrap/dist/css/bootstrap.min.css">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="./resources/main/bower_components/font-awesome/css/font-awesome.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="./resources/main/bower_components/Ionicons/css/ionicons.min.css">
  <!-- fullCalendar -->
  <link rel="stylesheet" href="./resources/main/bower_components/fullcalendar/dist/fullcalendar.min.css">
  <link rel="stylesheet" href="./resources/main/bower_components/fullcalendar/dist/fullcalendar.print.min.css" media="print">
  <!-- Theme style -->
  <link rel="stylesheet" href="./resources/main/dist/css/AdminLTE.min.css">
  <!-- AdminLTE Skins. Choose a skin from the css/skins folder instead of downloading all of them to reduce the load. -->
  <link rel="stylesheet" href="./resources/main/dist/css/skins/_all-skins.min.css">
  <!-- Google Font -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
  <!-- Date Picker -->
  <link rel="stylesheet" href="./resources/main/bower_components/bootstrap-datepicker/dist/css/datepicker.css">
  <!-- Time Picker -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-timepicker/0.5.2/css/bootstrap-timepicker.css">
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
	 
	 .sType{
	 	display: none;
	 }
	 
	 .sType:checked + label {
	   color: #0000FF;
	 } 
	 
	 .upload-button:hover {
		  transition: all .3s cubic-bezier(.175, .885, .32, 1.275);
		  color: #999;
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

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        Calendar
        <small>${sessionScope.member.id}님의 스케쥴</small>
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
        		스케쥴 기간 지정 &nbsp;&nbsp; <input type = "radio" class='sType' id="sType" name='sType' value='sometimes' checked="checked"><label for="sType">반복 스케쥴</label> &nbsp; <input type = "radio" class='sType' id="sType2" name='sType' value='always'><label for="sType2">지속 스케쥴</label> &nbsp;  <input type="number" style="width: 40px; height: 30px;" id="endday" value="1"> 일간 진행
        	</div>
        	<br/>
        	<div class="dropdown">시간대 <input id="timepicker" type="text" style="width: 120px;"> ~ <input id="timepicker2" type="text" style="width: 120px;"></div>
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
    
    <div id="fortheprofilediv">
	</div>

    <!-- Main content -->
    <section class="content">
      <div class="row">
        
        <!-- /.col -->
        <div class="col-md-9">
          <div class="box box-primary" style="margin-left: 20px;">
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
        right : 'month'
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
    				
    				var col="";
    				if(item.eventtype=='study'){
   		         		col="#2ECCFA";
   		         	}else if(item.eventtype=='health'){
   		         		col="#FF0040";
   		         	}else if(item.eventtype=='work'){
   		         		col="#F7D358";
   		         	}else if(item.eventtype=='friend'){
   		         		col="#008000";
   		         	}
   				  events.push({
   					schseq: item.schseq,
   					id: item.id,	
   		            title: item.eventtitle,
   		            start: item.startday,
   		          	end: item.endday,
   		          	content: item.eventcontent,
   		          	event: item.eventtype,
   		         	diffDay : item.diffDay,
   		         	color : col
   				  });
   		        });
   		        callback(events);
  			  }
    	  });
      },
      editable  : true,
      eventClick: function(calEvent) {
		  
		  var schseq=calEvent.schseq;
		  var eventtype=calEvent.event;
		  
		  var startday = new Date(calEvent.start);
		  var endday = new Date(calEvent.end);
		  var s_date = startday.getDate();
	  	  var s_month = startday.getMonth() + 1;
	  	  var s_year = startday.getFullYear();
	  	  var start = s_year+"-"+s_month+"-"+s_date;
	  	  var e_date = endday.getDate();
	  	  var e_month = endday.getMonth() + 1;
	  	  var e_year = endday.getFullYear();
	  	  var end = e_year+"-"+e_month+"-"+e_date;
	  	  var hour = (startday.getHours()+15)%24;
	  	  var minute = startday.getMinutes();
	  	  var s_time = hour+':'+minute;
	  	  s_time = new Date(start+" "+s_time);

	  	  hour = (endday.getHours()+15)%24;	
	  	  minute = endday.getMinutes();
	  	  var e_time = hour+':'+minute;
	  	  e_time = new Date(end+" "+e_time);
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
          $('#endday').val(calEvent.diffDay+1);
          $('#sch-button').text('');
          $('#timepicker').timepicker({
        		maxHours : 24,
      		showMeridian: false,
      		minuteStep: 10,
      		setTime: startday

            });
          $('#timepicker').timepicker('setTime', s_time);
            $('#timepicker2').timepicker({
          		maxHours : 24,
          		showMeridian: false,
          		minuteStep: 10,
            });
            $('#timepicker2').timepicker('setTime', e_time);

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
	    var stype = $('input[name="sType"]:checked').val();

		if($('.event:checked').val()==null){
  			swal("이벤트 타입을 선택해 주세요.");
  			return false;
  		}
  		
  		if($('#endday').val()<=0){
  			swal("기간을 다시 선택해주세요.");
  			return false;
  		}
		
  		if($('#timepicker').val()>=$('#timepicker2').val()){
  			swal("시간대를 다시 선택해주세요.");
  			return false;
  		}
  		
  		if($('#eventtitle').val().length==0){
  			swal("이벤트 타이틀을 입력해주세요.");
  			return false;
  		}else if(stype=='sometimes'){
  			endday=$('#startday').val()+" "+$('#timepicker2').val();
  			$.ajax({
  				url:'addschdule2'
  				,type:'post'
  				,data:{"id":"${sessionScope.member.id}"
  					,"eventtype":event
  					,"eventtitle":eventtitle
  					,"eventcontent":eventcontent
  					,"startday":startday
  					,"endday":endday
  					,"starttime": $('#timepicker').val()
  					,"endtime": $('#timepicker2').val()
  					,"plusday": plusday
  				}
  				,success: function (data){
					if(data=="success"){
						swal("스케쥴을 입력했습니다.");
						$('#eventtitle').val('');
			            $('#eventcontent').val('');
			            $('#endday').val(1);
			            $('.event').prop('checked', false);
			            var modal = document.getElementById('myModal');
			            modal.style.display = "none";
			            location.reload(); 
			            return true;
					}else{
						swal("스케쥴  입력에 실패했습니다.");
						return false;
					}
  				}
  			});	
  		}
  		
  		else{
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
						swal("스케쥴을 입력했습니다.");
						$('#eventtitle').val('');
			            $('#eventcontent').val('');
			            $('#endday').val(1);
			            $('.event').prop('checked', false);
			            var modal = document.getElementById('myModal');
			            modal.style.display = "none";
			            location.reload(); 
			            return true;
					}else{
						swal("스케쥴  입력에 실패했습니다.");
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
 			swal("이벤트 타입을 선택해 주세요.");
 			return false;
 		}
 		
	    if($('#endday').val()<=0){
			swal("기간을 다시 선택해주세요.");
			return false;
		}
	   
	    if($('#timepicker').val()>=$('#timepicker2').val()){
 			swal("시간대를 다시 선택해주세요.");
 			return false;
 		}
 		
 		if($('#eventtitle').val().length==0){
 			swal("이벤트 타이틀을 입력해주세요.");
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
						swal("스케쥴을 변경했습니다.");
						$('#eventtitle').val('');
			            $('#eventcontent').val('');
			            $('#endday').val(1);
			            $('.event').prop('checked', false);
			            var modal = document.getElementById('myModal');
			            modal.style.display = "none";
			            location.reload(); 
			            return true;
					}else{
						swal("스케쥴  변경에 실패했습니다.");
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
					swal("스케쥴을 삭제했습니다.");
					$('#eventtitle').val('');
		            $('#eventcontent').val('');
		            $('#endday').val(1);
		            $('.event').prop('checked', false);
		            var modal = document.getElementById('myModal');
		            modal.style.display = "none";
		            location.reload(); 
		            return true;
				}else{
					swal("스케쥴  삭제에 실패했습니다.");
					return false;
				}
			}
	   });	
   }
   
   
</script>
<script type="text/javascript" src="<c:url value="./resources/study/sockjs-0.3.4.js"/>"></script>
<script type="text/javascript">

    var sock;

    //웸소켓을 지정한 url로 연결한다.
    sock = new SockJS("<c:url value="/echo2"/>");
    
</script>
<script src="./resources/main/js/messageBar.js"></script> 
</body>
</html>
