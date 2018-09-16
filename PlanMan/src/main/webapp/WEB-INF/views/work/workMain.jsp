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
<input type="hidden" id="MyID" value="${sessionScope.memberID}">
<input type="hidden" id="friendID" value="${sessionScope.friendID}">
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
        <ul class="nav navbar-nav" id="topMenuBarUl">
          <!-- Tasks: style can be found in dropdown.less -->
          <li class="dropdown messages-menu" id="pParentMessageBoard">
            
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
                  <a href="gotoupdate" class="btn btn-default btn-flat">개인정보 수정</a>
                </div>
                <div class="pull-right">
                  <a href="gotologout" class="btn btn-default btn-flat">로그아웃</a>
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
            <li><a href="friend2"><i class="fa fa-circle-o text-green"></i>Club Recommend</a></li>
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
    
        <div class="col-md-4"> 
      
          <!-- TO DO List -->
          <div class="box box-warning">
            <div class="box-header">
              <i class="ion ion-clipboard"></i>

              <h3 class="box-title">이번주 Work Schedule</h3>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
              <!-- See dist/js/pages/dashboard.js to activate the todoList plugin -->
              <ul class="todo-list">
	                <c:forEach var="schList" items="${schList}" varStatus="status">
	                <c:if test="${schList.doornot==1}">
	                	<li id="${schList.schseq}" class="done">
	                	<!-- drag handle -->
	                  <span class="handle">
	                        <i class="fa fa-ellipsis-v"></i>
	                        <i class="fa fa-ellipsis-v"></i>
	                      </span>
	                  <!-- checkbox -->
	                  <input type="checkbox" data-rno="${schList.schseq}" name="scheduleCk" class="chkbox" checked="checked">
	                  <!-- todo text -->
	                  <span class="text">${schList.eventtitle}</span>
	                  <!-- Emphasis label -->
	                  <small class="label label-warning"><i class="fa fa-clock-o"></i>${schList.startday}</small>
	                </li> 
	                </c:if>
	                <c:if test="${schList.doornot==0}">
	                	<li id="${schList.schseq}">
	                	<!-- drag handle -->
	                  <span class="handle">
	                        <i class="fa fa-ellipsis-v"></i>
	                        <i class="fa fa-ellipsis-v"></i>
	                      </span>
	                  <!-- checkbox -->
	                  <input type="checkbox" data-rno="${schList.schseq}" name="scheduleCk" class="chkbox">
	                  <!-- todo text -->
	                  <span class="text">${schList.eventtitle}</span>
	                  <!-- Emphasis label -->
	                  <small class="label label-warning"><i class="fa fa-clock-o"></i>${schList.startday}</small>
	                </li> 
	                </c:if>
	                 
	                </c:forEach>
              </ul>
            </div>
            <!-- /.box-body -->
            <div class="box-footer clearfix no-border">
            </div>
            <div class="box box-warning">
	            <div class="box-header ">
	              <h3 class="box-title">즐겨찾기</h3>
	            </div>
	            <div class="box-body no-padding">
		          <ul>
		               <c:forEach var='fcheck' items="${fcheck }">
		               <li><a href="javascript:void(0);" class="favorite" ><i class="fa fa-star text-yellow"></i>&nbsp;&nbsp;</a>&nbsp;&nbsp;<a href="${fcheck.locations }" target="_blank">${fcheck.title }</a><br>
				      <span>${news[2] }</span></li>
				      </c:forEach>
		          </ul>
	            </div>
	            <!-- /.box-body -->
          </div>
          </div>
          <!-- /.box -->
       </div>
       
       <div class="col-md-5"> 
         
          <!-- /.box -->
          <div class="box box-warning">
            <div class="box-header">
              <i class="ion ion-clipboard"></i>
              <h3 class="box-title">Main News</h3>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
              <!-- See dist/js/pages/dashboard.js to activate the todoList plugin -->
              
              <c:if test="${empty article}">
              <h3> 주요 뉴스가 없습니다.</h3>
              </c:if>
              <c:if test="${!empty article}">
		      <c:forEach var="news" items="${article }" varStatus="num">
		      <ul>
		      <c:set var="loop_flag" value="false" />
		      <c:forEach var='fcheck' items="${fcheck }">
		      
		      <c:if test="${fcheck.locations == news[1] }">
		       <c:set var="loop_flag" value="true" />
		      </c:if>
		      </c:forEach>
		      <c:if test="${not loop_flag }">      <li><a href="javascript:void(0);" class='favorite'><i class="fa fa-star-o text-yellow"></i></a>&nbsp;&nbsp;<a href="${news[1] }" target="_blank">${news[0] }</a><br>
		         <span>${news[2] }</span></li>
		      </c:if>
		      <c:if test="${ loop_flag}">         <li><a href="javascript:void(0);" class='favorite'><i class="fa fa-star text-yellow"></i></a>&nbsp;&nbsp;<a href="${news[1] }" target="_blank">${news[0] }</a><br>
		      <span>${news[2] }</span></li></c:if>
		      </ul>
		   
		      </c:forEach>
		      </c:if>
            </div>
            <!-- /.box-body -->
            
            
          </div>
          
          
        </div>
        <!-- /.col -->
        
        <div class="col-md-3">
        	<!-- /. 메모 box -->
	          <div class="box box-warning">
	            <div class="box-header with-border">
	              <h3 class="box-title">MEMO</h3>
	              <div class="box-tools">
	                <input type="button" class="datepicker btn btn-block btn-warning"  ></input>
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
<script>

  $(function () {    
     
     $('a.favorite').click(function() {
        alert("클릭");
        var locations = $(this).next().attr('href');
        if($(this).children('i').attr('class')=='fa fa-star text-yellow'){
           $.ajax({
               url:"deleteFavorites",
               type:"post",
               //client에서 server로 가는 값
               data:{"id": '${sessionScope.member.id}',"locations":locations},
               success: function(data){
                  if(data==1){
                     $(this).children('i').attr('class','fa fa-star-o text-yellow');
                  }else{alert("다시 시도해주세용");}
               
           },
                 fail: function(res){
              alert("다시 시도해주세용");
              }
     });
        }
        else if($(this).children('i').attr('class')=='fa fa-star-o text-yellow'){
           var title = prompt("이름을 입력해주세요");
           if(title==null||title==""){
              return;
           }
           var locations = $(this).next().attr('href');
           alert(title+"\n"+locations);
           $.ajax({
               url:"insertFavorites",
               type:"post",
               //client에서 server로 가는 값
               data:{"id": '${sessionScope.member.id}', "title":title,"locations":locations},
               success: function(data){
                  if(data==1){
                     $(this).children('i').attr('class','fa fa-star text-yellow');
                  }else{alert("다시 시도해주세용");}
               
           },
                 fail: function(res){
              alert("다시 시도해주세용");
              }
     });
       
      }
        location.reload();
     });
     
     $(".chkbox").change(function(){
	        if($(this).is(":checked")){
	            $.ajax({
	            	url:'chkschdule'
	      			,type:'post'
	      			,data:{
	      				"schseq":$(this).attr('data-rno')
	      			}
	      			,success: function (data){
	    				if(data="success"){
	    					alert("스케쥴 확인완료!")
	    				}	
	      			}
	            })
	            $(this).parent('li').addClass('done');
	        }else if($(this).is(":not(:checked)")){
	        	 $.ajax({
		            	url:'unchkschdule'
		      			,type:'post'
		      			,data:{
		      				"schseq":$(this).attr('data-rno')
		      			}
		      			,success: function (data){
		      				if(data="success"){
		    					alert("스케쥴 확인취소!")
		    				}	
		      			}
		        })
	            $(this).parent('li').removeClass('done');
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
   
   
	    $( ".datepicker" ).datepicker({ 
		       changeMonth: true, 
		       changeYear: true,
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
	    
	    $('.datepicker').datepicker('setDate', 'today');
   
  });
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
