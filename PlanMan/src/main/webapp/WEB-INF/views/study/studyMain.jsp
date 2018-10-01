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
  
  
  	
  	
  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
  	<div id="fortheprofilediv"></div>
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        Study
        <small>${sessionScope.member.id}のスケジュール / <span id="clock"></span><c:if test="${sessionScope.eventtitle!=null}"> / 今の日程: ${sessionScope.eventtitle}</c:if></small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active">Study</li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content">
      <div class="row"> 
      	<div class="col-md-4">
		  <!-- TO DO List -->
          <div class="box box-info">
            <div class="box-header">
              <i class="ion ion-clipboard"></i>

              <h3 class="box-title">今週 Study Schedule</h3>
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
	                  <small class="label label-info"><i class="fa fa-clock-o"></i>${schList.startday}</small>
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
	                  <small class="label label-info"><i class="fa fa-clock-o"></i>${schList.startday}</small>
	                </li> 
	                </c:if>
	                 
	                </c:forEach>
              </ul>
            </div>
            <!-- /.box-body -->
            <div class="box-footer clearfix no-border">
            </div>
              <!-- DONUT CHART -->
	          <div class="box box-info">
	            <div class="box-header with-border">
	              <h3 class="box-title">全体スケジュール進行率</h3>
	
	              <div class="box-tools pull-right">
	                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
	                </button>
	                <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
	              </div>
	            </div>
	            <div class="box-body">
	              <input type="hidden" id="failpercent" value="${failpercent}">	
	              <input type="hidden" id="sucesspercent" value="${sucesspercent}">	
	              <canvas id="pieChart" style="height:250px"></canvas>
	            </div>
	            <!-- /.box-body -->
	          </div>
	          <!-- /.box -->
          </div>
          <!-- /.box -->
        </div>  
          
        <div class="col-md-8">  
          <div class="box box-info">
            <div class="box-header">
              <i class="ion ion-clipboard"></i>
              <h3 class="box-title">Study Information</h3>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
              <!-- See dist/js/pages/dashboard.js to activate the todoList plugin -->
	              <div align="center" style="font-size: 24px;">
		              ${sessionScope.member.id}さん歓迎します. PlanManです.
		              <br/>                 
		                               勉強したい科目を選択してください.
              	  </div>
              	  <br/>
              	  <div style="display: inline;">
	              	  <input type="button" class="btn btn-block btn-info" id="English" style="width: 100px; display: inline; margin-left: 230px;" value="English" />
	              	  <input type="button" class="btn btn-block btn-info" id="Japanese" style="width: 100px; display: inline; margin-left: 10px;" value="Japanese" />
	              	  <input type="button" class="btn btn-block btn-info" id="Chinese" style="width: 100px; display: inline; margin-left: 10px;" value="Chinese" />
              	  </div>
              	  <br/>
              	  <div id="wordlist">
              	  </div>
            </div>
            <!-- /.box-body -->
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
<!-- ChartJS -->
<script src="resources/main/bower_components/chart.js/Chart.js"></script> 
<!-- Page specific script -->
<script>


  $(function () {
	  showtime();
	  
	  
	  setInterval(function(){
		  showtime();
	  },60000);
	  
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
	    					alert("スケジュール確認完了!")
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
		    					alert("スケジュール確認の取り消し!")
		    				}	
		      			}
		        })
	            $(this).parent('li').removeClass('done');
	        }
	        location.reload();	
	  });
	  
		//-------------
	    //- PIE CHART -
	    //-------------
	    // Get context with jQuery - using jQuery's .get() method.
	    var sucesspercent=$('#sucesspercent').val();
	    var failpercent=$('#failpercent').val();
	    var pieChartCanvas = $('#pieChart').get(0).getContext('2d')
	    var pieChart       = new Chart(pieChartCanvas)
	    var PieData        = [
	      {
	        value    : Math.round(sucesspercent*100)/100,
	        color    : '#00c0ef',
	        highlight: '#00c0ef',
	        label    : '完了'
	      },
	      {
	        value    : Math.round(failpercent*100)/100,
	        color    : '#f56954',
	        highlight: '#f56954',
	        label    : '未完了'
	      }
	    ]
	    var pieOptions     = {
	      //Boolean - Whether we should show a stroke on each segment
	      segmentShowStroke    : true,
	      //String - The colour of each segment stroke
	      segmentStrokeColor   : '#fff',
	      //Number - The width of each segment stroke
	      segmentStrokeWidth   : 2,
	      //Number - The percentage of the chart that we cut out of the middle
	      percentageInnerCutout: 50, // This is 0 for Pie charts
	      //Number - Amount of animation steps
	      animationSteps       : 100,
	      //String - Animation easing effect
	      animationEasing      : 'easeOutBounce',
	      //Boolean - Whether we animate the rotation of the Doughnut
	      animateRotate        : true,
	      //Boolean - Whether we animate scaling the Doughnut from the centre
	      animateScale         : false,
	      //Boolean - whether to make the chart responsive to window resizing
	      responsive           : true,
	      // Boolean - whether to maintain the starting aspect ratio or not when responsive, if set to false, will take up entire container
	      maintainAspectRatio  : true,
	    }
	    //Create pie or douhnut chart
	    // You can switch between pie and douhnut using the method below.
	    pieChart.Doughnut(PieData, pieOptions)
	    
	    $('#English').on('click',function(){
	    	 var wtype = "영어";
	    	 $.ajax({
					url:"goWord",
					type:"post",
					//client에서 server로 가는 값
					data:{"type": wtype},
					success: function(data){
						$('#wordlist').text('');
						var result="<ul class='products-list product-list-in-box'>";
						$.each(data, function(index, item){
				            result+="<li class='item'><div style='color: #2ECCFA; font-size: 20px; font-weight: bold;'>"+item[0]+"</div><div>"+item[1]+"</div></li>";
						});
						result+="</ul>";
						$('#wordlist').append(result);
					
			  		},
	  				fail: function(res){
				  		alert("再びチャレンジーしてください.");
				  	}
	  		});
	    });
	    
	    $('#Japanese').on('click',function(){
	    	var wtype = "일본어";
	    	 $.ajax({
					url:"goWord",
					type:"post",
					//client에서 server로 가는 값
					data:{"type": wtype},
					success: function(data){
						$('#wordlist').text('');
						var result="<ul class='products-list product-list-in-box'>";
						$.each(data, function(index, item){
				            result+="<li class='item'><div style='color: #2ECCFA; font-size: 20px; font-weight: bold;'>"+item[0]+"</div><div>"+item[1]+"</div></li>";
						});
						result+="</ul>";
						$('#wordlist').append(result);
					
			  		},
	  				fail: function(res){
				  		alert("再びチャレンジーしてください.");
				  	}
	  		});
	    });
	    
	    $('#Chinese').on('click',function(){
	    	var wtype = "중국어";
	    	 $.ajax({
					url:"goWord",
					type:"post",
					//client에서 server로 가는 값
					data:{"type": wtype},
					success: function(data){
						$('#wordlist').text('');
						var result="<ul class='products-list product-list-in-box'>";
						$.each(data, function(index, item){
				            result+="<li class='item'><div style='color: #2ECCFA; font-size: 20px; font-weight: bold;'>"+item[0]+"</div><div>"+item[1]+"</div></li>";
						});
						result+="</ul>";
						$('#wordlist').append(result);
					
			  		},
	  				fail: function(res){
				  		alert("再びチャレンジーしてください.");
				  	}
	  		});
	    });
	    
	   
	    $('#English').trigger('click');
	    
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
