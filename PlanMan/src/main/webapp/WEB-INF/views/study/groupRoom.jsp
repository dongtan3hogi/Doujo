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
 
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script> 
  <script type="text/javascript" src="<c:url value="/resources/study/sockjs-0.3.4.js"/>"></script>
  <script type="text/javascript">
	$(document).ready(function(){
		$("#message").keypress(function (e) {
			if (e.which == 13){
				sendMessage();
			}
	   	});
	});
  
	var selectedID = "";
	var GM = '1';
	var roomNum = "";
	
    $(document).ready(function() {

        $("#sendBtn").click(function() {
            sendMessage();
        });
        
        $("#quiznumBtn").click(function() {
            takeQuiznum();
        });
        
        

    });

    var sock;

    //웸소켓을 지정한 url로 연결한다.
    sock = new SockJS("<c:url value="/echo"/>");


    //자바스크립트 안에 function을 집어넣을 수 있음.
    //데이터가 나한테 전달되읐을 때 자동으로 실행되는 function
    sock.onmessage = onMessage;


    //데이터를 끊고싶을때 실행하는 메소드
    sock.onclose = onClose;

    
    
    
    /*시작시 발동하는 message*/
    //keyword:방번호:아이디
    sock.onopen = function(){
    	roomNum = document.getElementById("roomnum").value;
    	var sendmsg = "start:" + document.getElementById("roomnum").value + ":" + document.getElementById("yourID").value;
        sock.send(sendmsg);
        /* sock.send($("#message").val()); */
    };

    
    
    
    /*소켓으로 보내겠다. */
    //keyword:방번호:아이디:메세지
    function sendMessage() {
        var sendmsg = "message:" + document.getElementById("roomnum").value + ":" + document.getElementById("yourID").value + ":" + $("#message").val();
        sock.send(sendmsg);
    }
    
    
    
    
  	/* 퀴즈_태그목록&퀴즈폴더 중 하나 선택시 해당 퀴즈묶음의 퀴즈들의 번호 가져온다.*/
  	//keyword:방번호:아이디:선택한문제묶음
    function takeQuiznum() {
        var sendmsg = "quiznumber:" + document.getElementById("roomnum").value + ":" + document.getElementById("yourID").value + ":" + $("#quizchoice").val();
        sock.send(sendmsg);
    }
    
    
  	
  	
	/* 선택한 퀴즈번호에 해당하는 문제를 가져온다. */
	//keyword:방번호:아이디:선택한번호
	function takeQuiz(){
    	var sendmsg = "quiz:" + roomNum + ":" + document.getElementById("yourID").value + ":" + $("#quiznumberselect").val();
        sock.send(sendmsg);
    }
    
    
    

    
    
    
    //evt 파라미터는 웹소켓을 보내준 데이터다.(자동으로 들어옴)
    function onMessage(evt) {
        var data = evt.data;
        var textarea = document.getElementById("chatlog");
        var dataArray = data.split(':');
        
        if(dataArray[0] == 'message') {
        	var putMsg = '';
        	if(dataArray[1] == document.getElementById("yourID").value) {
        		//동일하다면 우측메시지
        		putMsg += '<div class="direct-chat-msg right">';
        		putMsg += '<div class="direct-chat-info clearfix">';
        		putMsg += '<span class="direct-chat-name pull-right">' + dataArray[1] + '</span>';
        		putMsg += '<span class="direct-chat-timestamp pull-left">{TIME}</span>';
        		putMsg += '</div>';
        		putMsg += '<img class="direct-chat-img" src="resources/userData/image/' + dataArray[1] + '.jpg" alt="message user image">';
        		putMsg += '<div class="direct-chat-text">';
        		putMsg += dataArray[2];
        		putMsg += '</div>';
        		putMsg += '</div>';
        		
        		
        	} else {
        		//다르다면 좌측메시지
        		putMsg += '<div class="direct-chat-msg">';
        		putMsg += '<div class="direct-chat-info clearfix">';
        		putMsg += '<span class="direct-chat-name pull-left">' + dataArray[1] + '</span>';
        		putMsg += '<span class="direct-chat-timestamp pull-right">{TIME}</span>';
        		putMsg += '</div>';
        		putMsg += '<img class="direct-chat-img" src="resources/userData/image/' + dataArray[1] + '.jpg" alt="message user image">';
        		putMsg += '<div class="direct-chat-text">';
        		putMsg += dataArray[2];
        		putMsg += '</div>';
        		putMsg += '</div>';
        		
        	}
        	textarea.innerHTML += putMsg;
        }
        
        if(dataArray[0] == 'quiznumber'){
        	var idSelectSet = {
        		"id" : dataArray[2]
        		, "select" : dataArray[3]
        	};
        	
        	$.ajax({
				method   : 'post'
				, url    : 'showInQuizSet'
				, data   : JSON.stringify(idSelectSet)
				, dataType : 'json'
				, contentType : 'application/json; charset=UTF-8'
				, success: function(data) {
					selectedID = dataArray[1];
		        	var sqlsr = '<select id="quiznumberselect" onchange="qnChange()"><option>=퀴즈번호=</option>';
					$.each(data, function(index, item){
						sqlsr += '<option value="' + item.NUM + '">' + item.NUM + '</option>';
					});
					sqlsr += '</select>';
		        	document.getElementById("quiznumberlist").innerHTML = sqlsr;
				}
				, error: function(){
					alert("통신에러");
				}
			});
        	
        	
        } if(dataArray[0] == 'quiz'){
        	var jsonMap = {
            		"id" : dataArray[2]
            		, "select" : dataArray[3]
            };
        	$.ajax({
				method   : 'post'
				, url    : 'inQuiznumOutQuiz'
				, data   : JSON.stringify(jsonMap)
				, dataType : 'json'
				, contentType : 'application/json; charset=UTF-8'
				, success: function(data){
					var result = '<div>[질문]<br/>' + data.QUESTION + '<input type="hidden" id="quiznum" value="' + data.NUM +'"><input type="hidden" id="type" value="' + data.TYPE + '"></div>';
					
					//객관식인지 주관식인지 판정
					if(data.TYPE == 'multiplechoice'){
						result += '<input type="radio" name="answer" value="1">' + data.ANSWER1 +'<input type="radio" name="answer" value="2">' + data.ANSWER2 +'<input type="radio" name="answer" value="3">' + data.ANSWER3 +'<input type="radio" name="answer" value="4">' + data.ANSWER4 +'';
					} else if(data.TYPE == 'shortanswer'){
						result += '<input type="text" name="answer">' + data.ANSWER1 +'';
					}
					result += '<input type="button" id="quizcheck" value="체점">';
					document.getElementById("functionboard").innerHTML = result;
					
					$(document).ready(function (){
												
						$('#quizcheck').on("click", function(){
							var type = document.getElementById('type').value;
							var quizseq = document.getElementById('quiznum').value;
							var answers = document.getElementsByName('answer');
							var answer = "";
							if(type == 'multiplechoice'){
								
								if (answers[0].checked == 1){
									answer = answers[0].value;
								} else if (answers[1].checked == 1){
									answer = answers[1].value;
								} else if (answers[2].checked == 1){
									answer = answers[2].value;
								} else if (answers[3].checked == 1){
									answer = answers[3].value;
								}
								
							} else if(type == 'shortanswer'){
								answer = answers[0].value;
							}
							
							var solveSet = {
									"answer": answer
									,"num": quizseq
									,"id": document.getElementById('yourID').value
							}
							//alert(solveSet.answer + ", " +solveSet.num + ", " + solveSet.id);
							$.ajax({
								method   : 'post'
								, url    : 'grading'
								, data   : JSON.stringify(solveSet)
								, dataType : 'json'
								, contentType : 'application/json; charset=UTF-8'
								, success: function(data) {
									alert(data.result);
								} 
										
							});
							
						});
						
						
					});
					
					
				},
				error: function(){
					alert("전송실패");
				} 
			});
        	
        }
    }


    function onClose(evt) {
        $("#chatboard").append("연결 끊김");
    }
    
    
    
    
    
    
    
    /* FUNCTION */
    
  
    
    
    
    
    
    
    
    /* function버튼 기능 */
    
    //리더's select 변경시
    function lfsChange(){
    	
    	
    	
    	
		var select = document.getElementById("leaderfunselect").value;
		if(select == 'authority'){
			document.getElementById("leaderfunctionview").innerHTML = '권한부여';
		
		} else if(select == 'sharing'){
			var SResult = '';
			SResult += '<select class="form-control" id="sharingselect" onchange="ssChange()">';
			SResult += '<option value="none" selected>==선택==</option>';
			SResult += '<option value="quiz">퀴즈</option>';
			SResult += '</select>';
			SResult += '<label id="sharingtargetview"></label>';
			//document.getElementById("leaderfunctionview").innerHTML = '<div class="form03"><select id="sharingselect" onchange="ssChange()"><option value="none" selected>==선택==</option><option value="quiz">퀴즈</option></select><span id="sharingtargetview"></span></div>';
			document.getElementById("leaderfunctionview").innerHTML = SResult;
		} else if(select == 'invite'){
			document.getElementById("leaderfunctionview").innerHTML = '<div class="form03"><br/><label for="1"><span style="font-size:20px;">아이디</span><input type="text" class="input-field" name="inviteId" id="inviteId" value="" /><input type="button" id="inviteBtn" value="확인" /></label>';
			$(document).ready(function() {
		       	$("#inviteBtn").click(function() {
		       		var inviteId = document.getElementById("inviteId").value;
		       		invite(inviteId);
		        });
		       	
		    });
			
			
			
		} else if(select == 'fire'){
			document.getElementById("leaderfunctionview").innerHTML = '강퇴';
		
		} else {
			document.getElementById("leaderfunctionview").innerHTML = '';
		}
	}
    
    /* 공유대상 셀렉터 변경시 */
    function ssChange(){
    	var quizshowvar = "";
		var select = document.getElementById("sharingselect").value;
		//quiz로 변경할경우
		if(select == 'quiz'){
			var idSet = {
	        	"id" : document.getElementById("yourID").value
	        	, "quiz" : "quiz"
	        };
			$.ajax({
				method   : 'post'
				, url    : 'showQuizList'
				, data   : JSON.stringify(idSet)
				, dataType : 'json'
				, contentType : 'application/json; charset=UTF-8'
				, success: function(data) {
		        	//Map[              ]	data
		        	//	  Map[      ]		data.recordMap, data.tegMap
		        	//        Map[] 		data.recordMap.name ...
		        	var qsr = '<select class="form-control" id="quizchoice"><option>=폴더명=</option>';
					$.each(data.recordMap, function(index, item){
						qsr += '<option value="r' + item.NAME + '">' + item.NAME + '</option>';
					});
					qsr += '<option>=태그명=</option>';
					$.each(data.tegMap, function(index, item){
						qsr += '<option value="r' + item.TEG + '">' + item.TEG + '[' + item.NUM + ']' + '</option>';
					});
					qsr += '</select><input type="button" id="quiznumBtn" value="선택" /><span id="quiznumberlist"></span>';
					alert(qsr);
					document.getElementById("sharingtargetview").innerHTML = qsr;
					$(document).ready(function() {
				       	$("#quiznumBtn").click(function() {
				            takeQuiznum();
				        });
				    });	
				}
				, error: function(){
					alert("통신에러");
				}
			});
			
			
		//그외 선택의 경우
		} else {
			document.getElementById("sharingtargetview").innerHTML = '';
		}
	}
    
    
    //퀴즈번호를 변경할시
    function qnChange(){
    	var select = document.getElementById("quiznumberselect").value;
    	$(document).ready(function() {
	       	takeQuiz();
	    });
    }
    
    function invite(inviteId){
    	var idSet = {
	        	"id" : inviteId
	        	, "groupseq" : document.getElementById("roomnum").value
	    };
    	$.ajax({
			method   : 'post'
			, url    : 'inviteGroup'
			, data   : JSON.stringify(idSet)
			, dataType : 'json'
			, contentType : 'application/json; charset=UTF-8'
			, success: function(data) {
				alert(data.id+"초대");
			}
			, error: function(){
				alert("통신에러");
			}
		});
    	
    }
    


</script>
<style type="text/css">
.dropdown-toggle{height:34px;}
</style>
<!-- head --> 
</head>
<body class="hold-transition skin-blue sidebar-mini"> 
<input type="hidden" id="yourID" value="${sessionScope.memberID}">
<input type="hidden" id="roomnum" value="${groupmember.groupseq}">
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
        <li class="header">MAIN NAVIGATION</li> 
        <li class="treeview"> 
          <a href="#"> 
            <i class="fa fa-dashboard"></i> <span>Study</span> 
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
            <i class="fa fa-dashboard"></i> <span>Work</span> 
            <span class="pull-right-container"> 
              <i class="fa fa-angle-left pull-right"></i> 
            </span> 
          </a> 
          <ul class="treeview-menu"> 
            <li><a href=""><i class="fa fa-circle-o"></i> Work 1</a></li> 
            <li><a href=""><i class="fa fa-circle-o"></i> Work 2</a></li> 
          </ul> 
        </li> 
        <li class="treeview"> 
          <a href="#"> 
            <i class="fa fa-dashboard"></i> <span>Health</span> 
            <span class="pull-right-container"> 
              <i class="fa fa-angle-left pull-right"></i> 
            </span> 
          </a> 
          <ul class="treeview-menu"> 
            <li><a href=""><i class="fa fa-circle-o"></i> Health 1</a></li> 
            <li><a href=""><i class="fa fa-circle-o"></i> Health 2</a></li> 
          </ul> 
        </li> 
        <li> 
          <a href="widgets.html"> 
            <i class="fa fa-th"></i> <span>Widgets</span> 
            <span class="pull-right-container"> 
              <small class="label pull-right bg-green">new</small> 
            </span> 
          </a> 
        </li> 
        <li><a href="https://adminlte.io/docs"><i class="fa fa-book"></i> <span>Documentation</span></a></li> 
        <li class="header">LABELS</li> 
        <li><a href="#"><i class="fa fa-circle-o text-red"></i> <span>Important</span></a></li> 
        <li><a href="#"><i class="fa fa-circle-o text-yellow"></i> <span>Warning</span></a></li> 
        <li><a href="#"><i class="fa fa-circle-o text-aqua"></i> <span>Information</span></a></li> 
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
        Title01 
        <small>설명이 설명설명</small> 
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
          <a href="compose.html" class="btn btn-primary btn-block margin-bottom">Button</a> 
 
          <div class="box box-solid"> 
            <div class="box-header with-border"> 
              <h3 class="box-title">Group</h3> 
              <div class="box-tools"> 
                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i> 
                </button> 
              </div> 
            </div> 
            <div class="box-body no-padding"> 
              <ul class="nav nav-pills nav-stacked"> 
                <li><a href="gotoGroupLobby"><i class="fa fa-inbox"></i> Group Menu</a></li>
              </ul> 
            </div> 
            <!-- /.box-body --> 
          </div> 
          <!-- /. box --> 
        </div> 
        <!-- /.col --> 
        <div class="col-md-9"> 
          
          
          
          
          
		<div class="box box-warning direct-chat direct-chat-warning">
			<div class="box-header with-border">
				<h3 class="box-title">Direct Chat</h3>

				<div class="box-tools pull-right">
					<button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
					</button>
				</div>
			</div>
			<!-- /.box-header -->
			<div class="box-body">
				<!-- Conversations are loaded here -->
				<div class="direct-chat-messages" id="chatlog">
                    
                    
					<!-- Message. Default to the left -->
                    <div class="direct-chat-msg">
                    	<div class="direct-chat-info clearfix">
                    		<span class="direct-chat-name pull-left">{NAME}</span>
                    		<span class="direct-chat-timestamp pull-right">{TIME}</span>
                   		</div>
                    	<img class="direct-chat-img" src="resources/userData/image/sop.jpg" alt="message user image">
                    	<div class="direct-chat-text">
                        	{CONTENT}
                    	</div>
                    </div>


                    <!-- Message to the right -->
                    <div class="direct-chat-msg right">
                    	<div class="direct-chat-info clearfix">
                    		<span class="direct-chat-name pull-right">{NAME}</span>
                        	<span class="direct-chat-timestamp pull-left">{TIME}</span>
                      	</div>
                      	<img class="direct-chat-img" src="resources/userData/image/karulin.jpg" alt="message user image">
                      	<div class="direct-chat-text">
                        	{CONTENT}
                      	</div>
                    </div>


                   
                <!-- /.direct-chat-pane -->
                </div>
                <!-- /.box-body -->
                <div class="box-footer">
                	<form action="#" method="post"  onsubmit="return false;">
                    	<div class="input-group">
                   			<input type="text" name="message" id="message" placeholder="Type Message ..." class="form-control">
                      		<span class="input-group-btn">
                         		<button type="button" class="btn btn-warning btn-flat" id="sendBtn">Send</button>
                      		</span>
                    	</div>
                  	</form>
                </div>
                <!-- /.box-footer-->
			</div>
          </div>
          
      	  <!-- general form elements disabled --> 
      	
          <div class="box box-primary"> 
            <div class="box-header with-border"> 
              <h3 class="box-title">Menu</h3> 
            </div> 
            <!-- /.box-header --> 
            <!-- <div class="box-body">
               <div class="margin">
                 <div class="btn-group">
                  <button type="button" class="btn btn-info">function</button>
                  <button type="button" class="btn btn-info dropdown-toggle" data-toggle="dropdown">
                    <span class="caret"></span>
                    <span class="sr-only">Toggle Dropdown</span>
                  </button>
                  <ul class="dropdown-menu" role="menu">
                    <li><a id="authority">권한부여</a></li>
                    <li><a id="sharing">화면공유</a></li>
                    <li><a id="invite">초대</a></li>
                    <li class="divider"></li>
                  </ul>
                </div>
                <span id="leaderfunctionview">
                
                </span>
               </div> -->
            
              <form role="form"> 
                 
                <!-- Function Key --> 
                <div class="form-group" id="leaderfunselectspan"> 
                  <label>Text</label> 
                  <select class="form-control" id="leaderfunselect" onchange="lfsChange()"> 
                    <option value="none" selected>==선택==</option>
					<option value="authority">권한 부여</option>
					<option value="sharing">화면공유</option>
					<option value="invite">초대</option>
                  </select> 
                </div> 
                 
                 
                <div class="form-group" id="leaderfunctionview">
                	
                </div>
                <div class="form-group" id="functionboard"> 
                </div>
              </form> 
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
 
  <!-- Control Sidebar --> 
  <aside class="control-sidebar control-sidebar-dark"> 
    <!-- Create the tabs --> 
    <ul class="nav nav-tabs nav-justified control-sidebar-tabs"> 
      <li><a href="#control-sidebar-home-tab" data-toggle="tab"><i class="fa fa-home"></i></a></li> 
      <li><a href="#control-sidebar-settings-tab" data-toggle="tab"><i class="fa fa-gears"></i></a></li> 
    </ul> 
    <!-- Tab panes --> 
    <div class="tab-content"> 
      <!-- Home tab content --> 
      <div class="tab-pane" id="control-sidebar-home-tab"> 
        <h3 class="control-sidebar-heading">Recent Activity</h3> 
        <ul class="control-sidebar-menu"> 
          <li> 
            <a href="javascript:void(0)"> 
              <i class="menu-icon fa fa-birthday-cake bg-red"></i> 
 
              <div class="menu-info"> 
                <h4 class="control-sidebar-subheading">Langdon's Birthday</h4> 
 
                <p>Will be 23 on April 24th</p> 
              </div> 
            </a> 
          </li> 
          <li> 
            <a href="javascript:void(0)"> 
              <i class="menu-icon fa fa-user bg-yellow"></i> 
 
              <div class="menu-info"> 
                <h4 class="control-sidebar-subheading">Frodo Updated His Profile</h4> 
 
                <p>New phone +1(800)555-1234</p> 
              </div> 
            </a> 
          </li> 
          <li> 
            <a href="javascript:void(0)"> 
              <i class="menu-icon fa fa-envelope-o bg-light-blue"></i> 
 
              <div class="menu-info"> 
                <h4 class="control-sidebar-subheading">Nora Joined Mailing List</h4> 
 
                <p>nora@example.com</p> 
              </div> 
            </a> 
          </li> 
          <li> 
            <a href="javascript:void(0)"> 
              <i class="menu-icon fa fa-file-code-o bg-green"></i> 
 
              <div class="menu-info"> 
                <h4 class="control-sidebar-subheading">Cron Job 254 Executed</h4> 
 
                <p>Execution time 5 seconds</p> 
              </div> 
            </a> 
          </li> 
        </ul> 
        <!-- /.control-sidebar-menu --> 
 
        <h3 class="control-sidebar-heading">Tasks Progress</h3> 
        <ul class="control-sidebar-menu"> 
          <li> 
            <a href="javascript:void(0)"> 
              <h4 class="control-sidebar-subheading"> 
                Custom Template Design 
                <span class="label label-danger pull-right">70%</span> 
              </h4> 
 
              <div class="progress progress-xxs"> 
                <div class="progress-bar progress-bar-danger" style="width: 70%"></div> 
              </div> 
            </a> 
          </li> 
          <li> 
            <a href="javascript:void(0)"> 
              <h4 class="control-sidebar-subheading"> 
                Update Resume 
                <span class="label label-success pull-right">95%</span> 
              </h4> 
 
              <div class="progress progress-xxs"> 
                <div class="progress-bar progress-bar-success" style="width: 95%"></div> 
              </div> 
            </a> 
          </li> 
          <li> 
            <a href="javascript:void(0)"> 
              <h4 class="control-sidebar-subheading"> 
                Laravel Integration 
                <span class="label label-warning pull-right">50%</span> 
              </h4> 
 
              <div class="progress progress-xxs"> 
                <div class="progress-bar progress-bar-warning" style="width: 50%"></div> 
              </div> 
            </a> 
          </li> 
          <li> 
            <a href="javascript:void(0)"> 
              <h4 class="control-sidebar-subheading"> 
                Back End Framework 
                <span class="label label-primary pull-right">68%</span> 
              </h4> 
 
              <div class="progress progress-xxs"> 
                <div class="progress-bar progress-bar-primary" style="width: 68%"></div> 
              </div> 
            </a> 
          </li> 
        </ul> 
        <!-- /.control-sidebar-menu --> 
 
      </div> 
      <!-- /.tab-pane --> 
      <!-- Stats tab content --> 
      <div class="tab-pane" id="control-sidebar-stats-tab">Stats Tab Content</div> 
      <!-- /.tab-pane --> 
      <!-- Settings tab content --> 
      <div class="tab-pane" id="control-sidebar-settings-tab"> 
        <form method="post"> 
          <h3 class="control-sidebar-heading">General Settings</h3> 
 
          <div class="form-group"> 
            <label class="control-sidebar-subheading"> 
              Report panel usage 
              <input type="checkbox" class="pull-right" checked> 
            </label> 
 
            <p> 
              Some information about this general settings option 
            </p> 
          </div> 
          <!-- /.form-group --> 
 
          <div class="form-group"> 
            <label class="control-sidebar-subheading"> 
              Allow mail redirect 
              <input type="checkbox" class="pull-right" checked> 
            </label> 
 
            <p> 
              Other sets of options are available 
            </p> 
          </div> 
          <!-- /.form-group --> 
 
          <div class="form-group"> 
            <label class="control-sidebar-subheading"> 
              Expose author name in posts 
              <input type="checkbox" class="pull-right" checked> 
            </label> 
 
            <p> 
              Allow the user to show his name in blog posts 
            </p> 
          </div> 
          <!-- /.form-group --> 
 
          <h3 class="control-sidebar-heading">Chat Settings</h3> 
 
          <div class="form-group"> 
            <label class="control-sidebar-subheading"> 
              Show me as online 
              <input type="checkbox" class="pull-right" checked> 
            </label> 
          </div> 
          <!-- /.form-group --> 
 
          <div class="form-group"> 
            <label class="control-sidebar-subheading"> 
              Turn off notifications 
              <input type="checkbox" class="pull-right"> 
            </label> 
          </div> 
          <!-- /.form-group --> 
 
          <div class="form-group"> 
            <label class="control-sidebar-subheading"> 
              Delete chat history 
              <a href="javascript:void(0)" class="text-red pull-right"><i class="fa fa-trash-o"></i></a> 
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
