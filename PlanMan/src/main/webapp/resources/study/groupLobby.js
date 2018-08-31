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