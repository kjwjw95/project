<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>detail</title>
	<script type="text/javascript">

	function clearText(y){ 
		if (y.defaultValue==y.value) 
		y.value = "" 
		}
	
	function regid(){
	//	console.log(id);
	if(document.form1.useyn.checked==false)
			document.form1.useyn.value='N';
	else if(document.form1.useyn.checked==true)
		document.form1.useyn.value='Y';
	
	console.log(document.form1.useyn.value);
		if(document.form1.name.value == '' || document.form1.name.value == document.form1.name.defaultValue){
			alert("성명을 입력하세요.");
			document.form1.name.focus();
			return;
		}
		if(document.form1.addrcd.value == '' || document.form1.addrcd.value == document.form1.addrcd.defaultValue){
			alert("우편번호를 입력하세요.");
			document.form1.addrcd.focus();
			return;
		}
		if(document.form1.addrname.value == '' || document.form1.addrname.value == document.form1.addrname.defaultValue){
			alert("주소를 확인하세요.");
			document.form1.addrname.focus();
			return;
		}
		if((document.form1.mobiletelno.value == '' || document.form1.mobiletelno.value == document.form1.mobiletelno.defaultValue) && (document.form1.hometelno.value == '' || document.form1.hometelno.value == document.form1.hometelno.defaultValue)){
			alert("전화번호를 입력하세요.");
			return;
		}
		
		
		
		document.form1.submit();
	}
	</script>
</head>
<body>
	<form method="post" name="form1" action ="userDetail.do">
	<p style="text-align: center;">
		<table style="border:1px solid #ccc;" align="center" width="450">
		<tr style="border: 1px solid #444444" bgcolor="#E2E2E2">
			<th colspan="2">
        		상세정보
        	</th>
        </tr>
		<tr>
			<td>성명 :</td>
			<td><INPUT TYPE="text" name="name" SIZE=18 VALUE='성명을 입력하세요.' onFocus="clearText(this)"></td>
		</tr>
		<tr>
			<td>관계 :</td>
			<td>
				<select name="relcd">
					<option value="C0021">본인</option>
					<option value="C0022">부모님</option>
					<option value="C0023">동생</option>
					<option value="C0024">지인</option>
				</select>
			</td>
		</tr>
		<tr>
			<td>우편번호 :</td>
			<td><INPUT TYPE="text" name="addrcd"  SIZE=16 VALUE='우편번호' onFocus="clearText(this)"></td>
		</tr>
		<tr>
			<td>주소 :</td>
			<td><INPUT TYPE="text" name="addrname" SIZE=20 VALUE='주소를 입력하세요' onFocus="clearText(this)"></td>
		</tr>
		<tr>
			<td>휴대전화번호 :</td>
			<td><INPUT TYPE="text" name="mobiletelno"  SIZE=16 VALUE='휴대전화' onFocus="clearText(this)"></td>
		</tr>
		<tr>
			<td>집전화번호 :</td>
			<td><INPUT TYPE="text" name="hometelno"  SIZE=16 VALUE='집번호' onFocus="clearText(this)"></td>
		</tr>
		<tr>
			<td>사용여부 :</td>
			<td><input type='checkbox' name ="chekk" class="chBox" checked="checked"/></td>
		</tr>	
		
</table>
	<input type="hidden" name="id" value="${userid}">
	<input type="hidden" name="insdate" value="${getInsdate}">
	<input type="hidden" name="useyn" value="">
<script>
</script>
<input type="button" onClick="regid()" value ="저장" style="WIDTH: 120pt">
</form>

</body>
</html>