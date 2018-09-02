$(function(){
	
	
	/*$(document).ready(function (){
		$('#showmakegroup').on('click', showmakegroup);
		$('#showsearchgroup').on('click', showsearchgroup);
		$('#showmygroup').on('click', showmygroup);
	});*/
	
});




function showMakeGroup() {
	var result = '';
		result += '<div class="form-group">';
		result += '<label>그룹명</label><input type="text" class="form-control" id="name" name="name">';
		result += '<label>태그</label><input type="text" class="form-control" id="teg" name="teg" placeholder="#insert#teg">';
		result += '<label>공개여부</label><select class="form-control" id="secret" name="secret">';
		result += '<option value="public">Public</option><option value="private">Private</option></select>';
		result += '<a href="" class="btn btn-primary btn-block margin-bottom" id="makegroup" onclick="makegroup()">Select</a>';
		result += '</div>';
	document.getElementById("functionboard").innerHTML = result;
	
	$(document).ready(function (){
		$('#makegroup').on('click', function makegroup() {
			var group = {
				"name" : $("#name").val()
				, "teg" : $("#teg").val()
				, "secret" : $("#secret").val()
			};
			
			$.ajax({
				method   : 'post'
				, url    : 'makingGroup'
				, data   : JSON.stringify(group)
				, dataType : 'json'
				, contentType : 'application/json; charset=UTF-8'
				, success: function (data){
					document.getElementById("functionboard").innerHTML = "";
				}
				, error: function(request,status,error){
			        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			    }
					
			});
		});
	});
}


function makegroup() {
	var group = {
		"name" : $(".name").val()
		, "teg" : $(".teg").val()
	};
	alert("흠");
	$.ajax({
		method   : 'post'
		, url    : 'makingGroup'
		, data   : JSON.stringify(group)
		, dataType : 'json'
		, contentType : 'application/json; charset=UTF-8'
		, success: function(resp) {
			alert(JSON.stringify(resp));
			alert(resp.username)
		} 
			
	});
}


function showMyGroup() {
	var lists = {
			"name" : "name"
			, "num" : "num"
	};
	
	$(document).ready(function (){
		$.ajax({
			method   : 'post'
			, url    : 'showMyGroup'
			, data   : JSON.stringify(lists)
			, dataType : 'json'
			, contentType : 'application/json; charset=UTF-8'
			, success: function(data) {
				var smgresult = '';
				$.each(data, function(index, item){
					smgresult += '<a class="btn btn-block btn-success" href="goGroup?num=' +item.NUM+ '&name=' +item.NAME+ '">' + item.NAME + "[" +item.NUM+ "]" + '</a><br/>';
				});
				
				document.getElementById("functionboard").innerHTML = smgresult;
				
			}
			, error: function(request,status,error){
		        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		        
		    }
		});
	});
}





function showSearchGroup() {
	var result = '';
		result += '<div class="input-group input-group-lg">';
		result += '<div class="input-group-btn">';
		result += '<button type="button" class="btn btn-info dropdown-toggle" data-toggle="dropdown">type';
		result += '<span class="fa fa-caret-down"></span></button>';
		result += '<ul class="dropdown-menu">';
		result += '<li><a id="SBGN">Group name</a></li>';
		result += '<li><a id="SBGC">Group code</a></li>';
		result += '<li><a id="SBLI">leader id</a></li>';
		result += '<li><a id="SBTG">TEG</a></li>';
		result += '</ul>';
		result += '</div>';
		result += '<input type="text" class="form-control" id="search" placeholder="Search...">';
		result += '</div>';
		
	document.getElementById("functionboard").innerHTML = result;
	
	
	
	$(document).ready(function (){
		var type = "";
		$('#SBGN').on('click', function makegroup() {
			type = "groupname";
			searchGroup();
		});
		
		$('#SBGC').on('click', function makegroup() {
			type = "groupseq";
			searchGroup();
		});
		
		$('#SBLI').on('click', function makegroup() {
			type = "groupleader";
			searchGroup();
		});
		
		$('#SBTG').on('click', function makegroup() {
			type = "groupteg";
			searchGroup();
		});
		
		
		function searchGroup() {
			var searching = {
				"type" : type
				,"search" : $("#search").val()
			};
			
			$.ajax({
				method   : 'post'
				, url    : 'searchGroup'
				, data   : JSON.stringify(searching)
				, dataType : 'json'
				, contentType : 'application/json; charset=UTF-8'
				, success: function (data){
					var smgresult = '';
					$.each(data, function(index, item){
						smgresult += '<a class="btn btn-block btn-success" href="goGroup?num=' +item.NUM+ '&name=' +item.NAME+ '">' + item.NAME + "[" +item.NUM+ "]" + '</a><br/>';
					});
					
					document.getElementById("functionboard").innerHTML = smgresult;
				}
				, error: function(request,status,error){
			        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			    }
					
			});
		}
	});
}