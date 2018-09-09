$(function(){ 
	$(document).ready(function (){
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
		$('#quiztypeinput').on("click", function() {
			alert("호우");
	        sendMessage();
	    });
	});
});




var MyID = "";
var TargetID = "";
var messageListBoard = '';
	messageListBoard += '<li><ul class="menu">';
	messageListBoard += '<!-- start message -->';
	messageListBoard += '<li><a onclick="messageBoardChange()">';
	messageListBoard += '<div class="pull-left">';
	messageListBoard += '<img src="" class="img-circle" alt="User Image">';
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
				messageBarBoard += '<i class="fa fa-commenting"><img class="direct-chat-img" src="resources/userData/image/' + friendId + '.jpg" alt="message user image" style="width:25px;height:25px;"></i>';
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
			    		messageBarBoard += '<img class="direct-chat-img" src="resources/userData/image/' + item.GIVEID + '.jpg" alt="message user image">';
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
			    		messageBarBoard += '<img class="direct-chat-img" src="resources/userData/image/' + item.GIVEID + '.jpg" alt="message user image">';
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
				messageBarBoard += '<input type="text" name="message" id="'+friendId+'message" placeholder="Type Message ..." class="form-control">';
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
			showNewMessageList();
			$(document).ready(function() {
		        $(".sendBtn").click(function() {
		        	var FI = $(this).attr('id');
		            sendMessage(FI);
		        });
		    });
		} 
		, error: function(request,status,error){ 
	        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error); 
	    } 
	});
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
			$.each(data, function(index, item){
				var dummyFriend = "'"+item.USERID+"'";
				result += '<li><a onclick="messageBoardChange('+dummyFriend+')">';
				result += '<div class="pull-left">';
				result += '<img src="resources/userData/image/'+item.USERID+'.jpg" class="img-circle" alt="User Image">';
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
		} 
		, error: function(request,status,error){ 
	        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error); 
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
			result += '<a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-expanded="false">';
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
					result += '<img src="resources/userData/image/'+item.GIVEID+'.jpg" class="img-circle" alt="resources/userData/image/unknown.png">';
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
			messageListBoard += '</ul></li>';
			
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
    	//alert(dataArray[0]+", "+dataArray[1]+", "+dataArray[2]);
    	if(dataArray[2] == MyID) {
    		//내가보낸 메세지는 우측
    		putMsg += '<div class="direct-chat-msg right">';
    		putMsg += '<div class="direct-chat-info clearfix">';
    		putMsg += '<span class="direct-chat-name pull-right">' + dataArray[2] + '</span>';
    		putMsg += '<span class="direct-chat-timestamp pull-left">' + time + '</span>';
    		putMsg += '</div>';
    		putMsg += '<img class="direct-chat-img" src="resources/userData/image/' + dataArray[2] + '.jpg" alt="message user image">';
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
    		putMsg += '<img class="direct-chat-img" src="resources/userData/image/' + dataArray[2] + '.jpg" alt="message user image">';
    		putMsg += '<div class="direct-chat-text">';
    		putMsg += dataArray[3];
    		putMsg += '</div>';
    		putMsg += '</div>';
    		takeid = dataArray[2];
    	}
    	//alert(putMsg);
    	var textarea = document.getElementById(takeid+"messageLog");
    	textarea.innerHTML += putMsg;
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






