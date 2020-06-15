<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<script type="text/javascript">
	function clearText(y){ 
		if (y.defaultValue==y.value) 
		y.value = "" 
		} 


	
	
	function regid(){
		if(document.form1.ename.value == ''){
			alert("이름을 입력하세요.");
			document.form1.ename.focus();
			return;
		}
		if(document.form1.empno.value/1000 < 1 || document.form1.empno.value/1000>10){
			alert("사원 번호는 4자리로 입력해주세요.");
			document.form1.mgr.focus();
			return;
		}
		if(document.form1.mgr.value/1000 < 1 || document.form1.mgr.value/1000>10){
			alert("MGR은 4자리로 입력해주세요.");
			document.form1.mgr.focus();
			return;
		}
		if(document.form1.deptno.value != 10 && document.form1.deptno.value != 20 && document.form1.deptno.value != 30 && document.form1.deptno.value != 40 ){
			alert("부서번호는 10,20,30,40만 가능합니다.");
			document.form1.deptno.focus();
			return;
		}
		document.form1.submit();
	}
	</script>

	<title>empList</title>
</head>
<body>
<h1>
	사원 명부 
</h1>
<br>
<form method="post" name="form1">
<table style="border:1px solid #ccc">
    <colgroup>
        <col width="10%"/>
        <col width="*"/>
        <col width="*"/>
        <col width="*"/>
        <col width="*"/>
        <col width="*"/>
        <col width="*"/>
        <col width="*"/>
    </colgroup>
    <thead>
        <tr>
            <th scope="col">사원명</th>
            <th scope="col">판매량</th>
            <th scope="col">입사일</th>
            <th scope="col">사원번호</th>
            <th scope="col">MGR</th>
            <th scope="col">직종</th>
            <th scope="col">부서번호</th>
            <th scope="col">주급</th>
        </tr>
    </thead>
    <tbody>
        <c:choose>
            <c:when test="${fn:length(empList) > 0}">
                <c:forEach items="${empList }" var="row">
                    <tr>
                        <td>${row.ename }</td>
                        <td>${row.comm }</td>
                        <td>${row.hiredate }</td>
                        <td>${row.empno }</td>
                        <td>${row.mgr }</td>
                        <td>${row.job }</td>
                        <td>${row.deptno }</td>
                        <td>${row.sal }</td>
                    </tr>
                </c:forEach>
            </c:when>
            <c:otherwise>
                <tr>
                    <td colspan="4">조회된 결과가 없습니다.</td>
                </tr>
            </c:otherwise>
        </c:choose>
        <tr>
         	<td><INPUT TYPE=TEXT NAME="ename" SIZE=3 VALUE='사원명' onFocus="clearText(this)" ></td>
         	<td><INPUT TYPE=TEXT NAME="comm" SIZE=4 VALUE='100' onFocus="clearText(this)" ></td>
         	<td><INPUT TYPE=TEXT NAME="hiredate" SIZE=15 VALUE='입사일' onFocus="clearText(this)"></td>
         	<td><INPUT TYPE=TEXT NAME="empno" SIZE=4 VALUE='3335' onFocus="clearText(this)" ></td>
         	<td><INPUT TYPE=TEXT NAME="mgr" SIZE=4 VALUE='2121' onFocus="clearText(this)"></td>
         	<td><INPUT TYPE=TEXT NAME="job" SIZE=2 VALUE='직종' onFocus="clearText(this)"></td>
         	<td><INPUT TYPE=TEXT NAME="deptno" SIZE=3 VALUE='20' onFocus="clearText(this)"></td>
         	<td><INPUT TYPE=TEXT NAME="sal" SIZE=3 VALUE='100' onFocus="clearText(this)">    </td>
         	</tr>
         	<tr>    
<td><input type="button" onClick="regid()" value ="등록">
</td>
</tr>
    </tbody>
</table>

</form>
</body>

</html>