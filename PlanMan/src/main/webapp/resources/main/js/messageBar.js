var onErrorResource="'resources/userData/image/unknown.png'";
var doccc = '<script src="https:/';
doccc += '/unpkg.com/sweetalert/dist/sweetalert.min.js"></script>';
document.write(doccc);
$(function(){ 
	$(document).ready(function (){
		//$('image').attr("onError", "this.src='resources/userData/image/unknown.png'");
		var MyID2 = document.getElementById("MyID").value; 
		var pprroo = '';
		pprroo += '<div id="forProfileDiv" class="modal" style="display: none;">';
		pprroo += '<div class="modal-content">';
		pprroo += '<form id="fileForm" action="profileImage"  method="post" enctype="multipart/form-data">';
		pprroo += '<div class="modal-header">';
		pprroo += '<span class="close">&times;</span>';
		pprroo += '프로필 사진 변경';
        pprroo += '</div>';
		pprroo += '<div class="modal-body">';
		pprroo += '<br/>';
        pprroo += '<img src="./resources/userData/image/'+MyID2+'.jpg" class="img-circle" onError="this.src='+onErrorResource+'" style="width:50px;height:50px;">';
        pprroo += '<img src="./resources/userData/image/unknown.png;" class="img-circle" id="proImg" style="width:50px;height:50px;float:right;">';
        pprroo += '</div>';
        pprroo += '<div class="modal-footer">';
        pprroo += '<input id="input_proImg" type="file" name="upload" />';
        pprroo += '<div align="right"><input type="submit" id="changeBtn" style="width: 200px;" value="확인" class="btn btn-block btn-primary" onclick="changeProfile()"/></div>';
        pprroo += '</div>';
        pprroo += '</form>';
        pprroo += '</div>';
        pprroo += '</div>';
        
        document.getElementsByClassName("sidebar-mini")[0].innerHTML += pprroo;
		
		
		
		
		showAlermList();
		showNewMessageList();
		var ssfi = document.getElementById("friendID").value;
		if ( ssfi != null & ssfi.length>0) {
			//alert("음"+ssfi);
			var ssfiAry = "";
			if ( ssfi.match(/#/)) {
				ssfiAry = ssfi.split('#');
				$.each(ssfiAry, function(index, item){
					//alert("아쿠"+item);
					messageBoardChange(item);
				});
			} else {
				messageBoardChange(ssfi);
			}
			
		}
		//$('.sidebar-toggle').trigger('click');
		/*$('#quiztypeinput').on("click", function() {
			//alert("호우");
	        sendMessage();
	    });*/
	});
});




var MyID = "";
var TargetID = "";
var messageListBoard = '';
	messageListBoard += '<li><ul class="menu">';
	messageListBoard += '<!-- start message -->';
	messageListBoard += '<li><a onclick="messageBoardChange()">';
	messageListBoard += '<div class="pull-left">';
	messageListBoard += '<img src="" class="img-circle" onError="this.src=./resources/userData/image/unknown.png;">';
	messageListBoard += '</div>';
	messageListBoard += '<h4>';
	messageListBoard += 'USERID01';
	messageListBoard += '<small><i class="fa fa-clock-o"></i> TIME</small>';
	messageListBoard += '</h4>';
	messageListBoard += '<p>내용입니다내용</p>';
	messageListBoard += '</a></li>';
	messageListBoard += '<!-- end message -->';
	messageListBoard += '</ul></li>';
	messageListBoard += '<li class="footer"><a onclick="showFriendList()">See All Friend</a></li>';



/*var messageBarBoard = ""
	messageBarBoard += '<li class="dropdown messages-menu">';
	messageBarBoard += '<a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-expanded="false">';
	messageBarBoard += '<i class="fa fa-envelope-o"></i>';
	messageBarBoard += '<span class="label label-success"></span>';
	messageBarBoard += '</a>';
	messageBarBoard += '<ul class="dropdown-menu" id="MessageBoard">';
	messageBarBoard += '<div class="box box-solid direct-chat direct-chat-primary">';
	messageBarBoard += '<div class="box-header with-border">';
	messageBarBoard += '<h3 class="box-title">Direct Chat</h3>';
	messageBarBoard += '<div class="box-tools pull-right">';
	messageBarBoard += '<button type="button" class="btn btn-box-tool" data-widget="remove" onclick="messageBoardChangeToList()"><i class="fa fa-times"></i>';
	messageBarBoard += '</button>';
	messageBarBoard += '</div>';
	messageBarBoard += '</div>';
	messageBarBoard += '<div class="box-body">';
	messageBarBoard += '<div class="direct-chat-messages" id="messageLog">';
	messageBarBoard += '</div>';
	messageBarBoard += '<div class="box-footer">';
	messageBarBoard += '<form action="#" method="post"  onsubmit="return false;">';
	messageBarBoard += '<div class="input-group">';
	messageBarBoard += '<input type="text" name="message" id="message" placeholder="Type Message ..." class="form-control">';
	messageBarBoard += '<span class="input-group-btn">';
	messageBarBoard += '<button type="button" class="btn btn-warning btn-flat" id="sendBtn">Send</button>';
	messageBarBoard += '</span>';
	messageBarBoard += '</div>';
	messageBarBoard += '</form>';
	messageBarBoard += '</div>';
	messageBarBoard += '</div>';
	messageBarBoard += '</div>';
	messageBarBoard += '</ul>';
	messageBarBoard += '</li>';*/
	

//메세지창 생성.
function messageBoardChange(friendId){
	//alert("음"+messageBarBoard);
	if(document.getElementById(friendId+'Li')!=null){
		//alert("이미있음");
	} else{
		//alert("없음.");
		var idSet = { 
				"friendID" : friendId
		}; 
		$.ajax({ 
			method   : 'post' 
			, url    : 'messageTypeNewToNor' 
			, data   : JSON.stringify(idSet) 
			, dataType : 'json' 
			, contentType : 'application/json; charset=UTF-8' 
			, success: function (data){ 
				var dummyFriend = "'"+friendId+"'";
				var messageBarBoard = ""
					messageBarBoard += '<li class="dropdown messages-menu" id="'+friendId+'Li">';
					messageBarBoard += '<a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-expanded="false">';
					messageBarBoard += '<i class="fa fa-commenting"><img class="direct-chat-img" src="resources/userData/image/' + friendId + '.jpg" alt="message user image" style="width:25px;height:25px;"  onError="this.src='+onErrorResource+';"></i>';
					messageBarBoard += '<span class="label label-success"></span>';	//count
					messageBarBoard += '</a>';
					messageBarBoard += '<ul class="dropdown-menu" id="MessageBoard">';
					messageBarBoard += '<div class="box box-solid direct-chat direct-chat-primary">';
					messageBarBoard += '<div class="box-header with-border">';
					messageBarBoard += '<h3 class="box-title">'+friendId+'</h3>';
					messageBarBoard += '<div class="box-tools pull-right">';
					messageBarBoard += '<button type="button" class="btn btn-box-tool" data-widget="remove" onclick="messageBoardClose(' + dummyFriend + ')"><i class="fa fa-times"></i>';
					messageBarBoard += '</button>';
					messageBarBoard += '</div>';
					messageBarBoard += '</div>';
					messageBarBoard += '<div class="box-body">';
					messageBarBoard += '<div class="direct-chat-messages" id="'+friendId+'messageLog">';
					
					
					
					
					var MyID = document.getElementById("MyID").value;
					
					$.each(data, function(index, item){
						if(item.GIVEID == MyID) {
				    		//내가보낸 메세지는 우측
				    		messageBarBoard += '<div class="direct-chat-msg right">';
				    		messageBarBoard += '<div class="direct-chat-info clearfix">';
				    		messageBarBoard += '<span class="direct-chat-name pull-right">' + item.GIVEID + '</span>';
				    		messageBarBoard += '<span class="direct-chat-timestamp pull-left">' + item.TIME + '</span>';
				    		messageBarBoard += '</div>';
				    		messageBarBoard += '<img class="direct-chat-img" src="resources/userData/image/' + item.GIVEID + '.jpg" alt="message user image" onError="this.src='+onErrorResource+';">';
				    		messageBarBoard += '<div class="direct-chat-text">';
				    		messageBarBoard += item.MESSAGE;
				    		messageBarBoard += '</div>';
				    		messageBarBoard += '</div>';
				    	} else {
				    		//상대가보낸 메세지는 좌측
				    		messageBarBoard += '<div class="direct-chat-msg">';
				    		messageBarBoard += '<div class="direct-chat-info clearfix">';
				    		messageBarBoard += '<span class="direct-chat-name pull-left">' + item.GIVEID + '</span>';
				    		messageBarBoard += '<span class="direct-chat-timestamp pull-right">' + item.TIME + '</span>';
				    		messageBarBoard += '</div>';
				    		messageBarBoard += '<img class="direct-chat-img" src="resources/userData/image/' + item.GIVEID + '.jpg" alt="message user image"  onError="this.src='+onErrorResource+';">';
				    		messageBarBoard += '<div class="direct-chat-text">';
				    		messageBarBoard += item.MESSAGE;
				    		messageBarBoard += '</div>';
				    		messageBarBoard += '</div>';
				    		
				    	}
					});
					
					
					
					
					
					messageBarBoard += '</div>';
					messageBarBoard += '<div class="box-footer">';
					messageBarBoard += '<form action="#" method="post"  onsubmit="return false;">';
					messageBarBoard += '<div class="input-group">';
					messageBarBoard += '<input type="text" id="'+friendId+'message"  placeholder="Type Message ..." class="form-control messageCon">';
					messageBarBoard += '<span class="input-group-btn">';
					messageBarBoard += '<button type="button" class="btn btn-warning btn-flat sendBtn" id="'+friendId+'">Send</button>';
					messageBarBoard += '</span>';
					messageBarBoard += '</div>';
					messageBarBoard += '</form>';
					messageBarBoard += '</div>';
					messageBarBoard += '</div>';
					messageBarBoard += '</div>';
					messageBarBoard += '</ul>';
					messageBarBoard += '</li>';
				
				
				document.getElementById("topMenuBarUl").innerHTML = messageBarBoard + document.getElementById("topMenuBarUl").innerHTML;
				$("#"+friendId+"messageLog").scrollTop($("#"+friendId+"messageLog")[0].scrollHeight);
				showNewMessageList();
				$(document).ready(function() {
			        $(".sendBtn").click(function() {
			        	var FI = $(this).attr('id');
			            sendMessage(FI);
			        });
			        
			        $(".messageCon").keypress(function (e) {
			        	if (e.which == 13){
				        	var FI = $(".sendBtn").attr('id');
				            sendMessage(FI);
				        }
				    });
			    });
			} 
			, error: function(request,status,error){ 
		        //alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error); 
		    } 
		});
		
		
		
		
	}
	
}	


//친구리스트를 가져온다.
function showFriendList(){
	var SFL = { 
			"showFriendList" : "showFriendList"
	}; 
	//alert("흠1");
	$.ajax({ 
		method   : 'post' 
		, url    : 'getMyFriendList' 
		, data   : JSON.stringify(SFL) 
		, dataType : 'json' 
		, contentType : 'application/json; charset=UTF-8' 
		, success: function (data){
			var result = '';
				result += '<li><ul class="menu">';
			if(data.friend1 != null){
				swal("친구가 없습니다.");
				return;
			}
			$.each(data, function(index, item){
				var dummyFriend = "'"+item.USERID+"'";
				result += '<li><a onclick="messageBoardChange('+dummyFriend+')">';
				result += '<div class="pull-left">';
				result += '<img src="resources/userData/image/'+item.USERID+'.jpg" class="img-circle" alt="User Image"  onError="this.src='+onErrorResource+';">';
				result += '</div>';
				result += '<h4>';
				result += item.USERID;
				//result += '<small><i class="fa fa-clock-o"></i> TIME</small>';
				result += '</h4>';
				//result += '<p>내용입니다내용</p>';
				result += '</a></li>';
			});
			messageListBoard += '</ul></li>';
			
			document.getElementById("parentMessageBoard").innerHTML = result;
			$('#pParentMessageBoard').attr("class", "dropdown messages-menu open");
			
			$('#aariaexpanded').attr("aria-expanded", "true");
		} 
		, error: function(request,status,error){ 
	        //alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error); 
	    } 
			 
	}); 
}




//새로운 메세지창을 생성한다.
function showNewMessageList(){
	var SNML = { 
			"showNewMessageList" : "showNewMessageList"
	}; 
	//alert("흠1");
	$.ajax({ 
		method   : 'post' 
		, url    : 'getMyNewMessageList' 
		, data   : JSON.stringify(SNML) 
		, dataType : 'json' 
		, contentType : 'application/json; charset=UTF-8' 
		, success: function (data){ 
			var result = '';
			result += '<a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-expanded="false" id="aariaexpanded">';
			result += '<i class="fa fa-envelope-o"></i>';
			result += '<span class="label label-success">' + data.countMessageMap.count + '</span>';
			result += '</a>';
			result += '<ul class="dropdown-menu" id="parentMessageBoard">';
			result += '<li><ul class="menu">';
			$.each(data, function(index, item){
				if(item.count == 'ok'){
					var dummyFriend = "'"+item.GIVEID+"'";
					//result += '<!-- start message -->';
					result += '<li id="SNMLLi'+dummyFriend+'"><a onclick="messageBoardChange('+dummyFriend+')">';
					result += '<div class="pull-left">';
					result += '<img src="resources/userData/image/'+item.GIVEID+'.jpg" class="img-circle"  onError="this.src='+onErrorResource+';">';
					result += '</div>';
					result += '<h4>';
					result += item.GIVEID+'<span class="label label-success">' + item.CT + '</span>';
					result += '<small><i class="fa fa-clock-o"></i>'+item.TIME+'</small>';
					result += '</h4>';
					result += '<p>'+item.MESSAGE+'</p>';
					result += '</a></li>';
					//result += '<!-- end message -->';
				}
			});
			result += '</ul></li>';
			result += '<li class="footer"><a onclick="showFriendList()">See All Friend</a></li>';
			result += '</ul>';
			result += '</li>';
			result += '</ul></li>';
			
			document.getElementById("pParentMessageBoard").innerHTML = result;
		} 
		, error: function(request,status,error){ 
	        //alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error); 
	    } 
			 
	}); 
}


















//메세지창에서 종료버튼을 누를경우 창을 닫는다.
function messageBoardClose(friendId){
	$("#"+friendId+"Li").remove();
	//alert('#'+friendId+'Li');
	//document.getElementById("parentMessageBoard").innerHTML = messageListBoard;
	var MTNTO = { 
			"friendID" : friendId
	}; 
	//alert("흠1");
	$.ajax({ 
		method   : 'post' 
		, url    : 'messageTypeNorToOld' 
		, data   : JSON.stringify(MTNTO) 
		, dataType : 'json' 
		, contentType : 'application/json; charset=UTF-8' 
		, success: function (data){ 
			
		} 
		, error: function(request,status,error){ 
	        //alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error); 
	    } 
			 
	});
}	



//자바스크립트 안에 function을 집어넣을 수 있음.
//데이터가 나한테 전달되읐을 때 자동으로 실행되는 function
sock.onmessage = onMessage;


//데이터를 끊고싶을때 실행하는 메소드
sock.onclose = onClose;


function onClose(evt) {
    $("#data").append("연결 끊김");
}


function sendMessage(FI) {
    var sendmsg = "mime" + ":" + FI + ":" + document.getElementById("MyID").value + ":" + $("#"+FI+"message").val();
    sock.send(sendmsg);
}







//evt 파라미터는 웹소켓을 보내준 데이터다.(자동으로 들어옴)

function onMessage(evt) {
    var data = evt.data;
    var dataArray = data.split(':');
    var MyID = document.getElementById("MyID").value;
    //alert(data+","+document.getElementById("MyID").value);
    if(dataArray[1] == MyID || dataArray[2] == MyID) {
    	var putMsg = '';
    	var d = new Date();
    	var time = leadingZeros(d.getFullYear(), 4) + '-' + leadingZeros(d.getMonth() + 1, 2) + '-' + leadingZeros(d.getDate(), 2) + ' ' +
    	    leadingZeros(d.getHours(), 2) + ':' + leadingZeros(d.getMinutes(), 2);
    	var giveid = "";
    	var takeid = "";

    	if(dataArray[2] == MyID) {
    		//내가보낸 메세지는 우측
    		putMsg += '<div class="direct-chat-msg right">';
    		putMsg += '<div class="direct-chat-info clearfix">';
    		putMsg += '<span class="direct-chat-name pull-right">' + dataArray[2] + '</span>';
    		putMsg += '<span class="direct-chat-timestamp pull-left">' + time + '</span>';
    		putMsg += '</div>';
    		putMsg += '<img class="direct-chat-img" src="resources/userData/image/' + dataArray[2] + '.jpg" alt="message user image"  onError="this.src='+onErrorResource+';">';
    		putMsg += '<div class="direct-chat-text">';
    		putMsg += dataArray[3];
    		putMsg += '</div>';
    		putMsg += '</div>';
    		takeid = dataArray[1];
    		
    	} else {
    		//상대가보낸 메세지는 좌측
    		putMsg += '<div class="direct-chat-msg">';
    		putMsg += '<div class="direct-chat-info clearfix">';
    		putMsg += '<span class="direct-chat-name pull-left">' + dataArray[2] + '</span>';
    		putMsg += '<span class="direct-chat-timestamp pull-right">' + time + '</span>';
    		putMsg += '</div>';
    		putMsg += '<img class="direct-chat-img" src="resources/userData/image/' + dataArray[2] + '.jpg" alt="message user image"  onError="this.src='+onErrorResource+';">';
    		putMsg += '<div class="direct-chat-text">';
    		putMsg += dataArray[3];
    		putMsg += '</div>';
    		putMsg += '</div>';
    		takeid = dataArray[2];
    	}
    	//alert(putMsg);
    	var textarea = document.getElementById(takeid+"messageLog");
    	textarea.innerHTML += putMsg;
    	$("#"+takeid+"messageLog").scrollTop($("#"+takeid+"messageLog")[0].scrollHeight);
    	$(".messageCon").val('');
    	var message = { 
    			"giveid" : MyID,
    			"takeid" : takeid,
    			"message" : dataArray[3],
    			"readcheck" : "new"
    	};
    	$.ajax({ 
    		method   : 'post' 
    		, url    : 'insertMessageIntoDB' 
    		, data   : JSON.stringify(message) 
    		, dataType : 'json' 
    		, contentType : 'application/json; charset=UTF-8' 
    		, success: function (data){ 
    			
    		} 
    		, error: function(request,status,error){ 
    	        //alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error); 
    	    } 
    			 
    	});
    	
    }
}




function leadingZeros(n, digits) {
	var zero = '';
	n = n.toString();

	if (n.length < digits) {
		for (i = 0; i < digits - n.length; i++)
			zero += '0';
	}
	return zero + n;
}









function showAlermList(){
	var SNML = { 
			"showAlermList" : "showAlermList"
	}; 
	//alert("흠1");
	$.ajax({ 
		method   : 'post' 
		, url    : 'showAlermList' 
		, data   : JSON.stringify(SNML) 
		, dataType : 'json' 
		, contentType : 'application/json; charset=UTF-8' 
		, success: function (data){ 
			
			var result = '';
			result +='<li class="dropdown notifications-menu">';
			result +='<a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-expanded="false">';
			result +='<i class="fa fa-bell-o"></i>';
			result +='<span class="label label-warning">' + data.alermCount.count + '</span>';
			result +='</a>';
			result +='<ul class="dropdown-menu">';
			result +='<li class="header">' + data.alermCount.count + '개의 확인하지 않은 알림이 있습니다.</li>';
			result +='<li>';
			result +='<ul class="menu">';
			$.each(data, function(index, item){
				if(item.count == 'ok'){
					if(item.EVENTTYPE == "studygroupjoin"){
						var codes = "'"+ item.CODE +"'";
						result +='<li id=alermBoardLi"' +item.CODE+ '">';
						result +='<a>';
						result +='<i class="fa fa-users text-aqua"></i> '+item.SENDID+'님이 '+item.VARIABLE1+'에 가입을 원합니다. ';
						result +='</a>';
						result +='<button type="button" class="btn btn-default btn-sm" onclick="groupAlermOkBtn(' +codes+ ')"><i class="fa fa-check-circle-o"></i></button>';
						result +='<button type="button" class="btn btn-default btn-sm" onclick="groupAlermNoBtn(' +codes+ ')"><i class="fa fa-remove"></i></button>';
						result +='<input type="hidden" id="code' +item.CODE+ '" value="' + item.CODE + '" >';
						result +='<input type="hidden" id="id' +item.CODE+ '" value="' + item.SENDID + '" >';
						result +='<input type="hidden" id="roomnum' +item.CODE+ '" value="' + item.CONTENT + '" >';
						result +='</li>';
						
					} else if(item.EVENTTYPE == "friendapply"){
						var codes = "'"+ item.CODE +"'";
						result +='<li id=alermBoardLi"' +item.CODE+ '">';
						result +='<a>';
						result +='<i class="fa fa-user text-red"></i> '+item.SENDID+' 님을 친구신청 하시겠습니까?';
						result +='</a>';
						result +='<button type="button" class="btn btn-default btn-sm" onclick="friendAlermOkBtn(' +codes+ ')"><i class="fa fa-check-circle-o"></i></button>';
						result +='<button type="button" class="btn btn-default btn-sm" onclick="friendAlermNoBtn(' +codes+ ')"><i class="fa fa-remove"></i></button>';
						result +='<input type="hidden" id="sendid' +item.CODE+ '" value="' + item.SENDID + '" >';
						result +='</li>';
					} else if(item.EVENTTYPE == "schedulesharing"){
						var codes = "'"+ item.CODE +"'";
						result +='<li id=alermBoardLi"' +item.CODE+ '">';
						result +='<a>';
						result +='<i class="fa fa-calendar-plus-o text-red"></i> '+ item.SENDID +' 님의  스케쥴 공유하겠습니까?';
						result +='</a>';
						result +='<div class="label label-default"><i class="fa fa-clock-o"></i>'+' 이벤트 타이틀 : '+item.VARIABLE2+'<br/><br/> 시간대 :'+item.STARTTIME+'~'+item.ENDTIME+'</div>';
						result +='<br/><br/>';
						result +='<button type="button" class="btn btn-default btn-sm" onclick="scheduleAlermOkBtn(' +codes+ ')"><i class="fa fa-check-circle-o"></i></button>';
						result +='<button type="button" class="btn btn-default btn-sm" onclick="scheduleAlermNoBtn(' +codes+ ')"><i class="fa fa-remove"></i></button>';
						result +='<input type="hidden" id="sendid' +item.CODE+ '" value="' + item.SENDID + '" >';
						result +='</li>';
					}
				}
			});
			result +='</ul>';
			result +='</li>';
			result +='</ul>';
			result +='</li>';
			document.getElementById("topMenuBarUl").innerHTML = result + document.getElementById("topMenuBarUl").innerHTML;
			
			
			
			
			
		} 
		, error: function(request,status,error){ 
	        //alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error); 
	    } 
			 
	}); 
}


function groupAlermOkBtn(CODE) {
	//var CODE = $(this).attr('name');
	var id =  $("#id"+CODE).val();
	var roomnum =  $("#roomnum"+CODE).val();
	var alerm = {
			"alermseq" : CODE
			, "id" : id
			, "groupseq" : roomnum
	};
	//alert(alerm.alermseq + "," + alerm.id + "," + alerm.groupseq);
	$.ajax({
		method   : 'post'
		, url    : 'groupAlermOk'
		, data   : JSON.stringify(alerm)
		, dataType : 'json'
		, contentType : 'application/json; charset=UTF-8'
		, success: function(data) {
			//alert(data.result1+"흠"+data.result2);
			location.reload();
		} 
	});
}

function groupAlermNoBtn(CODE) {
	//var CODE = $(this).attr('name');
	var id =  $("#id"+CODE).val();
	var roomnum =  $("#roomnum"+CODE).val();
	var alerm = {
			"alermseq" : CODE
			, "id" : id
			, "groupseq" : roomnum
	};
	//alert(alerm.alermseq + "," + alerm.id + "," + alerm.groupseq);
	$.ajax({
		method   : 'post'
		, url    : 'groupAlermNoBtn'
		, data   : JSON.stringify(alerm)
		, dataType : 'json'
		, contentType : 'application/json; charset=UTF-8'
		, success: function(data) {
			//alert(data.result1+"흠"+data.result2);
			location.reload();
		} 
	});
}


function friendAlermOkBtn(CODE) {
	//var CODE = $(this).attr('name');
	var sendid =  $("#sendid"+CODE).val();
	var alerm = {
			"alermseq" : CODE
			, "sendid" : sendid
	};
	//alert(alerm.alermseq + "," + alerm.sendid);
	$.ajax({
		method   : 'post'
		, url    : 'friendAlermOkBtn'
		, data   : JSON.stringify(alerm)
		, dataType : 'json'
		, contentType : 'application/json; charset=UTF-8'
		, success: function(data) {
			//alert(data.result1+"흠"+data.result2);
			location.reload();
		} 
	});
}

function friendAlermNoBtn(CODE) {
	//var CODE = $(this).attr('name');
	var alerm = {
			"alermseq" : CODE
	};
	//alert(alerm.alermseq);
	$.ajax({
		method   : 'post'
		, url    : 'friendAlermNoBtn'
		, data   : JSON.stringify(alerm)
		, dataType : 'json'
		, contentType : 'application/json; charset=UTF-8'
		, success: function(data) {
			alert(data.result1+"흠"+data.result2);
			location.reload();
		} 
	});
}


function scheduleAlermOkBtn(CODE) {
	var alerm = {
			"alermseq" : CODE
	};
	//alert(alerm.alermseq + "," + alerm.sendid);
	$.ajax({
		method   : 'post'
		, url    : 'scheduleAlermOkBtn'
		, data   : JSON.stringify(alerm)
		, dataType : 'json'
		, contentType : 'application/json; charset=UTF-8'
		, success: function(data) {
			//alert(data.result1+"흠"+data.result2);
			location.reload();
		} 
	});
}


function scheduleAlermNoBtn(CODE) {
	var alerm = {
			"alermseq" : CODE
	};
	//alert(alerm.alermseq);
	$.ajax({
		method   : 'post'
		, url    : 'scheduleAlermNoBtn'
		, data   : JSON.stringify(alerm)
		, dataType : 'json'
		, contentType : 'application/json; charset=UTF-8'
		, success: function(data) {
			location.reload();
		} 
	});
}

function profileImgBtn(){
	// Get the modal
    var modal2 = document.getElementById('forProfileDiv');

    // Get the <span> element that closes the modal
    var span2 = document.getElementsByClassName("close")[0];                                          

    // When the user clicks on the button, open the modal 
    //$('#sch-button').text('');
    //$('#sch-button').append("<input type='button' id='eventAdd' style='width: 200px;' value='스케쥴 입력하기' class='btn btn-block btn-primary' onclick='return addevent()'/>");      	  
    modal2.style.display = "block";
    //$('#startday').val(date.format());
    
    // When the user clicks on <span> (x), close the modal
    span2.onclick = function() {
        modal2.style.display = "none";
    }

    // When the user clicks anywhere outside of the modal, close it
    window.onclick = function(event) {
        if (event.target == modal2) {
            modal2.style.display = "none";
        }
    }
    
    $('#input_proImg').on('change', input_proImgFunction);
    
 
}

function input_proImgFunction(e) {
	var files2 = e.target.files;
	var filesArr2 = Array.prototype.slice.call(files2);
	filesArr2.forEach(function(f) {
		if (!f.type.match("image.*")) {
			swal("확장자는 이미지 만 가능합니다");
			return;
		}
		//sel_file = f;
		var reader2 = new FileReader();
		reader2.onload = function(e) {
			$('#proImg').attr('src', e.target.result);
		}
		reader2.readAsDataURL(f);
	});
}


function changeProfile(){
	
	
	var formData = new FormData($("#input_proImg")[0]);
    $.ajax({
        type : 'post',
        url : 'profileImage',
        data : formData,
        processData : false,
        contentType : false,
        success : function(html) {
            //alert("파일 업로드하였습니다.");
        },
        error : function(error) {
            //alert("파일 업로드에 실패하였습니다.");
            console.log(error);
            console.log(error.status);
        }
    });

}