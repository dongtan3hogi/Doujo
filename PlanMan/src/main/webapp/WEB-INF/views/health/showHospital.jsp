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
  
  <style>
      /* Set the size of the div element that contains the map */
      #map {
        margin-top: 2%;
        margin-left: 5%;
        height: 70%;  
        width: 90%;  
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
        Health
        <small>${sessionScope.member.id}님의 스케쥴 / <span id="clock"></span><c:if test="${sessionScope.eventtitle!=null}"> / 지금 일정: ${sessionScope.eventtitle}</c:if></small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active">Timeline</li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content">
      <div class="row">
      	  <div class="box box-danger" style="margin-left: 20px; margin-right: 20px;">
      	  <div class="box-header">
              		<i class="fa fa-fw fa fa-heartbeat" style="color: #dd4b39"></i>
	                <h3 class="box-title">Show Hospital</h3>
          </div>
      		<input type="button" class="btn btn-info btn-danger" value="hospital" id="hospital" style="margin-top:1%; margin-left: 1%;">
      		<input type="button" class="btn btn-info btn-danger" value="pharmacy" id="pharmacy" style="margin-top:1%; margin-left: 1%;">
      		<input id="pac-input" class="form-control" type="text" placeholder="Search Box" style="margin-top:1%; width: 40%;">
			<div id="map"></div>
		  </div>
    <script>
     var map;
     var service;
     var infowindow;
     var bounds;
     var korea = {lat:37.541, lng: 126.986};
	 var japan = {lat: 35.41, lng: 139.46};
	
	 function initAutocomplete() {
	        map = new google.maps.Map(document.getElementById('map'), {
	          center: japan,
	          zoom: 10,
	          mapTypeControl: false,
	          mapTypeId: 'roadmap'
	        });
			
	        // Create the search box and link it to the UI element.
	        var input = document.getElementById('pac-input');
	        var hospital = document.getElementById('hospital');
	        var pharmacy = document.getElementById('pharmacy');
	        var searchBox = new google.maps.places.SearchBox(input);
	        map.controls[google.maps.ControlPosition.TOP_CENTER].push(input);
	        map.controls[google.maps.ControlPosition.TOP_CENTER].push(hospital);
	        map.controls[google.maps.ControlPosition.TOP_CENTER].push(pharmacy);
			
	        infowindow = new google.maps.InfoWindow();
	        // Bias the SearchBox results towards current map's viewport.
	        map.addListener('bounds_changed', function() {
	          searchBox.setBounds(map.getBounds());
	        });

	        var markers = [];
	        // Listen for the event fired when the user selects a prediction and retrieve
	        // more details for that place.
	        searchBox.addListener('places_changed', function() {
	          var places = searchBox.getPlaces();
			 
	          if (places.length == 0) {
	            return;
	          }

	          // Clear out the old markers.
	          markers.forEach(function(marker) {
	            marker.setMap(null);
	          });
	          markers = [];

	          // For each place, get the icon, name and location.
	          bounds = new google.maps.LatLngBounds();
	          places.forEach(function(place) {
	            if (!place.geometry) {
	              console.log("Returned place contains no geometry");
	              return;
	          }
	          var icon = {
	              url: place.icon,
	              size: new google.maps.Size(71, 71),
	              origin: new google.maps.Point(0, 0),
	              anchor: new google.maps.Point(17, 34),
	              scaledSize: new google.maps.Size(25, 25)
	          };

	          // Create a marker for each place.
	          markers.push(new google.maps.Marker({
	              map: map,
	              icon: icon,
	              title: place.name,
	              position: place.geometry.location
	          }));

	          if (place.geometry.viewport) {
	              // Only geocodes have viewport.
	              bounds.union(place.geometry.viewport);
	            } else {
	              bounds.extend(place.geometry.location);
	            }
	          });
	          map.fitBounds(bounds);
	        });
	          
	          $('#hospital').on('click',function(){
	        	
	        	  var bound2=bounds.getCenter();
	        	  var newbound=bound2.toString().split(',');
	        	 	
	        	  var lat=newbound[0].replace("(","");
	        	  var lng=newbound[1].replace(")","");
	        	 
	        	  var pyrmont = new google.maps.LatLng(lat,lng);

	        	  map.setCenter(pyrmont);
	        	  map.setZoom(14);

	        	  var request = {
	        	    location: pyrmont,
	        	    radius: '1500',
	        	    type: ["hospital"]
	        	  };
				  
	        	  var cityCircle = new google.maps.Circle({
	                  strokeColor: '#FF0000',
	                  strokeOpacity: 0.8,
	                  strokeWeight: 2,
	                  fillColor: '#FF0000',
	                  fillOpacity: 0.35,
	                  map: map,
	                  center: pyrmont,
	                  radius: 1500
	              });		
	        	  
	        	  service = new google.maps.places.PlacesService(map);
	        	  service.nearbySearch(request, callback);
	        	 
	        	  
	  	          
	          });
	          
			  $('#pharmacy').on('click',function(){
				 
				  var bound2=bounds.getCenter();
	        	  var newbound=bound2.toString().split(',');
	        	 
	        	  var lat=newbound[0].replace("(","");
	        	  var lng=newbound[1].replace(")","");
	        	 
	        	  var pyrmont = new google.maps.LatLng(lat,lng);
	        	  
	        	  map.setCenter(pyrmont);
	        	  map.setZoom(14);

	        	  var request = {
	        	    location: pyrmont,
	        	    radius: '1500',
	        	    type: ["pharmacy"]
	        	  };
				  
	        	  var cityCircle = new google.maps.Circle({
	                  strokeColor: '#FF0000',
	                  strokeOpacity: 0.8,
	                  strokeWeight: 2,
	                  fillColor: '#FF0000',
	                  fillOpacity: 0.35,
	                  map: map,
	                  center: pyrmont,
	                  radius: 1500
	              });	
	        	  
	        	  service = new google.maps.places.PlacesService(map);
	        	  service.nearbySearch(request, callback);
	        	  
	        	 
	          });
	         
	        
	 }
	 
	 
	 function callback(results, status) {
		  if (status == google.maps.places.PlacesServiceStatus.OK) {
			for (var i = 0; i < results.length; i++) {
			  var place = results[i];
		      createMarker(results[i]);
		    }
		  }
	 }
	 
	 function createMarker(place) {
	        var placeLoc = place.geometry.location;
	        var marker = new google.maps.Marker({
	          map: map,
	          position: place.geometry.location
	        });

	        google.maps.event.addListener(marker, 'click', function() {
	          infowindow.setContent('<div><strong>' + place.name + '</strong><br>' + '주소 : ' + place.vicinity + '</div>');
	          infowindow.open(map, this);
	        });
	 }

    </script>
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCoyqsgIiNF-Zeh9Jl4_Khj59L_T-Cs_o8&libraries=places&callback=initAutocomplete" async defer></script></div>
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
	  showtime();	
	  
	  setInterval(function(){
		  showtime();
	  },60000);
	  
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
