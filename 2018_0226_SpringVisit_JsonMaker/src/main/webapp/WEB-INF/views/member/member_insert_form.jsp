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
	
	
	//id에서 키가눌리면..
	$('#id').keyup(function(event){
		
		var id = $(this).val();
		console.log('id=' + id);
		if(id.length<3){
			$('#id_msg').html('3자리이상 입력하세요')
			            .css('color','red');
			//가입버튼 비활성화
			$('#bt_reg').attr('disabled',true);
			return;
		}
		
		//서버로 id전송(ajax통신)
		$.ajax({
			url: 'check_id.do',
			data:{ 'id': id },
			success:function(data){
				// data="[{'result':'yes'}]";
				var json = eval(data);
				// var json=[{'result':'yes'}];
				if(json[0].result == 'yes'){
					
					$('#id_msg').html('사용가능한 아이디입니다')
		            .css('color','blue');
					
					//가입버튼 활성화
					$('#bt_reg').attr('disabled',false);
					
					
				}else{
					
					$('#id_msg').html('이미 사용중인 아이디입니다')
		            .css('color','red');
					
					//가입버튼 비활성화
					$('#bt_reg').attr('disabled',true);
					
				}
			}
		});
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
	
	
	f.action = 'insert.do';
	f.submit();
	
}


</script>

</head>
<body>
<form>
	<table border="1" align="center">
		<caption>::::회원정보 추가하기::::</caption>
	    <!-- 1번째줄 -->
	    <tr>
	    	<th>이름</th>
	    	<td><input name="name"></td>
	    </tr>
		<!-- 2번째줄 -->
		<tr>
		   <th>아이디</th>
		   <td><input name="id" id="id"><span id="id_msg"></span></td>
		</tr>
		<!-- 3번째줄 -->
	    <tr>
	    	<th>비밀번호</th>
	    	<td><input type="password" name="pwd"></td>
	    </tr>
		<!-- 4번째줄 -->
	    <tr>
	    	<th>우편번호</th>
	    	<td>
	    	     <input name="zipcode" id="zipcode">
	    	     <input type="button" value="주소검색" id="bt_addr">
	    	</td>
	    </tr>
	    <!-- 5번째줄 -->
	    <tr>
	    	<th>주소</th>
	    	<td><input name="address" id="address"></td>
	    </tr>
		
		<tr>
		   <td colspan="2" align="center">
		      <input type="button" value="가입하기" disabled="disabled" id="bt_reg"
		             onclick="send(this.form);" >
		      <input type="button"  value="목록보기"
		             onclick="location.href='list.do'">
		   </td>
		</tr>
	
	</table>
</form>


</body>
</html>