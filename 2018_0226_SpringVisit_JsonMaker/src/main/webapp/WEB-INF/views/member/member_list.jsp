<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function del(f){
	if(confirm('삭제하시겠습니까?')==false)return;
	
	f.action = 'delete.do';
	f.submit();
}

function modify(f){

	f.action = 'modify_form.do';
	f.submit();
}

</script>

</head>
<body>
	<table border="1" align="center" cellspacing="0">
		<caption>::::회원목록::::</caption>
		<tr>
			<td colspan="9">
			   <input type="button"  value="회원가입"
			          onclick="location.href='insert_form.do'"  >
			</td>
		</tr>
		
        <!-- Title -->
        <tr>
        	<th>일련번호</th>
        	<th>이름</th>
        	<th>아이디</th>
        	<th>비밀번호</th>
        	<th>우편번호</th>
        	<th>주소</th>
        	<th>IP</th>
        	<th>가입일자</th>
        	<th>비고</th>
        </tr>  
        
        <!-- Data --> 
        <!--  for(MemberVo vo : list)  -->
        <c:forEach var="vo" items="${ list }">
        	<tr>
        		<td>${ vo.idx }</td>
        		<td>${ vo.name }</td>
        		<td>${ vo.id }</td>
        		<td>${ vo.pwd }</td>
        		<td>${ vo.zipcode }</td>
        		<td>${ vo.address }</td>
        		<td>${ vo.ip }</td>
        		<td>${ vo.regdate }</td>
        		
        		<td>
        		   <form>
        		     <input type="hidden" name="idx" value="${ vo.idx }">
        		     <input type="button" value="삭제"  onclick="del(this.form);">
        		     <input type="button" value="수정"  onclick="modify(this.form);">
        		   </form>
        		</td>
        	</tr>
        </c:forEach>		
	</table>
</body>
</html>



