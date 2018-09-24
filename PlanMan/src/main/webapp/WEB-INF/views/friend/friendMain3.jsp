<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
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

<link rel="stylesheet" href="./resources/style/board.css" />
<link rel="stylesheet" href="./resources/style/profile.css">
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<style>
.footer {
	position: fixed;
	left: 0;
	right: 100;
	bottom: 0;
	width: 100%;
	text-align: right;
}

#imgs {
	width: 100%;
	height: 100%;;
}

.js-load {
	display: none;
}

.js-load.active {
	display: block;
}

.is_comp.js-load:after {
	display: none;
}

.btn-wrap, .lists, .main {
	display: block;
}

div.all-list {
	position: absolute;
	left: 0;
	top: 0;
	width: 30%;
}
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<script type="text/javascript">
	function formCheck() {
		var title = document.getElementById("title");
		var content = document.getElementById("divedit");
		
		if ($('#title').val() == "" || $('#divedit').text() == ""|| $('#location').val() == "") {
			alert('タイトルと内容を入力してください');
			return false;
		}
		$('input[name=content]').val($('#divedit').text());

		return true;
	}
	function boardList() {
		location.href = "";
	}
</script>
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
            <li><a href="gotoShowHospital"><i class="fa fa-circle-o text-red"></i> Hospital&&;Pharmacy</a></li>
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
        Friend
        <small>${sessionScope.member.id}のスケジュール  / <span id="clock"></span><c:if test="${sessionScope.eventtitle!=null}"> / 今の日程: ${sessionScope.eventtitle}</c:if></small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="goWorkMain"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active">title</li>
      </ol>
    </section>

		<!-- Main content -->
		<section class="content">
			<div class="row">
			<c:if test="${empty sessionScope.member.job or empty sessionScope.member.hobby }">
				<script>
					swal("趣味、職業を登録しに行きます.");
					location.href = "joinfriend";
				</script>
			</c:if>
			
			<div class="col-md-6">
			
			<div class="box box-success">
				<div class="box-header">
					<i class="ion ion-clipboard"></i>
					<h3 class="box-title">[ Place_Reply ]</h3>
				</div>
				<!-- /.box-header -->
				<div class="box-body">
					<!-- See dist/js/pages/dashboard.js to activate the todoList plugin -->
	
	
					<form action="saveboard" method="post" enctype="multipart/form-data" onsubmit="return formCheck()">
						<div>
							<div>
								<strong>제목</strong>
								<input type="text" name="title" id="title"><input	type="hidden" name="id" value="${sessionScope.member.id}">
							</div>
							<div>
								<div><strong>내용</strong></div>
								<div>
									<div contentEditable="true" id="divedit"></div>
									<img id="imgs"/><input id="content" type="hidden" name="content">
								</div>
							</div>
							<div>
								<strong>著者</strong>
								${sessionScope.member.id}
							</div>
							<div>
								<strong>添付ファイル</strong> <input id="input_img" type="file" name="upload" />
							</div>
							<div>
								<strong>位置</strong>
								<input type="text" name="location" id="location" />
							</div>
							<div align="right">
								<input type="submit" class="btn btn-success" value="貯蔵">
							</div>
						</div>
					</form>
	
				</div>
			</div>
			
			</div>
			
			<div class="col-md-6">
			<div class="box box-success">
				<div class="box-header">
					<i class="ion ion-clipboard"></i>
					<h3 class="box-title">[ Friend' Records ]</h3>
				</div>
				<!-- /.box-header -->
				<div class="box-body">
	
					<input type="button" id="showList" class="btn btn-success" value="showList">&nbsp;&nbsp;<input type="button" class="btn btn-success" id="showAll" value="showAll">
					<c:if test="${!empty allList }">
					
						<div id="all-list">
							  <c:forEach var="flist" items="${ allList}">
								<img src="/doujo/display.do?path=${flist.savedfile }"
									width="19%" height="60"
									onclick="goDetail('${flist.savedfile}')"
									onError="this.style.visibility='hidden'" />
							</c:forEach>  
						</div>
						<div id="all-btn-wrap" class="btn-wrap">
							<a href="javascript:;" class="btn btn-success">더보기</a>
						</div>
					</c:if>
					<c:if test="${!empty flist }">
						<div id="js-list">
							  <c:forEach var="flist" items="${ flist}">
								<div class="flist_table">
									<div>
										<strong>題目</strong>
										${ flist.title}
									</div>
									<div>
										<div><strong>內容</strong></div>
										<div><div>${flist.content}</div> 
										<img src="/doujo/display.do?path=${flist.savedfile }" width="30%" height="auto" onError="this.style.visibility='hidden'" /></td>
									</div>
									<div>
										<strong>著者</strong>
										${flist.id}
									</div>
									<div>
										<strong>幸せも</strong>
										ハッピー: ${flist.happiness }, 悲しみ: ${flist.sadness }, 中立:
											${flist.neutral }, 驚き: ${flist.surprise }
									<div>
										<strong>位置</strong>
										${flist.location }
									</div>
								</div>
								<br>
							</c:forEach> 
	
						</div>
						<div id="js-btn-wrap" class="btn-wrap">
							<a href="javascript:;" class="btn btn-success">もっと見る</a>
						</div>
					</c:if>
					  <c:if test="${!empty oneboard}">
						<div id="one-list">
							<div class="flist_table">
								<div>
									<strong>題目</strong>
									${ oneboard.title}
								</div>
								<div>
									<div><strong>內容</strong></div>
									<div><div contentEditable="true">${oneboard.content}</div> 
									<img src="/doujo/display.do?path=${oneboard.savedfile }" width="10%" height="auto" onError="this.style.visibility='hidden'" /></div>
								</div>
								<div>
									<strong>著者</strong>
									${oneboard.id }
								</div>
								<div>
									<strong>幸せも</strong>
									ハッピー: ${oneboard.happiness }, 悲しみ: ${oneboard.sadness },
										中立: ${oneboard.neutral }, 驚き: ${oneboard.surprise }
						
								<div>
									<strong>位置</strong>
									${oneboard.location }
								</div>
							</div>
							<br>
						</div>
						<div id="back-btn-wrap" class="btn-wrap">
							<a href="javascript:;" class="btn btn-success">後に行く</a>
						</div>
					</c:if>  
				</div>
			</div>
			
			</div>
			
			</div>
		</section>
		
	</div>	
		
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
		function handleImgFileSelect(e) {
			var files = e.target.files;
			var filesArr = Array.prototype.slice.call(files);
			filesArr.forEach(function(f) {
				if (!f.type.match("image.*")) {
					swal("拡張子はイメージのみ可能です.");
					return;
				}
				sel_file = f;
				var reader = new FileReader();
				reader.onload = function(e) {
					$('#imgs').attr('src', e.target.result);
				}
				reader.readAsDataURL(f);
			});
		}
		function goDetail(data) {
			location.href = "showDetail?path=" + data;
		} 
		$(function() {
			$("#showList").on('click', function() {
				location.href = "showFriendList";
			});
			$("#showAll").on('click', function() {
				location.href = "friend3";
			});
			 $("#back-btn-wrap .button").on('click', function() {
				location.href = "friend3";
			}); 
			var listNum = 1;
			$("#all-btn-wrap .button")
					.on('click',function() {
								$.ajax({
											url : "morelist",
											type : "post",
											data : {
												"number" : listNum
											},
											success : function(data) {
												$.each(data,function(index,item) {
																	var line = "";
																	line += "<img src='/doujo/display.do?path='"
																			+ data[index].savedfile
																			+ "' width='19%' height='60'onclick='goDetail('"
																			+ data[index].savedfile
																			+ "');' onError='this.style.visibility='hidden''/>";
																	$(	'#all-list')	.append(line);
																});
												listNum++;
											}
										});
							});
			$
			var pageNum = 1;
			$("#js-btn-wrap .button")
					.click(
							function(e) { // Load More를 위한 클릭 이벤트e
								$
										.ajax({
											url : "moreboard",
											type : "post",
											data : {
												"number" : pageNum
											},
											success : function(data) {
												//alert(data[0].title);
												if (data.length != 3) {
													swal("最後の掲示物なんです.");

												}
												$
														.each(
																data,
																function(index,
																		item) {
																	var line = "";
																	line += "<div class='flist_table'><div><div>題目</div><div>"
																			+ data[index].title
																			+ "</div></div><div><div>內容</div><div><div>"
																			+ data[index].content
																			+ "</div>";
																	if (data[index].originalfile == null
																			|| data[index].originalfile == ""
																			|| data[index].originalfile == "null") {
																	} else {
																		line += "<img src='/doujo/display.do?path="
																				+ data[index].savedfile
																				+ "' width='30%' height='auto' onError='this.style.visibility='hidden''/>";
																	}
																	line += "</div></div><div><div>著者</div><div>"
																			+ data[index].id
																			+ "</div></div><div><div>幸せも</div><div>ハッピー:"
																			+ data[index].happiness
																			+ ", 悲しみ: "
																			+ data[index].sadness
																			+ " }, 中立: "
																			+ data[index].neutral
																			+ " }, 驚き: "
																			+ data[index].surprise
																			+ " }</tr>";
																	line += "<div><div>位置</div><div>"
																			+ data[index].location
																			+ "</div></div></div><div>";
																	//alert(data[index].originalfile);
																	$(	'#js-list')	.append(line);
																});
												pageNum++;
											}
										});
							});
			$('#input_img').on('change', handleImgFileSelect);
			$('a.favorite')
					.click(
							function() {
								//alert("클릭");
								var locations = $(this).next().attr('href');
								if ($(this).children('i').attr('class') == 'fa fa-star text-yellow') {
									$
											.ajax({
												url : "deleteFavorites",
												type : "post",
												//client에서 server로 가는 값
												data : {
													"id" : '${sessionScope.member.id}',
													"locations" : locations
												},
												success : function(data) {
													if (data == 1) {
														$(this)
																.children('i')
																.attr('class',
																		'fa fa-star-o text-yellow');
													} else {
														swal("次に、再びチャレンジーしてください.");
													}

												},
												fail : function(res) {
													swal("次に、再びチャレンジーしてください.");
												}
											});
								} else if ($(this).children('i').attr('class') == 'fa fa-star-o text-yellow') {
									var title = prompt("名前を入力してください.");
									if (title == null || title == "") {
										return;
									}
									var locations = $(this).next().attr('href');
									//alert(title + "\n" + locations);
									$
											.ajax({
												url : "insertFavorites",
												type : "post",
												//client에서 server로 가는 값
												data : {
													"id" : '${sessionScope.member.id}',
													"title" : title,
													"locations" : locations
												},
												success : function(data) {
													if (data == 1) {
														$(this)
																.children('i')
																.attr('class',
																		'fa fa-star text-yellow');
													} else {
														swal("次に、再びチャレンジーしてください.");
													}

												},
												fail : function(res) {
													swal("次に、再びチャレンジーしてください.");
												}
											});

								}
								location.reload();
							});

			$('#saveMemo').click(function() {
				var memo = $('#memo').val();
				if(memo==""){return false;}
				memo = memo.replace("\r\n", "<br>");
				//swal(memo);
				var today = new Date();
				var mm = today.getMonth() + 1;
				var dd = today.getDate();
				var yy = today.getFullYear();
				if (dd < 10) {
					dd = '0' + dd;
				}
				if (mm < 10) {
					mm = '0' + mm;
				}
				var td = yy + '-' + mm + '-' + dd;
				$.ajax({
					url : "saveMemo",
					type : "post",
					//client에서 server로 가는 값
					data : {
						"userid" : memo,
						"text" : memo,
						"startDate" : temp
					},
					success : function(data) {
						if (data == "1" || data == "3") {
							swal("保存されました");
						} else {
							'エラーが発生した'
						}
						;
					},
					fail : function() {
						swal("次に、再びチャレンジーしてください");
					}
				});
			});
		});
	</script>
</body>
</html>