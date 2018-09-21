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
  <link rel="stylesheet" href="./resources/style/profile.css">
  <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <script src="http://d3js.org/d3.v3.min.js"></script>
  <script src="resources/d3.layout.cloud.js"></script>
<style>
        .legend {
             border: 1px solid #555555;
              border-radius: 5px 5px 5px 5px;
              font-size: 0.8em;
              margin: 10px;
               padding: 8px;
         }
        .bld {
              font-weight: bold;
         }

.colordate{
	background:yellow}
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
$(document).ready(function(){
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
				swal("저장 되었습니다");
			}else{'오류 발생'};
			},fail: function(){
				swal("다음에 다시 시도해주세요");
			}
		});
		});


		var memodays="";
   		$.ajax({
 		   url:'memodays',
 		    type: 'post',
 		    data: {
 		    	'id': '${sessionScope.member.id}'
 		    },
 		    success: function(data){
 		    	memodays=data;
 		    	
 				},
 		    error: function() {
 		      swal('there was an error while fetching events!');
 		    }
		  });
   		
   		
   		$('#datepicker1').val("날짜 선택");	
   		
   		$( ".datepicker" ).datepicker({ 
   	       changeMonth: true, 
   	       changeYear: true,
   	       dateFormat: "yy-mm-dd",
   	       beforeShowDay: function(day) {
   	    	   if(memodays.indexOf($.datepicker.formatDate('yy-mm-dd', day)) != -1) return [true, "colordate","" ];
   	            else return [true, "", ""];
   	            
   	        },
   	       onSelect: function(dateText) {  
   	    	   //alert(dateText);
   	    	   $.ajax({
   	    		   url:'findmemo',
   	    		    type: 'post',
   	    		    data: {
   	    		    	'id': '${sessionScope.member.id}', 'startdate': dateText
   	    		    },
   	    		    success: function(data){
   	    				if(data==null)	{
   	    					swal("메모가 없습니다");	    			
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
   		
   		var memodays="";
   		$.ajax({
 		   url:'memodays',
 		    type: 'post',
 		    data: {
 		    	'id': '${sessionScope.member.id}'
 		    },
 		    success: function(data){
 		    	memodays=data;
 		    	
 				},
 		    error: function() {
 		      alert('there was an error while fetching events!');
 		    }
		  });
   		
   	 var frequency_list = $.ajax({
         url: "wordcloud",
         type:'post',
         dataType: "json",
         async: false
     }).responseText;
 
	 var x = JSON.parse(frequency_list);
	
	 var color = d3.scale.linear()
	         .domain([0,1,2,3,4,5,6,10,15,20,100])
	         .range(["#ddd", "#ccc", "#bbb", "#aaa", "#999", "#888", "#777", "#666", "#555", "#444", "#333", "#222"]);
	
	 d3.layout.cloud().size([600, 420])
	         .words(x)
	         .rotate(function() { return ~~(Math.random() * 70) - 35 ; })
	         .fontSize(function(d) { return d.size; })
	         .on("end", draw)
	         .start();

	 function draw(words) {
	     d3.select("#wordcloud").append("svg")
	             .attr("width", "600")
	             .attr("height", "420")
	             .attr("class", "wordcloud")
	             .append("g")
	             .attr("transform", "translate(200,200)")
	             .selectAll("text")
	             .data(words)
	             .enter().append("text")
	             .style("font-size", function(d) { d.size=d.size*10; //여기를 수정하여 글자 크기 조절 가능;
	            	 return d.size + "px"; })
	             .style("fill", function(d, i) { return color(i); })
	             .attr("text-anchor", "middle")
        .attr("transform", function(d) {
            return "translate(" + [Math.abs(d.x), d.y] + ")rotate(" + d.rotate + ")";
        })
	            .text(function(d) { return d.text; });
	 }  
	
});
	
	


</script>
  <style>
      /* Set the size of the div element that contains the map */
      #map {
        height: 400px;  /* The height is 400 pixels */
        width: 100%;  /* The width is the width of the web page */
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
        Work
        <small>${sessionScope.member.id}님의 스케쥴 / <span id="clock"></span><c:if test="${sessionScope.eventtitle!=null}"> / 지금 일정: ${sessionScope.eventtitle}</c:if></small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active">title</li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content">
      <div class="row">
      
      
         <div class="col-md-9">
				<div class="box box-Warning">
            <div class="box-header with-border">
              <h3 class="box-title">WORD CLOUD</h3>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
            <div id="wordcloud" align="center" >
           </div>
           <div class="legend"  align="center" style="width:60%;">
           빈도수가 높은 단어는 크지만 흐립니다. 빈도수가 낮은 단어는 작지만 진합니다.<br>
           Commonly used words are larger and slightly faded in color.  Less common words are smaller and darker.
           </div>
			   </div>
            <!-- /.box-body -->
          </div>      
          <!-- /. box -->
      	 </div>
      	  
      	 <div class="col-md-3">
      	  <!-- /. 메모 box -->
          <div class="box box-warning">
            <div class="box-header with-border">
              <h3 class="box-title">MEMO</h3>
              <div class="box-tools">
                <input type="button" class="datepicker btn btn-block btn-warning"  id="datepicker1"></input>
              </div>
            </div>
            <div class="box-body no-padding">
               <h5 id= 'memoTitle' class="box-title">오늘의 메모</h5>         
	           <textarea id ="memo" rows="20" value="text" style="min-width: 100%; border: 0;"></textarea> <br/>
	           <input type="button" class="btn btn-block btn-warning" value="저장" id="saveMemo">   
            </div>
            <!-- /.box-body -->
          </div>
          <!-- /. box -->
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
<!-- fullCalendar -->
<script src="resources/main/bower_components/moment/moment.js"></script>
<script src="resources/main/bower_components/fullcalendar/dist/fullcalendar.min.js"></script>
<!-- datepicker -->
<script src="//code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

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