$(function(){ 
	$(document).ready(function (){ 
		$('#quiztypeinput').on("click", function(){ 
			var qt = document.getElementById("quiztypeinput").value; 
			if(qt == "shortanswer"){ 
				document.getElementById("quiztypeinput").value = "multiplechoice"; 
				document.getElementById("type").value = "multiplechoice"; 
				 
				var contentAnswerDIV = '<div>'; 
				contentAnswerDIV += '<label><input type="radio" name="answernumber" value="1" class="minimal" checked>1번'; 
				contentAnswerDIV += '</label><input type="text" class="form-control" name="answer1" id="answer1"><br/>'; 
				contentAnswerDIV += '<label><input type="radio" name="answernumber" value="2" class="minimal">2번'; 
				contentAnswerDIV += '</label><input type="text" class="form-control" name="answer2" id="answer2"><br/>'; 
				contentAnswerDIV += '<label><input type="radio" name="answernumber" value="3" class="minimal">3번'; 
				contentAnswerDIV += ' </label><input type="text" class="form-control" name="answer3" id="answer3"><br/>'; 
				contentAnswerDIV += '<label> <input type="radio" name="answernumber" value="4" class="minimal">4번'; 
				contentAnswerDIV += '</label><input type="text" class="form-control" name="answer4" id="answer4">'; 
				contentAnswerDIV += '</div>'; 
				 
				$("#answerDIV > div").remove(); 
				$("#answerDIV").append(contentAnswerDIV);		 
			} else if(qt == "multiplechoice"){	 
				document.getElementById("quiztypeinput").value = "shortanswer"; 
				document.getElementById("type").value = "shortanswer"; 
				$("#answerDIV > div").remove(); 
				$("#answerDIV").append('<div><label>정답</label><input type="text" class="form-control" name="answer1" id="answer1"></div>'); 
				 
			} 
		}); 
	}); 
}); 
 
 
function changeSelect(){ 
	var select = document.getElementById("quizrecordname").value; 
	if(select == 'new'){ 
		document.getElementById("forNewName").innerHTML = '<input type="text" class="form-control" id="newrecord" name="newrecord">'; 
	} else{ 
		document.getElementById("forNewName").innerHTML = ''; 
	} 
} 
 
function check() { 
	var q = document.getElementsByName("question")[0]; 
	var a = document.getElementsByName("answer1")[0]; 
	var selecter = document.getElementById("quizrecordname"); 
	 
	if(selecter.value == 'new' && document.getElementById("newrecord").value.length <= 0){ 
		alert("새로운 폴더명을 입력하세요."); 
		document.getElementById("newrecord").focus(); 
		document.getElementById("newrecord").select(); 
		return false; 
	} else if(q.value.length <= 0){ 
		alert("질문을 입력하세요."); 
		q.focus(); 
		q.select(); 
		return false; 
	} else if(a.value.length <= 0){ 
		alert("정답을 입력하세요."); 
		a.focus(); 
		a.select(); 
		return false; 
	} 
	 
	/* alert(a + q); */ 
	var radioVal = $('input[name="answernumber"]:checked').val(); 
	//alert(radioVal); 
	var quiz = { 
			"quizrecordname" : $("#quizrecordname").val() 
			, "newrecord" : $("#newrecord").val() 
			, "type" : $("#type").val() 
			, "teg" : $("#teg").val() 
			, "question" : $("#question").val() 
			, "answer1" : $("#answer1").val() 
			, "answer2" : $("#answer2").val() 
			, "answer3" : $("#answer3").val() 
			, "answer4" : $("#answer4").val() 
			, "answernumber" : radioVal 
			, "id" :  $("#id").val() 
	}; 
	/*alert("quizrecordname:" +quiz.quizrecordname + ", newrecord:" + quiz.newrecord + ", type:" + quiz.type  
			+ "\n, teg:" + quiz.teg + ", question:" + quiz.question  
			+ "\n, answer1:" + quiz.answer1 + ", answer2:" + quiz.answer2  
			+ ",\n answer3:" + quiz.answer3 + ", answer4:" + quiz.answer4 
			+ ",\n answernumber:" + quiz.answernumber + ",\n id:" + quiz.id);*/
	$.ajax({ 
		method   : 'post' 
		, url    : 'quizInsert' 
		, data   : JSON.stringify(quiz) 
		, dataType : 'json' 
		, contentType : 'application/json; charset=UTF-8' 
		, success: function (data){ 
			//alert('[0] '+data.success + ', ' + data.newRecordName); 
			$("form").each(function() {   
	            this.reset(); 
	        }); 
			 
			var frm = document.getElementById('quizrecordname'); 
	        var op = new Option(); 
	        op.value = data.newRecordName; // 값 설정 
	        op.text = data.newRecordName; // 텍스트 설정 
	  
	        op.selected = true; // 선택된 상태 설정 (기본값은 false이며 선택된 상태로 만들 경우에만 사용) 
	  
	        frm.options.add(op); // 옵션 추가 
			//$('#quizrecordname').append(data.newRecordName); 
		} 
		, error: function(request,status,error){ 
	        //alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error); 
	    } 
			 
	}); 
	 
} 