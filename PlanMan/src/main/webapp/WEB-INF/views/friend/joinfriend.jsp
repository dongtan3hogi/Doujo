<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script>
//글쓰기폼 확인
function formCheck() {
	var job = document.getElementById('job');
	var hobby = document.getElementById('hobby');
	
	if (job.value.length < 1) {
		alert("직업 입력해라.");
		id.focus();
		id.select();
		return false;
	}
	if (hobby.value.length < 1) {
		alert("취미 입력해라");
		id.focus();
		id.select();
		return false;
	}
	return true;
}
</script>
</head>
<body>
<div class="centerdiv">
<h1>join-Friend</h1>
<!-- 바이너리 데이터 포함되는 폼. enctype 반드시 정확히 지정 -->
<form id="writeform" action="finallyjoinin"  method="post" 	 onsubmit="return formCheck();">
	
<table>
<tr>
	<th>ID</th>
	<td>
		<input id="id" type="text" value="${sessionScope.member.id }" name="id" size="30">
	</td>
</tr>
<tr>
	<th>NICKNAME</th> 
	<td>
		<input id="nickname" value="${sessionScope.member.nickname }" type="text" name="nickname" size="30">
	</td>
</tr>
<tr>
	<th>NAME</th> 
	<td>
		<input id="name" value="${sessionScope.member.name }" type="text" name="name" size="30">
	</td>
</tr>
<tr>
	<th>GENDER</th> 
	<td>
	<c:if test="${sessionScope.member.gender== 'female' }"><input class="gender" type="radio" name="gender" value="male"  />male
		<input class="gender" type="radio" name="gender" value="female" checked/>female</c:if>
	<c:if test="${sessionScope.member.gender== 'male' }"><input class="gender" type="radio" name="gender" value="male" checked />male
		<input class="gender" type="radio" name="gender" value="female" checked/>female</c:if>
	</td>
</tr>
<tr>
	<th>AGE</th> 
	<td>
		<input id="age" value="${sessionScope.member.age }" type="text" name="age" />
	</td>
</tr>
<tr>
	<th>JOB</th> 
	<td>
		<input type="text" id="job"name="job" size="30">
	</td>
</tr>
<tr>
	<th>HOBBY</th> 
	<td>
		<input type="text" id="hobby"name="hobby" size="30">
	</td>
</tr>
<tr>
	<td colspan="2" class="white center">
		<input type="submit" value="JOIN" />
	</td> 
</tr>
</table>
</form>
</div>
</body>
</html>