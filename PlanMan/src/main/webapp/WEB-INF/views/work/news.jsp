<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<% pageContext.setAttribute("br","<br/>");
	pageContext.setAttribute("cn","\n");%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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
<!-- Date Picker -->
<link rel="stylesheet"
	href="resources/main/bower_components/bootstrap-datepicker/dist/css/datepicker.css">
<link rel="stylesheet" href="./resources/style/profile.css">
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<style>
.colordate{
	background:yellow}
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
function goPage(a){//ページに移動するためのメソッド
	if("${type}"=='naver'){
		location.href="goPage?value="+a;
	}else{
	location.href="goPaging?value="+a;
	}
}
function goSearch(){//検索ためのメソッド
	var search=	document.getElementById("search").value;
	if(search==""){
		alert("検索語入力してください. ");
		return;
	}
	var special_pattern = /[`~!@#$%^&*|\\\";:\/]/gi;　//とくしゅもじをにゅりょくできないための正規式
	if(special_pattern.test(search)==true){
		alert("特殊文字は使用できません.");
		return false;
	}
	
	$.ajax({
		url: 'findKeyword',
		data: {"search" : search},
		type: "POST",
		error: function (res) {
		    //alert("error: "+ res);
		},
		success: function (res) {
			
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
function goSearch2(key){//友たちの検索したキーワードで検索するためのメソッド
	var search=	key.innerHTML;
	if("${type}"=="naver"){
		location.href="search?value="+search;
	}else{
	location.href="crawling?search="+search+"&type=${type}";
	}
	}	
$(document).ready(function(){
	var memodate="";
	$('a.favorite').click(function() {//気に入りのメソッド
        //alert("클릭");
        var clicked= $(this).children('i');
        var locations = $(this).next().attr('href');
        if($(this).children('i').attr('class')=='fa fa-star text-yellow'){
           $.ajax({
               url:"deleteFavorites",
               type:"post",
               //client에서 server로 가는 값
               data:{"id": '${sessionScope.member.id}',"locations":locations},
               success: function(data){
                  if(data==1){
                     clicked.attr('class','fa fa-star-o text-yellow');
                  }else{alert("再び試みてください.");}
               
           },
                 fail: function(res){
              alert("再び試みてください.");
              }
     });
        }
        else if($(this).children('i').attr('class')=='fa fa-star-o text-yellow'){
           var title = prompt("名前を入力してください.");
           if(title==null||title==""){
              return;
           }
           var locations = $(this).next().attr('href');
           //alert(title+"\n"+locations);
           $.ajax({
               url:"insertFavorites",
               type:"post",
               //client에서 server로 가는 값
               data:{"id": '${sessionScope.member.id}', "title":title,"locations":locations},
               success: function(data){
                  if(data==1){
                     clicked.attr('class','fa fa-star text-yellow');
                  }else{alert("再び試みてください..");}
               
           },
                 fail: function(res){
              alert("再び試みてください..");
              }
     });
       
      }
     });
$('#saveMemo').click(function(){//メモを保存するためのメソッド
	var memo = $('#memo').val();
	memo= memo.replace("\r\n","<br>");
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
	
     if(memodate==''){
   	 memodate = td;
     }
	$.ajax({
		url:"saveMemo",
		type:"post",
		//client에서 server로 가는 값
		data:{"userid": "${sessionScope.member.id}", "text":memo,"startDate":memodate},
		success: function(data){
		if(data=="success"){
			alert("保存されました.");
		}
		},fail: function(){
			alert("次に、再びチャレンジーしてください.");
		}
	});
	 location.reload();
	});
$('#translate').on('click',function(){//翻訳するメソッド
	  $.ajax({
		  url:"translate",
		  type:'post',
		  data:{'text': $('#search').val(),  'src': $('#src').val(), 'target':$('#target').val()},
		  success: function(data){
			  //alert(data);
			  $('#search').val(data);
		  },error:function(request,status,error){
			  if(decodeURIComponent(request.responseText)=="undefined"){
				  alert("誤った文字です.");
				  return;
			  }
			  $('#search').val(decodeURIComponent(request.responseText));
		  }
});
});
$('#keylist').on('click',function(){//私のキーワードを見せるメソッド
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
				result += "<input class='deleteBtn btn btn-warning' type='button' class='btn btn-warning' value='削除' onclick=\'return deleteKey(" + "\""+data[i].keyword+"\""+ ")\' style ='display:none'> &nbsp";
			}
			if(cnt<4){
				$('#list'+cnt).html(result);
			}
			
		},
		error:function(){
			alert("失敗しました.");
		}
	});	
});
$('#ff').on('submit',function(){//私と同じキーワードを多く検索した人のリストを見せるメソッド
	event.preventDefault();
	var sex = $(this).find('[name=sex]').val();
	var age = $(this).find('[name=age]').val();
	
	$.ajax({
		url:"findFriend",
		type:"post",
		//client에서 server로 가는 값
		data:{"userid": "${sessionScope.member.id}","sex": sex, "age" : age},
		success: function(data){
			if(data.length==0){
				$('#friendlist').html("");
				$('#flist').html("");
				$('#friendlist').html("キーワードが不足して友達を検索することはできません。 もっと利用してください.");
			return;
			}
		
			var result="";
			for(var i=0; i<data.length;i++){	
			result += "<a href='javascript:void(0)' class='friendBtn'>"+data[i].id+"</a> &nbsp";
		}
		$('#friendlist').html(result);//data.userid ㅐobject를 내가 원래 사용하던 형변화를 하려할 때, 다음과 같이 사용하면 됌
		},
		error:function(){
			alert("失敗しました.");
		}
	});	
	});
$(document).on("click",".friendBtn",function(){//友たちのキーワードを見せるメソッド
	var name = $(this).html();
	$.ajax({
		url:"friendKey",
		type:"get",
		//client에서 server로 가는 값
		data:{"id": name},
		success: function(data){
			if(data.length==0){
				$('#flist0').html("再び試みてください.");
			return;
			}
			var result="<div>"+name+"</div>";
			for(var i=0; i<data.length;i++){	
				result += "<a  href='javascript:void(0)' onclick='goSearch2(this)'>"+data[i].keyword+"</a> &nbsp";
		}
		$('#flist0').html(result);//data.userid ㅐobject를 내가 원래 사용하던 형변화를 하려할 때, 다음과 같이 사용하면 됌
		},
		error:function(){
			alert("失敗しました.");
		}
	});	
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
	
	$('#datepicker1').val("日付選択");	
	
	$( ".datepicker" ).datepicker({ //　メモの暦を見せるメソッド
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
    					alert("メモがありません.");	    			
    		            }else{
    		            	if(dateText==td){
	    		            	$('#memoTitle').html("今日のメモ");
    		            	}else{
    		            		memodate=dateText;
	    		            	$('#memoTitle').html(dateText+"のメモ");            		
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
        Work
        <small>${sessionScope.member.id}のスケジュール / <span id="clock"></span><c:if test="${sessionScope.eventtitle!=null}"> / 今の日程: ${sessionScope.eventtitle}</c:if></small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active">work</li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content">
      <div class="row">
             
      	 <div class="col-md-9">
      	  <!-- general form elements disabled -->
          <div class="box box-Warning">
            <div class="box-header with-border">
              <h3 class="box-work">ニュースを検索してください. (${type })</h3>
            </div>
            <!-- /.box-header -->
          <div class="box-body">
		    <!--The div element for the map -->
		    <input type="text" id="search"  >&nbsp<input type="button" class="btn btn-warning" onclick="goSearch()"value="検索">&nbsp <select id='src'><option value="ko">韓国語</option><option value="en">英語</option><option value="zh-CN">中国語</option><option value="ja">日本語</option></select>-->
	        <select id='target'><option value="ko">韓国語</option><option value="en">英語</option><option value="zh-CN">中国語</option><option value="ja">日本語</option></select>
	        &nbsp<input type="button" class="btn btn-warning" id="translate" value="번역"><br>
	        <c:if test="${!empty result}">
			<c:forEach var="news" items="${result }">
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
          
          
          <div class="box box-Warning">
            <div class="box-header with-border">
              <h3 class="box-title"><a id="keylist" href="javascript:;">私が検索した単語</a></h3>
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
			              <h3 class="box-title"><a href="javascript:;">他の人らキーワード検索</a></h3>
			            </div>
			            <div class="row2">
			     <form id= "ff"  method="post">
					性別:&nbsp<select name="sex"><option value="둘다">関係ない</option><option value="male">男子</option><option value="female">女子</option></select>
			  年:&nbsp<select name="age"><option value="0">関係ない</option><option value="10">10代</option><option value="20">20代</option><option value="30">30代</option><option value="40">40代</option><option value="50">50代 以上</option></select>
			&nbsp<input type="submit" class="btn btn-warning" value="探す" >
			</form>
			<div class="box box-warning" id="friendlist"></div>
			  <div class="box-body no-padding" id="flist0">
			  </div>
			
			</div>
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
               <h5 id= 'memoTitle' class="box-title">今日のメモ</h5>         
	           <textarea id ="memo" rows="20" value="text" style="min-width: 100%; border: 0;"></textarea> <br/>
	           <input type="button" class="btn btn-block btn-warning" value="貯蔵" id="saveMemo">   
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
