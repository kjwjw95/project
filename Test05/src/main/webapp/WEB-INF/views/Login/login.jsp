<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<script src="http://code.jquery.com/jquery-1.11.2.min.js"></script>
	<script src="http://code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
	<title>Home</title>
	
	<script type="text/javascript">

	function clearText(y){ 
		if (y.defaultValue==y.value) 
		y.value = "" 
		} 


	
	/*
	function login(){
		if(document.form1.id.value == '' || document.form1.id.value == '아이디를 입력하세요.'){
			alert("아이디를 입력하세요.");
			document.form1.id.focus();
			return;
		}
		if(document.form1.password.value == ''){
			alert("비밀번호를 입력하세요.");
			document.form1.password.focus();
			return;
		}
		document.form1.submit();
	}
	*/
	
	
	$(function() {
	    $('#login').click(function(){
	    	var userid = $("#id").val();
	    	var userpass= $("#password").val();
/*
	    	if(userid =='' || userid == '아이디를 입력하세요.'){
	    		alert("아이디를 입력하세요.");
	    		return;
	    	}
	    	if(userpass ==''){
	    		alert("비밀번호를 입력하세요.");
	    		return;
	    	}*/
			
		$.ajax({
			
			url : "login.do",
			type : "get",
			dataType : "json",
			data : {id : userid, password : userpass},
			success : function(data){
				if(data == true){

				//	$("#form1").submit();
					
				}else if(data == false){
					alert("아이디나 비밀번호가 맞지 않습니다.");
				}
			},
            error : function(error) {
                alert("error : ");
            	}
			})
		
	    	
	
		});
	});
	
	
	</script>
	
	
</head>
<body>

	
<form method="post" name="form1" id="form1" action ="codemng.do">
<p style="text-align: center;">
아 이 디 : <INPUT TYPE=TEXT NAME="id" id='id' SIZE=18 VALUE='아이디를 입력하세요.' onFocus="clearText(this)" required>
<br>
비밀번호 : <INPUT TYPE="password" NAME="password" id='password' SIZE=18 VALUE='' placeholder="비밀번호를 입력하세요." onFocus="clearText(this)" required>

<br>
<input type="submit" id = "login"  value ="로그인">
<input type="button" onClick="location.href='./join.do';" value ="회원가입">
</p>
</form>
<br>
<br>
<a href="itemlist.do"><button>상품관리</button></a>
<!-- <input type="button" value="상품관리" id="itemlist" onclick="location.href='itemlist.do';"> -->
<input type="button" value="입고관리" id="initemlist" onclick="location.href='initem.do';">
<input type="button" value="출고관리" id="initemlist" onclick="location.href='outitem.do';">
</body>
</html>
