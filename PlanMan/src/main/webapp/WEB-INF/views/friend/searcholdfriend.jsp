<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>친구 검색&등록</title>
 <link rel="stylesheet" href="./resources/style/board.css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script> 
<script type="text/javascript">
function fn_btnChoice(){
	alert("emfdjdha");
	 $("input:checkbox[name='selected']:checked").each(function(){

		 var tdArr = new Array(); 
		 var tr = $("input:checkbox[name=selected]:checked").closest('tr');
		 
		 var td = tr.children()
		alert(td.length);
		 td.each(function(index,value){
			 if(index==0){
				 return true;
			 }
		        tdArr.push(td.eq(index).text());
		        alert(td.eq(index).text());
		    });
		 
		 var id = tdArr[0];
		  $.ajax({
				url : "chooseOnefriend",
				method : "POST", 
				data : {"id":id},
				success : function(data){
					alert("친구 신청이 접수되었습니다.");
				},error : function(data){
					alert("접속 불량");
				} 
				
			}); 
			 
		 });	    	 
}
	
function fn_delRow() { 

	 ﻿         if ($("input:checkbox[name='selected']").is(":checked")){ 

	 ﻿            if (confirm("삭제 하시겠습니까?")) { 

	 ﻿                for(var i=$("input:checkbox[name='selected']:checked").length-1; i>-1; i--){ 

	 ﻿                    $("input:checkbox[name='selected']:checked").eq(i).closest("tr").remove(); 

	                 }﻿ 
	             }﻿ 
	          } else { 

	 ﻿            alert("선택된 데이터가 없습니다.");  

	          }﻿ 

	     }﻿ 
	    
</script>
</head>
<body>

<c:if test="${empty sessionScope.member.job or empty sessionScope.member.hobby }">
<script>alert("취미 직업을 등록하러 갑니다");
location.href="joinfriend";</script>
</c:if>
<div id="wrapper">

  <h2>Friend_List</h2>
   <div>
      <form class="right" action="searchMyfriend" method="get">
         
         <select name="searchItem2">
            <option value="id"${searchItem2 =='id'? 'selected':''}>ID</option>
            <option value="job" ${searchItem2 =='job'? 'selected':''}>JOB</option>
            <option value="hobby" ${searchItem2 =='hobby'? 'selected':''}>HOBBY</option>
         </select>
         <input type="text" name="searchWord2" value="${searchWord2}"/>
         <input type="submit" value="search" />
      </form>   
      
      <div class="left">
      <a href="tonewFriend">친구추천목록</a>
      </div>
      
   <table summary="friend" cellpadding="0" cellspacing="0" id="friend">
   <colgroup>
   <col width="10%"/>
   <col width="10%"/>
   <col width="10%"/>
   <col width="10%"/>
   </colgroup>
   <thead>
      <th scope="col"><input type="checkbox" onClick="fn_allChecked();"/></th>
      <th scope="col">ID</th>
      <th scope="col">NICKNAME</th>
      <th scope="col">NAME</th>
      <th scope="col">GENDER</th>
      <th scope="col">AGE</th>
      <th scope="col">JOB</th>
      <th scope="col">HOBBY</th>
   </thead>
   
   <tbody>
   <c:choose>
      <c:when test="${!empty friendsInfo}">
       <c:forEach begin="0" var="friend" items="${friendsInfo}" varStatus="index">
          <tr class='sibal'><td><input type="checkbox" name='selected'></td>
              <td>${friend.id}</td>   
              <td>${friend.nickname}</td>
              <td>${friend.name}</td>
              <td>${friend.gender}</td>
              <td>${friend.age}</td>
              <td>${friend.job}</td>
              <td>${friend.hobby}</td>
          </tr>    
       </c:forEach>   
      </c:when>
      <c:otherwise>
       <tr><td colspan="4">검색결과가 없습니다.</td></tr>
      </c:otherwise>
   </c:choose>
   </tbody>
   </table>
   
   <div>
        <a href="#" onClick="fn_btnChoice()">선택</a>
   </div>
   
   <div>
        <a href="#" onClick="fn_delRow()">삭제</a>
   </div>
   
   <div class="boardfooter">
   <a href="listMyfriend?currentPage2=${navi.currentPage2 - navi.pagePerGroup2}&searchItem2=${searchItem2}&searchWord2=${searchWord2}">◁◁</a>
   <a href="listMyfriend?currentPage2=${navi.currentPage2 - 1}&searchItem2=${searchItem2}&searchWord2=${searchWord2}">◀</a>
   &nbsp; &nbsp;
   <c:forEach var="page" begin="${navi.startPageGroup2}" end="${navi.endPageGroup2}">
      <c:if test="${page == currentPage2}">
         <span style="color:red; font-weight:bolder;">${page}</span> &nbsp;
      </c:if>
      
      <c:if test="${page != currentPage2}">
         <a href="listMyfriend?currentPage2=${page}&searchItem2=${searchItem2}&searchWord2=${searchWord2}">${page}</a> &nbsp;
      </c:if>
   </c:forEach>
   &nbsp; &nbsp;
   <a href="listMyfriend?currentPage2=${navi.currentPage2 + 1}&searchItem2=${searchItem2}&searchWord2=${searchWord2}">▶</a>
   <a href="listMyfriend?currentPage2=${navi.currentPage2 + navi.pagePerGroup2}&searchItem2=${searchItem2}&searchWord2=${searchWord2}">▷▷</a>
   
   </div>
   <script type="text/javascript">
   
   	console.log('asdf');
   	console.log('${list}');
   </script>
</div>
</div>
</body>
</html>