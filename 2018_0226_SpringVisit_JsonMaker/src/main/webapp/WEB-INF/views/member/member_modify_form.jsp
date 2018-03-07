<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
table{
	width: 500px;
}

#id_msg{
    display: inline-block;
    width: 200px;
    color: red;
    margin-left: 10px;
}

input#address{
    width: 98%;
}

span#id_msg{
    font-size: 10pt;
}

</style>

<script src="http://code.jquery.com/jquery-1.10.2.min.js"></script>

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

<script type="text/javascript">
$(document).ready(function(){
	
	//주소검색버튼이 클릭되면
	$('#bt_addr').click(function(){
		
		 new daum.Postcode({
		        oncomplete: function(data) {
		        	/* console.log(data.zonecode);
		        	console.log(data.roadAddress);
		        	console.log(data.jibunAddress); */
		        	$('#zipcode').val(data.zonecode);
		        	$('#address').val(data.roadAddress);
		        }
		 }).open();
		
	});
	
	
	
});


function send(f){
	var name = f.name.value;
	//var id   = f.id.value;
	var pwd  = f.pwd.value;
	var zipcode = f.zipcode.value;
	var address = f.address.value;
	
	if(name==''){
		alert('이름을 입력하세요');
		f.name.focus();
		return;
	}
	
	if(pwd==''){
		alert('비밀번호를 입력하세요');
		f.pwd.focus();
		return;
	}
	
	if(zipcode==''){
		alert('우편번호를 입력하세요');
		f.zipcode.focus();
		return;
	}
	
	if(address==''){
		alert('주소를 입력하세요');
		f.address.focus();
		return;
	}
	
	
	f.action = 'modify.do';
	f.submit();
	
}


</script>

</head>
<body>
<form>
    <input type="hidden"  name="idx"  value="${ vo.idx }">
	<table border="1" align="center">
	    <caption>::::회원정보 수정하기::::</caption>
	    <!-- 1번째줄 -->
	    <tr>
	    	<th>이름</th>
	    	<td><input name="name" value="${ vo.name }"></td>
	    </tr>
		<!-- 2번째줄 -->
		<tr>
		   <th>아이디</th>
		   <td><input name="id" id="id"  value="${ vo.id }"  readonly="readonly"><span id="id_msg">아이디는 수정할수 없습니다</span></td>
		</tr>
		<!-- 3번째줄 -->
	    <tr>
	    	<th>비밀번호</th>
	    	<td><input type="password" name="pwd" value="${ vo.pwd }"></td>
	    </tr>
		<!-- 4번째줄 -->
	    <tr>
	    	<th>우편번호</th>
	    	<td>
	    	     <input name="zipcode" id="zipcode" value="${ vo.zipcode }">
	    	     <input type="button" value="주소검색" id="bt_addr">
	    	</td>
	    </tr>
	    <!-- 5번째줄 -->
	    <tr>
	    	<th>주소</th>
	    	<td><input name="address" id="address" value="${ vo.address }"></td>
	    </tr>
		
		<tr>
		   <td colspan="2" align="center">
		      <input type="button" value="수정하기"
		             onclick="send(this.form);" >
		      <input type="button"  value="목록보기"
		             onclick="location.href='list.do'">
		   </td>
		</tr>
	
	</table>
</form>


</body>
</html>