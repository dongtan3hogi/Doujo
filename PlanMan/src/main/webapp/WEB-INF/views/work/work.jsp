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
            <li><a href="goWork1"><i class="fa fa-circle-o text-yellow"></i> Work Memo Calendar</a></li>
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
            <li><a href=""><i class="fa fa-circle-o text-green"></i> Friend 1</a></li>
            <li><a href=""><i class="fa fa-circle-o text-green"></i> Friend 2</a></li>
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
        Work
        <small>${sessionScope.member.id}님의 스케쥴 / <span id="clock"></span><c:if test="${sessionScope.eventtitle!=null}"> / 지금 일정: ${sessionScope.eventtitle}</c:if></small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="goWorkMain"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active">title</li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content">
      <div class="row">
        <div class="col-md-3">
          
          <!-- /. box -->
         <div class="box box-solid" >
            <div class="box-header with-border">
              <h3 class="box-title">MEMO</h3>

              <div class="box-tools">
            
                <input type="button" class="datepicker"  ></input>
              </div>
            </div>
            <div class="box-body no-padding">
            <h5 id= 'memoTitle' class="box-title">오늘의 메모</h5>
           
           <textarea id ="memo"rows="20" value="text"  style="min-width: 95%;"></textarea> <br/>
           <input type="button" value="저장" id="saveMemo">
           
            </div>
            <!-- /.box-body -->
          </div>
          <!-- /. box -->
          
          
        </div>
        <!-- /.col -->
        <div class="col-md-9">
          
      	  <!-- general form elements disabled -->
          <div class="box box-Warning">
            <div class="box-header with-border">
              <h3 class="box-title">Work Memo list</h3>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
            <div id="calendar" ></div>
              
            </div>
            <div class="box-header with-border">
              <h3 class="box-title">Friend recommendation</h3>
             </div>
             <div class="box-body">
          
                
                <!-- text input -->
                <div class="form-group">
                  <label>Text</label>
                  <input type="text" class="form-control" placeholder="Enter ...">
                </div>

                <!-- textarea -->
                <div class="form-group">
                  <label>Textarea</label>
                  <textarea class="form-control" rows="3" placeholder="Enter ..."></textarea>
                </div>

             <div class="box-body">
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
  

  <!-- ========================================================================================================== -->
  <!-- ========================================================================================================== -->
  <!-- ========================================================================================================== -->
  
  
  <footer class="main-footer">
    <div class="pull-right hidden-xs">
      <b>Version</b> 2.4.0
    </div>
    <strong>Copyright &copy; 2014-2016 <a href="https://adminlte.io">Almsaeed Studio</a>.</strong> All rights
    reserved.
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
<!-- datepicker -->
<script src="//code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<!-- fullCalendar -->
<script src="resources/main/bower_components/moment/moment.js"></script>
<script src="resources/main/bower_components/fullcalendar/dist/fullcalendar.min.js"></script>
<!-- datepicker -->
<script src="//code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<!-- Page specific script -->
<script>
  $(function () {
	  $( ".datepicker" ).datepicker({
	       
	       changeMonth: true, 
	       changeYear: true,
	       nextText: "다음 달",
	       prevText: "이전 달" ,
	       dateFormat: "yy-mm-dd",
	       onSelect: function(dateText) {  
	    	   alert(dateText);
	    	   $.ajax({
	    		   url:'findmemo',
	    		    type: 'post',
	    		    data: {
	    		    	'id': '${sessionScope.member.id}', 'startdate': dateText
	    		    },
	    		    success: function(data){
	    				if(data==null)	{
	    					alert("메모가 없습니다");	    			
	    		            }else{
	    		            	if(dateText==td){
   	    		            	$('#memoTitle').html("오늘의 메모");
	    		            	}else{
   	    		            	$('#memoTitle').html(dateText+"의 메모");            		
	    		            	}
	    		            	$('#memo').val(data.memo);
	    		            }
	    				},
	    		    error: function() {
	    		      alert('there was an error while fetching events!');
	    		    }
     		  });
	    	     }

	 });
	   
	  var today = new Date();
		var mm= today.getMonth()+1; 
		var dd =today.getDate();
		var yy = today.getFullYear();
		if(dd<10) {
		    dd='0'+dd;
		} 
		if(mm<10) {
		    mm='0'+mm;
		} 
		var td=yy+'-'+mm+'-'+dd;
		var temp=td;
		var mlist = [];
		<c:forEach items="${mlist}" var="item1">
		mlist.push(JSON.stringify(${item1}));
		</c:forEach>

		var eData = [];
		 for(var i = 0; i < mlist.length; i++)  {
			 var catact = JSON.parse(mlist[i]);
		      eData.push({
		        title : "메모O",
		        start : catact.startdate,
		        end : catact.enddate
		      });
		     
		    }
		 
   $('#calendar').fullCalendar({
	      header: {
	        left: 'prev,next today',
	        center: 'title',
	        right: 'month'
	      },
	      defaultDate: td,
	      navLinks: false,
	      selectable: true,
	      selectHelper: true,
	      select: function(start, end) {
	    	  var title = $('#memo').val();
	    	  var check = confirm("메모를 저장 또는 수정 하시겠습니까?");	  
	          var eventData;
	          if (check  ) {
	        	  if(title!=""){	
	      	      	$.ajax({
	      	    		  url:'insertmemo',
	      	    		    type: 'post',
	      	    		    data: {
	      	    		    	'id': '${sessionScope.member.id}','memo': title, 'startdate': start.format(),'enddate':end.format()
	      	    		    },
	      	    		    success: function(data){
	      	    				if(data==1)	{
	      	    					alert("저장 되었습니다.");
	      	    				eventData = {
	      	    		              title: "메모",
	      	    		              start: start,
	      	    		              end: end     
	      	    		            };
	      	    		            $('#calendar').fullCalendar('renderEvent', eventData, true);
	      	    				}
	      	    				else if(data==3) alert("수정 되었습니다");
	      	    				else alert("다시 시도해주세요");
	      	    				},
	      	    		    error: function() {
	      	    		      alert('there was an error while fetching events!');
	      	    		    }
	        		  });
	            
	        	  }else{
		            	alert("메모를 입력해 주세요");
		            }// stick? = true
	          }
	          $('#calendar').fullCalendar('unselect');
	        },// can click day/week names to navigate views
	      editable: false,
	      eventLimit: false, // allow "more" link when too many events
	      events: eData,
	      eventClick: function(event) {
	    	   	var del= confirm("삭제 ->yes, 불러오기 -> no");
	    	   	if(del){
	    	   		
	    	   		$.ajax({
	    	    		  url:'deletememo',
	    	    		    type: 'post',
	    	    		    data: {
	    	    		    	'id': '${sessionScope.member.id}', 'startdate': event.start.format()
	    	    		    },
	    	    		    success: function(data){
	    	    				if(data==1)	{
	    	    					alert("삭제 완료");
	    	    					
	    	    					$('#calendar').fullCalendar('removeEvents', event._id);
	    	    		            }else{
	    	    		            	alert("다시 시도해주세요");
	    	    		            	location.href="goNews"; 
	    	    		            }
	    	    				},
	    	    		    error: function() {
	    	    		      alert('there was an error while fetching events!');
	    	    		    }
	      		  });
	    	   	}else{
	    	   	$.ajax({
    	    		  url:'findmemo',
    	    		    type: 'post',
    	    		    data: {
    	    		    	'id': '${sessionScope.member.id}', 'startdate': event.start.format()
    	    		    },
    	    		    success: function(data){
    	    				if(data==null)	{
    	    					alert("오류 발생");
    	    				
    	    		            }else{
    	    		            	if(event.start.format()==td){
        	    		            	$('#memoTitle').html("오늘의 메모");

    	    		            	}else{
        	    		            	$('#memoTitle').html(event.start.format()+"의 메모");
        	    		            		
    	    		            	}
    	    		            	temp=event.start.format();
    	    		            	
    	    		            	$('#memo').val(data.memo);
    	    		            }
    	    				},
    	    		    error: function() {
    	    		      alert('there was an error while fetching events!');
    	    		    }
      		  });}
	    	      return false;
	    	    },  
      /* droppable : true, // this allows things to be dropped onto the calendar !!!
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

      } */
    });
   $('#saveMemo').click(function(){
		var memo = $('#memo').val();
		
		
		var today = new Date();
		var mm= today.getMonth()+1; 
		var dd =today.getDate();
		var yy = today.getFullYear();
		if(dd<10) {
		    dd='0'+dd;
		} 
		if(mm<10) {
		    mm='0'+mm;
		} 
		var td=yy+'-'+mm+'-'+dd;
		$.ajax({
			url:"saveMemo",
			type:"post",
			//client에서 server로 가는 값
			data:{"userid": memo, "text":memo,"startDate":temp},
			success: function(data){
			if(data=="1"||data=="3"){
				alert("저장 되었습니다");
			}else{'오류 발생'};
			},fail: function(){
				alert("다음에 다시 시도해주세요");
			}
		});
		});
  
  });
</script>
</body>
</html>
