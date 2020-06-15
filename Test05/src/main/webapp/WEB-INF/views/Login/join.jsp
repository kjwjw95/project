<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>Home</title>
	<script src="http://code.jquery.com/jquery-1.11.2.min.js"></script>
<script src="http://code.jquery.com/jquery-migrate-1.2.1.min.js"></script>

	
	<script type="text/javascript">
	
	var isCheck=0;
	var tempID="";
	function clearText(y){ 
		if (y.defaultValue==y.value) 
		y.value = "" 
		} 
	



	
	
	function regid(){
		if(document.form1.id.value == '' || document.form1.id.value == document.form1.id.defaultValue){
			alert("아이디를 입력하세요.");
			console.log("아이디 : " +document.form1.id.value)
			document.form1.id.focus();
			return;
		}
		if(document.form1.password.value == ''){
			alert("비밀번호를 입력하세요.");
			document.form1.password.focus();
			return;
		}
		if(document.form1.password2.value == ''){
			alert("비밀번호를 확인하세요.");
			document.form1.password2.focus();
			return;
		}
		if(document.form1.name.value == '' || document.form1.name.value == document.form1.name.defaultValue){
			alert("성명을 입력하세요.");
			document.form1.name.focus();
			return;
		}
		if(isCheck=0 || tempID!=document.form1.id.value){
			alert("아이디 중복확인을 하세요.");
			document.form1.id.focus();
			return;
		}
		
		document.form1.submit();
	}
	
	function pwchk1(){
		var temp=String(document.form1.password.value);
		if((temp.length > 10) || (temp.length <5)){
			alert("비밀번호는 5자리 이상 10자리 이하여야 합니다.");
			document.form1.password.focus();
			return;
		}
	}
	function pwchk2(){
		var temp=String(document.form1.password2.value);
		if((temp.length > 10) || (temp.length <5)){
			alert("비밀번호는 5자리 이상 10자리 이하여야 합니다.");
			document.form1.password2.focus();
			return;
		}
		if(document.form1.password.value!=document.form1.password2.value){
			alert("비밀번호가 일치하지 않습니다.");
			document.form1.password2.focus();
			return;
		}
	}
	
	
	
	$(function() {
	    //idck 버튼을 클릭했을 때 
	    $('#check').click(function(){
			
			
		$.ajax({
	
			url : "idChk.do",
			type : "post",
			dataType : "json",
			data : {id : $("#id").val()},
			success : function(data){
				if(data == true){
					alert("중복된 아이디입니다.");
				}else if(data == false){
					isCheck=1;
					tempID=$("#id").val();
				//	$("#idChk").attr("value", "Y");
					alert("사용가능한 아이디입니다.");
				}
			},
            error : function(error) {
                
                alert("error : " + error);
            }
		})
		
		console.log('>>>>>>>>>>' + isCheck);
	
		});
	});
	
	
	
	
	
	
	</script>
	
	
</head>
<body>
	<form method="post" name="form1" action ="userCreate.do">
	<p style="text-align: center;">
		<table style="border:1px solid #ccc;" align="center" width="450">
		<tr >
			<th style="text-align: center;">
        		회원가입
        	</th>
        </tr>
		<tr>
			<td>	아 이 디 :</td>
			<td>    <INPUT TYPE="text" name="id" id="id" SIZE=18 VALUE='아이디를 입력하세요.' onFocus="clearText(this)">
			    <input type="button"  id="check" value="중복확인"> </td>
		</tr>	
		<tr>
			<td colspan="2">	# 비밀번호는 5자리 이상 10자리 이하여야 합니다.</td>
		</tr>
		<tr>
			<td>	비밀번호 : </td>
			<td><INPUT TYPE="password" NAME="password" SIZE=18 VALUE=''placeholder="비밀번호를 입력하세요." onFocus="clearText(this)" onchange="pwchk1()"></td>
		</tr>
		<tr>
			<td>비밀번호확인 : </td>
			<td><INPUT TYPE="password" NAME="password2" SIZE=18 VALUE=''placeholder="비밀번호를 입력하세요." onFocus="clearText(this)" onchange="pwchk2()"></td>
		</tr>
		<tr>
			<td>성 명 :  </td>
			<td><INPUT TYPE=TEXT NAME="name" SIZE=18 VALUE='성명을 입력하세요.' onFocus="clearText(this)"></td>
		</tr>
</table>
<input type="button" onClick="regid()" value ="저장" style="WIDTH: 120pt">
</form>

</body>
</html>
