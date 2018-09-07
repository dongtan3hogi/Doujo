$(function(){ 
	$(document).ready(function() {
		$('#quizchoice').change("click", function(){ 
			var quizSet = { 
					"select" : $("#quizchoice").val()
			}; 
			$.ajax({ 
				method   : 'post' 
				, url    : 'getQuizSet' 
				, data   : JSON.stringify(quizSet) 
				, dataType : 'json' 
				, contentType : 'application/json; charset=UTF-8' 
				, success: function showQuiz(data){
					var result = '';
					result += '';
					$.each(data, function(index, item){
						result += '<div class="form-group">';
						result += '<input type="hidden" id="page" value="' + item.page + '">';
						result += '<input class="form-control" type="hidden" id="type" value="' + item.TYPE + '">';
						result += '<input class="form-control" type="hidden" id="num" value="' + item.NUM + '">';
						result += '<input class="form-control" type="hidden" id="set" value="' + item.set + '">';
						result += '<input type="hidden" id="name" value="' + item.name + '">';
						result += '<label>질문</label>';
						result += '<br/>';
						result += item.QUESTION;
						result += '</div>';
						
						result += '<div class="form-group">';
						result += '<label>정답</label><br/>';
						if(item.TYPE == 'multiplechoice'){
							result += '<label><input type="radio" name="answer" value="1" class="minimal" checked>' + item.ANSWER1 + '</label><br/>';
							result += '<label><input type="radio" name="answer" value="2" class="minimal">' + item.ANSWER2 + '</label><br/>';
							result += '<label><input type="radio" name="answer" value="3" class="minimal">' + item.ANSWER3 + '</label><br/>';
							result += '<label><input type="radio" name="answer" value="4" class="minimal">' + item.ANSWER4 + '</label><br/>';
							
						} else if(item.TYPE == 'shortanswer') {
							result += '<input class="form-control" type="text" name="answer"><br/>';
						}
						result += '</div>';
						
						result += '<div class="form-group" id="checkDiv">';
						result += '<input class="form-control" type="button" id="checkBtn" value="체점" onclick="checking()">';
						result += '</div>';
					});
					
					//$("#quizSolveBoard").innerHTML = result;
					document.getElementById("quizSolveBoard").innerHTML = result;
					
					
					//$('#checkBtn').on("click", checking());
					
				} 
				, error: function(request,status,error){ 
			        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error); 
			    }  
			});
		});
		
		
		
			
		
	});
});



function checking(){
	var type = document.getElementById('type').value;
	var num = document.getElementById('num').value;
	var answer = "";
	if(type == 'multiplechoice'){
		if (document.getElementsByName('answer')[0].checked == 1){
			answer = document.getElementsByName('answer')[0].value;
		} else if (document.getElementsByName('answer')[1].checked == 1){
			answer = document.getElementsByName('answer')[1].value;
		} else if (document.getElementsByName('answer')[2].checked == 1){
			answer = document.getElementsByName('answer')[2].value;
		} else if (document.getElementsByName('answer')[3].checked == 1){
			answer = document.getElementsByName('answer')[3].value;
		}
	} else if(type == 'shortanswer'){
		answer = document.getElementsByName("answer")[0].value;
	}
	var solveSet = {
			"type": type
			,"num": num
			,"answer": answer
	}
	
	$.ajax({
		method   : 'post'
		, url    : 'grading'
		, data   : JSON.stringify(solveSet)
		, dataType : 'json'
		, contentType : 'application/json; charset=UTF-8'
		, success: function(data) {
			alert(data.result);
			document.getElementById("checkDiv").innerHTML = '<input class="form-control" type="button" id="nextPageBtn" value="NEXT" onclick="NextPage()">';
			
			//$('#nextPageBtn').on("click", NextPage());
		} 	
	});
}



function NextPage(){
	var name = document.getElementById('name').value;
	var set = document.getElementById('set').value;
	var page = document.getElementById('page').value;
	var quizSet = {
			"set": set
			,"page": page
			,"name": name
	}
	alert(quizSet.set +", "+  quizSet.page +", "+ quizSet.name);
	$.ajax({ 
		method   : 'post' 
		, url    : 'getQuizSet' 
		, data   : JSON.stringify(quizSet) 
		, dataType : 'json' 
		, contentType : 'application/json; charset=UTF-8' 
		, success: function showQuiz(data){
			var result = '';
			result += '';
			$.each(data, function(index, item){
				result += '<div class="form-group">';
				result += '<input type="hidden" id="page" value="' + item.page + '">';
				result += '<input class="form-control" type="hidden" id="type" value="' + item.TYPE + '">';
				result += '<input class="form-control" type="hidden" id="num" value="' + item.NUM + '">';
				result += '<input class="form-control" type="hidden" id="set" value="' + item.set + '">';
				result += '<input type="hidden" id="name" value="' + item.name + '">';
				result += '<label>질문</label>';
				result += '<br/>';
				result += item.QUESTION;
				result += '</div>';
				
				result += '<div class="form-group">';
				result += '<label>정답</label><br/>';
				if(item.TYPE == 'multiplechoice'){
					result += '<label><input type="radio" name="answer" value="1" class="minimal" checked>' + item.ANSWER1 + '</label><br/>';
					result += '<label><input type="radio" name="answer" value="2" class="minimal">' + item.ANSWER2 + '</label><br/>';
					result += '<label><input type="radio" name="answer" value="3" class="minimal">' + item.ANSWER3 + '</label><br/>';
					result += '<label><input type="radio" name="answer" value="4" class="minimal">' + item.ANSWER4 + '</label><br/>';
					
				} else if(item.TYPE == 'shortanswer') {
					result += '<input class="form-control" type="text" name="answer"><br/>';
				}
				result += '</div>';
				
				result += '<div class="form-group" id="checkDiv">';
				result += '<input class="form-control" type="button" id="checkBtn" value="체점" onclick="checking()">';
				result += '</div>';
			});
			
			//$("#quizSolveBoard").innerHTML = result;
			document.getElementById("quizSolveBoard").innerHTML = result;
			
			
			//$('#check').on("click", checking());
			
			
		} 
		, error: function(request,status,error){ 
	        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error); 
	    }  
	});

}






	