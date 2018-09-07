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

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
function goPage(a){
	if("${type}"=='naver'){
		location.href="goPage?value="+a;
	}else{
	location.href="goPaging?value="+a;
	}
}
function goSearch(){
	var search=	document.getElementById("search").value;
	if(search==""){
		alert("검색어 입력해주세요 ");
		return;
	}
	var special_pattern = /[`~!@#$%^&*|\\\";:\/]/gi;
	if(special_pattern.test(search)==true){
		alert("특수문자는 사용할 수 없습니다.");
		return false;
	}
	
	$.ajax({
		url: 'findKeyword',
		data: {"search" : search},
		type: "POST",
		error: function (res) {
		    alert("error: "+ res);
		},
		success: function (res) {
			alert(res);
			
		} 
	});	
	if("${type}"=="naver"){
		location.href="search?value="+search;
	}else{
	location.href="crawling?search="+search+"&type=${type}";
	}
	/* var blank_pattern = /[\s]/g;
	if(blank_pattern.test(search)==true){
		alert("공백은 사용할 수 없습니다");
		return false;
	} */
	}
function goSearch2(key){
	var search=	key.innerHTML;
	if("${type}"=="naver"){
		location.href="search?value="+search;
	}else{
	location.href="crawling?search="+search+"&type=${type}";
	}
	}	
$(document).ready(function(){
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
		data:{"userid": memo, "text":memo,"startDate":td},
		success: function(data){
		if(data=="success"){
			alert("저장 되었습니다");
		}
		},fail: function(){
			alert("다음에 다시 시도해주세요");
		}
	});
	});
$('#translate').on('click',function(){
	  $.ajax({
		  url:"translate",
		  type:'post',
		  data:{'text': $('#search').val(),  'src': $('#src').val(), 'target':$('#target').val()},
		  success: function(data){
			  alert(data);
			  $('#search').val(data);
		  },error:function(request,status,error){
			  if(decodeURIComponent(request.responseText)=="undefined"){
				  alert("잘못된 문자입니다");
				  return;
			  }
			  $('#search').val(decodeURIComponent(request.responseText));
		  }
});
});
$('#keylist').on('click',function(){
	$.ajax({		
		url:"keylist",
		type:"get",
		//client에서 server로 가는 값
		data:{"userid": "${sessionScope.member.id}"},
		success: function(data){
			var today = new Date();
			var result = "";
			var dates=[];
			var yy= today.getFullYear();
			var mm= today.getMonth()+1; 
			var dd =today.getDate();
			if(dd<10) {
			    dd='0'+dd;
			} 
			if(mm<10) {
			    mm='0'+mm;
			} 
			today= yy+'-'+mm+'-'+dd;	
			var cnt=-1;		
			var da="";
			var temp="";
			for(var i=0; i<data.length;i++){	
				da=data[i].searchDate;
				if(da!=temp){
					if(cnt>=0){
						$('#list'+cnt).html(result);
						result="";
					}else if(cnt>=4) return;
					cnt++;
					temp=da;
					if(da==today){
						result += "<div>오늘</div>";
					}else{
						result += "<div>"+da+"</div>";
					}
					}
				result += "<a class='goSearch' href='javascript:void(0)' onclick='goSearch2(this)'>"+data[i].keyword+"</a> ";
				result += "<input class='deleteBtn' type='button' value='삭제' onclick=\'return deleteKey(" + "\""+data[i].keyword+"\""+ ")\' style ='display:none'> &nbsp";
			}
			if(cnt<4){
				$('#list'+cnt).html(result);
			}
			
		},
		error:function(){
			alert("실패");
		}
	});	
});
$('#ff').on('submit',function(){
	event.preventDefault();
	var sex = $(this).find('[name=sex]').val();
	var age = $(this).find('[name=age]').val();
	
	$.ajax({
		url:"findFriend",
		type:"get",
		//client에서 server로 가는 값
		data:{"userid": "${userid}","sex": sex, "age" : age},
		success: function(data){
			if(data.length==0){
				$('#flist').html("");
				$('#friendlist').html("키워드가 부족하여 친구를 검색할 수 없습니다 ㅠㅠ 좀 더 이용해 주세요");
			return;
			}
		
			var result="";
			for(var i=0; i<data.length;i++){	
			result += "<a href='javascript:void(0)' class='friendBtn'>"+data[i].id+"</a> &nbsp";
		}
		$('#friendlist').html(result);//data.userid ㅐobject를 내가 원래 사용하던 형변화를 하려할 때, 다음과 같이 사용하면 됌
		},
		error:function(){
			alert("실패");
		}
	});	
	});
$(document).on("click",".friendBtn",function(){
	var name = $(this).html();
	$.ajax({
		url:"friendKey",
		type:"get",
		//client에서 server로 가는 값
		data:{"id": name},
		success: function(data){
			if(data.length==0){
				$('#flist0').html("다시 시도해 주세요");
			return;
			}
			var result="<div>"+name+"</div>";
			for(var i=0; i<data.length;i++){	
				result += "<a  href='javascript:void(0)' onclick='goSearch2(this)'>"+data[i].keyword+"</a> &nbsp";
		}
		$('#flist0').html(result);//data.userid ㅐobject를 내가 원래 사용하던 형변화를 하려할 때, 다음과 같이 사용하면 됌
		},
		error:function(){
			alert("실패");
		}
	});	
});
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
            <i class="fa fa-edit"></i> <span>Study</span>
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
            <i class="fa fa-suitcase"></i> <span>Work</span>
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
            <li><a href="gotoShowHospital"><i class="fa fa-circle-o text-red"></i> Hospital&Pharmarcy</a></li>
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
        <li class="treeview">
          <a href="#">
            <i class="fa fa-calendar"></i> <span>Schdule</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li><a href="gotoCalendar"><i class="fa fa-circle-o text-green"></i> Calendar</a></li>
            <li><a href="gotoTimeline"><i class="fa fa-circle-o text-green"></i> Timeline</a></li>
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
        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active">title</li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content">
      <div class="row">         
      	 
      	  <!-- general form elements disabled -->
          <div class="box box-Warning" style="margin-left: 20px; width: 90%;'">
            <div class="box-header with-border">
              <h3 class="box-title">뉴스를 검색해 주세요 (${type })</h3>
            </div>
            <!-- /.box-header -->
          <div class="box-body">
		    <!--The div element for the map -->
		    <input type="text" id="search"  >&nbsp<input type="button" onclick="goSearch()"value="검색">&nbsp <select id='src'><option value="ko">한글</option><option value="en">영어</option><option value="zh-CN">중국어</option><option value="ja">일본어</option></select>-->
	        <select id='target'><option value="ko">한글</option><option value="en">영어</option><option value="zh-CN">중국어</option><option value="ja">일본어</option></select>
	        &nbsp<input type="button" id="translate" value="번역"><br>
	        <c:if test="${!empty result}">
			<c:forEach var="news" items="${result }">
			<ul>
			<li><a href="${news[1] }" target="_blank">${news[0] }</a><br>
			<span>${news[2] }</span></li>
			</ul>
			</c:forEach>
			<div class="boardfooter">
			<c:if test="${navi.currentPage <= 5 }">
			◁◁
			</c:if>
			<c:if test="${navi.currentPage > 5 }">
			<a href="javascript:void(0);" onclick="goPage(${navi.currentPage-navi.pagePerGroup})">
			◁◁</a>
			</c:if>
			<c:if test="${navi.currentPage > 1}">
			<a href="javascript:void(0);" onclick="goPage(${navi.currentPage-1 })">◀</a>		</c:if>
			<c:if test="${navi.currentPage <= 1 }">
			◀
			</c:if>
			
			<c:forEach var="page" begin = "${navi.startPageGroup}" end="${navi.endPageGroup}">
			<c:if test="${navi.currentPage == page}">
			<a href="javascript:void(0);" onclick="goPage(${page })" style="color : red">${page}</a> &nbsp;
			</c:if>
			<c:if test="${navi.currentPage != page}">
			<a href="javascript:void(0);" onclick="goPage(${page })">${page }</a> &nbsp;
			</c:if>	<!-- &nbsp;한칸 띄어주는 거  -->
			</c:forEach>
			<c:if test="${navi.currentPage < navi.totalPageCount }">
			<a href="javascript:void(0);" onclick="goPage(${navi.currentPage+1 })">▶</a>
			</c:if>
			<c:if test="${navi.currentPage >= navi.totalPageCount }">
			▶
			</c:if>
			<c:if test="${navi.currentPage <= navi.totalPageCount-5 }">
			<a href="javascript:void(0);" onclick="goPage(${navi.currentPage+navi.pagePerGroup})">
			▷▷</a>
			</c:if>
			<c:if test="${navi.currentPage > navi.totalPageCount-5 }">
			▷▷
			</c:if>
			</div>
			</c:if>
            </div>
            
            
            <!-- /.box-body -->
          </div>
          <div class="box box-Warning" style="margin-left: 20px; width: 90%;'">
            <div class="box-header with-border">
              <h3 class="box-title"><a id="keylist" href="javascript:;">내가 검색한 단어들</a></h3>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
            <div class="row">
			        <div class="col-md-3 col-sm-6 mb-4" id="list0">
			          
			        </div>
			        <div class="col-md-3 col-sm-6 mb-4" id="list1">         
			        </div>
			        <div class="col-md-3 col-sm-6 mb-4" id="list2">
			        </div>
			        <div class="col-md-3 col-sm-6 mb-4" id="list3">          
			        </div>
			      </div>
			            </div>  
			            <div class="box-header with-border">
			              <h3 class="box-title"><a href="javascript:;">다른 사람들 키워드 검색	</a></h3>
			            </div>
			            <div class="row2">
			     <form id= "ff"  method="post">
					성별:&nbsp<select name="sex"><option value="둘다">상관없음</option><option value="남">남자</option><option value="여">여자</option></select>
			  나이:&nbsp<select name="age"><option value="0">상관없음</option><option value="10">10대</option><option value="20">20대</option><option value="30">30대</option><option value="40">40대</option><option value="50">50대 이상</option></select>
			&nbsp<input type="submit" value="찾기" >
			</form>
			<div class="col-md-3 col-sm-6 mb-4" id="friendlist"></div>
			  <div class="col-md-3 col-sm-6 mb-4" id="flist0">
			        </div>
			
			      </div>
          </div>
          <!-- /. box -->
        
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

  <!-- Add the sidebar's background. This div must be placed
       immediately after the control sidebar -->
  <div class="control-sidebar-bg"></div>
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
<!-- Page specific script -->

</body>
</html>
