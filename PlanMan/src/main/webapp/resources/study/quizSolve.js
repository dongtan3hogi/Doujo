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
						result += '<div class="form-group quiz' + index + '">';
						result += '<input type="hidden" id="page' + index + '" value="' + item.page + '">';
						result += '<input class="form-control" type="hidden" id="type' + index + '" value="' + item.TYPE + '">';
						result += '<input class="form-control" type="hidden" id="num' + index + '" value="' + item.NUM + '">';
						result += '<input class="form-control" type="hidden" id="set' + index + '" value="' + item.set + '">';
						result += '<input type="hidden" id="name' + index + '" value="' + item.name + '">';
						result += '<label>質問</label>';
						result += '<br/>';
						result += item.QUESTION;
						result += '</div>';
						
						result += '<div class="form-group">';
						result += '<label>正答</label><br/>';
						if(item.TYPE == 'multiplechoice'){
							result += '<label><input type="radio" name="answer' + index + '" value="1" class="minimal" checked>' + item.ANSWER1 + '</label><br/>';
							result += '<label><input type="radio" name="answer' + index + '" value="2" class="minimal">' + item.ANSWER2 + '</label><br/>';
							result += '<label><input type="radio" name="answer' + index + '" value="3" class="minimal">' + item.ANSWER3 + '</label><br/>';
							result += '<label><input type="radio" name="answer' + index + '" value="4" class="minimal">' + item.ANSWER4 + '</label><br/>';
							
						} else if(item.TYPE == 'shortanswer') {
							result += '<input class="form-control" type="text" name="answer' + index + '"><br/>';
						}
						result += '</div>';
						
					});
					result += '<div class="form-group" id="checkDiv">';
					result += '<input class="form-control" type="button" id="checkBtn" value="採点" onclick="checking()">';
					result += '</div>';
					
					//$("#quizSolveBoard").innerHTML = result;
					document.getElementById("quizSolveBoard").innerHTML = result;
					
					
					//$('#checkBtn').on("click", checking());
					
				} 
				, error: function(request,status,error){ 
			        //alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error); 
			    }  
			});
		});
		
		
		
			
		
	});
});



function checking(){
	/*var type = document.getElementById('type').value;
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
	}*/
	
	var solveSet = {"solveSet": "solveSet"}
	if($("div").hasClass("quiz0")){
		var type0 = document.getElementById('type0').value;
		var num0 = document.getElementById('num0').value;
		var answer0 = "";
		if(type0 == 'multiplechoice'){
			if (document.getElementsByName('answer0')[0].checked == 1){
				answer0 = document.getElementsByName('answer0')[0].value;
			} else if (document.getElementsByName('answer0')[1].checked == 1){
				answer0 = document.getElementsByName('answer0')[1].value;
			} else if (document.getElementsByName('answer0')[2].checked == 1){
				answer0 = document.getElementsByName('answer0')[2].value;
			} else if (document.getElementsByName('answer0')[3].checked == 1){
				answer0 = document.getElementsByName('answer0')[3].value;
			}
		} else if(type0 == 'shortanswer'){
			answer0 = document.getElementsByName("answer0")[0].value;
		}
		solveSet.type1=type0;
		solveSet.num1=num0;
		solveSet.answer1=answer0;
	}
	if($("div").hasClass("quiz1")){
		var type1 = document.getElementById('type1').value;
		var num1 = document.getElementById('num1').value;
		var answer1 = "";
		if(type1 == 'multiplechoice'){
			if (document.getElementsByName('answer1')[0].checked == 1){
				answer1 = document.getElementsByName('answer1')[0].value;
			} else if (document.getElementsByName('answer1')[1].checked == 1){
				answer1 = document.getElementsByName('answer1')[1].value;
			} else if (document.getElementsByName('answer1')[2].checked == 1){
				answer1 = document.getElementsByName('answer1')[2].value;
			} else if (document.getElementsByName('answer1')[3].checked == 1){
				answer1 = document.getElementsByName('answer1')[3].value;
			}
		} else if(type1 == 'shortanswer'){
			answer1 = document.getElementsByName("answer1")[0].value;
		}
		solveSet.type2=type1;
		solveSet.num2=num1;
		solveSet.answer2=answer1;
	}
	
	
	if($("div").hasClass("quiz2")){
		var type2 = document.getElementById('type2').value;
		var num2 = document.getElementById('num2').value;
		var answer2 = "";
		if(type2 == 'multiplechoice'){
			if (document.getElementsByName('answer2')[0].checked == 1){
				answer2 = document.getElementsByName('answer2')[0].value;
			} else if (document.getElementsByName('answer2')[1].checked == 1){
				answer2 = document.getElementsByName('answer2')[1].value;
			} else if (document.getElementsByName('answer2')[2].checked == 1){
				answer2 = document.getElementsByName('answer2')[2].value;
			} else if (document.getElementsByName('answer2')[3].checked == 1){
				answer2 = document.getElementsByName('answer2')[3].value;
			}
		} else if(type2 == 'shortanswer'){
			answer2 = document.getElementsByName("answer2")[0].value;
		}
		
		solveSet.type3=type2;
		solveSet.num3=num2;
		solveSet.answer3=answer2;
	}
		

	if($("div").hasClass("quiz3")){
		var type3 = document.getElementById('type3').value;
		var num3 = document.getElementById('num3').value;
		var answer3 = "";
		if(type3 == 'multiplechoice'){
			if (document.getElementsByName('answer3')[0].checked == 1){
				answer3 = document.getElementsByName('answer3')[0].value;
			} else if (document.getElementsByName('answer3')[1].checked == 1){
				answer3 = document.getElementsByName('answer3')[1].value;
			} else if (document.getElementsByName('answer3')[2].checked == 1){
				answer3 = document.getElementsByName('answer3')[2].value;
			} else if (document.getElementsByName('answer3')[3].checked == 1){
				answer3 = document.getElementsByName('answer3')[3].value;
			}
		} else if(type3 == 'shortanswer'){
			answer3 = document.getElementsByName("answer3")[0].value;
		}
		solveSet.type4=type3;
		solveSet.num4=num3;
		solveSet.answer4=answer3;
	}
	

	if($("div").hasClass("quiz4")){
		var type4 = document.getElementById('type4').value;
		var num4 = document.getElementById('num4').value;
		var answer4 = "";
		if(type4 == 'multiplechoice'){
			if (document.getElementsByName('answer4')[0].checked == 1){
				answer4 = document.getElementsByName('answer4')[0].value;
			} else if (document.getElementsByName('answer4')[1].checked == 1){
				answer4 = document.getElementsByName('answer4')[1].value;
			} else if (document.getElementsByName('answer4')[2].checked == 1){
				answer4 = document.getElementsByName('answer4')[2].value;
			} else if (document.getElementsByName('answer4')[3].checked == 1){
				answer4 = document.getElementsByName('answer4')[3].value;
			}
		} else if(type4 == 'shortanswer'){
			answer4 = document.getElementsByName("answer4")[0].value;
		}
		solveSet.type5=type4;
		solveSet.num5=num4;
		solveSet.answer5=answer4;
	}
	

	
	$.ajax({
		method   : 'post'
		, url    : 'grading'
		, data   : JSON.stringify(solveSet)
		, dataType : 'json'
		, contentType : 'application/json; charset=UTF-8'
		, success: function(data) {
			var quizResult = "";
			$.each(data, function(index, item){
				quizResult += index + '番 : ' + item + '\n';
			});
			swal(quizResult);
			//alert(quizResult);
			document.getElementById("checkDiv").innerHTML = '<input class="form-control" type="button" id="nextPageBtn" value="NEXT" onclick="NextPage()">';
			
			//$('#nextPageBtn').on("click", NextPage());
		} 	
	});
}



function NextPage(){
	var name = document.getElementById('name0').value;
	var set = document.getElementById('set0').value;
	var page = document.getElementById('page0').value;
	var quizSet = {
			"set": set
			,"page": page
			,"name": name
	}
	//alert(quizSet.set +", "+  quizSet.page +", "+ quizSet.name);
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
				result += '<div class="form-group quiz' + index + '">';
				result += '<input type="hidden" id="page' + index + '" value="' + item.page + '">';
				result += '<input class="form-control" type="hidden" id="type' + index + '" value="' + item.TYPE + '">';
				result += '<input class="form-control" type="hidden" id="num' + index + '" value="' + item.NUM + '">';
				result += '<input class="form-control" type="hidden" id="set' + index + '" value="' + item.set + '">';
				result += '<input type="hidden" id="name' + index + '" value="' + item.name + '">';
				result += '<label>질문</label>';
				result += '<br/>';
				result += item.QUESTION;
				result += '</div>';
				
				result += '<div class="form-group">';
				result += '<label>정답</label><br/>';
				if(item.TYPE == 'multiplechoice'){
					result += '<label><input type="radio" name="answer' + index + '" value="1" class="minimal" checked>' + item.ANSWER1 + '</label><br/>';
					result += '<label><input type="radio" name="answer' + index + '" value="2" class="minimal">' + item.ANSWER2 + '</label><br/>';
					result += '<label><input type="radio" name="answer' + index + '" value="3" class="minimal">' + item.ANSWER3 + '</label><br/>';
					result += '<label><input type="radio" name="answer' + index + '" value="4" class="minimal">' + item.ANSWER4 + '</label><br/>';
					
				} else if(item.TYPE == 'shortanswer') {
					result += '<input class="form-control" type="text" name="answer' + index + '"><br/>';
				}
				result += '</div>';
				
			});
			result += '<div class="form-group" id="checkDiv">';
			result += '<input class="form-control" type="button" id="checkBtn" value="採点" onclick="checking()">';
			result += '</div>';
			//$("#quizSolveBoard").innerHTML = result;
			document.getElementById("quizSolveBoard").innerHTML = result;
			
			
			//$('#check').on("click", checking());
			
			
		} 
		, error: function(request,status,error){ 
	        //alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error); 
	    }  
	});

}






	