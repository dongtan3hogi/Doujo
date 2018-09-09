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
   <!-- <img src="images/upload.PNG"> 
      <div class="left"><a class="btn" href="home"><img src="images/home.png"></a></div> -->
  <h2>Friend_Recommendation</h2>
   <div>
      <form class="right" action="searchRecommendFriends" method="get">
         
         <select name="searchItem">
            <option value="id"${searchItem =='id'? 'selected':''}>ID</option>
            <option value="job" ${searchItem =='job'? 'selected':''}>JOB</option>
            <option value="hobby" ${searchItem =='hobby'? 'selected':''}>HOBBY</option>
         </select>
         <input type="text" name="searchWord" value="${searchWord}"/>
         <input type="submit" value="search" />
      </form>   
      
      <div class="left">
      <a href="tooldFriend">친구목록이동</a>
      </div>
      
   <table summary="member" cellpadding="0" cellspacing="0" id="member">
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
      <c:when test="${!empty list}">
       <c:forEach begin="0" var="member" items="${list}" varStatus="index">
          <tr class='sibal'><td><input type="checkbox" name='selected'></td>
              <td>${member.id}</td>   
              <td>${member.nickname}</td>
              <td>${member.name}</td>
              <td>${member.gender}</td>
              <td>${member.age}</td>
              <td>${member.job}</td>
              <td>${member.hobby}</td>
          </tr>    
       </c:forEach>   
      </c:when>
      <c:otherwise>
       <tr><td colspan="4">검색결과가 없습니다.</td></tr>
      </c:otherwise>
   </c:choose>
   </tbody>
   </table>
   
<!-- 로그인 하지 않으면 글쓰기를 할 수 없음 :: 인터셉터 처리 --> 
  <!--  <div class="right">
      <a href="joinfriend">Add_Member</a>
   </div>
   <br>
   <div class="right">
      <a id="qwerty" type="button">Delete_Member</a>
   </div> -->
   
   <div>
        <a href="#" onClick="fn_btnChoice()">선택</a>
   </div>
   
   <div>
        <a href="#" onClick="fn_delRow()">삭제</a>
   </div>
   
   <div class="boardfooter">
   <a href="listfriend?currentPage=${navi.currentPage - navi.pagePerGroup}&searchItem=${searchItem}&searchWord=${searchWord}">◁◁</a>
   <a href="listfriend?currentPage=${navi.currentPage - 1}&searchItem=${searchItem}&searchWord=${searchWord}">◀</a>
   &nbsp; &nbsp;
   <c:forEach var="page" begin="${navi.startPageGroup}" end="${navi.endPageGroup}">
      <c:if test="${page == currentPage}">
         <span style="color:red; font-weight:bolder;">${page}</span> &nbsp;
      </c:if>
      
      <c:if test="${page != currentPage}">
         <a href="listfriend?currentPage=${page}&searchItem=${searchItem}&searchWord=${searchWord}">${page}</a> &nbsp;
      </c:if>
   </c:forEach>
   &nbsp; &nbsp;
   <a href="listfriend?currentPage=${navi.currentPage + 1}&searchItem=${searchItem}&searchWord=${searchWord}">▶</a>
   <a href="listfriend?currentPage=${navi.currentPage + navi.pagePerGroup}&searchItem=${searchItem}&searchWord=${searchWord}">▷▷</a>
   
   </div>
   <script type="text/javascript">
   
   	console.log('asdf');
   	console.log('${list}');
   </script>
</div>
</div>
</body>
</html>