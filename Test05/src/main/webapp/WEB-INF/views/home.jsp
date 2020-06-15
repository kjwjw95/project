<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>Home</title>
</head>
<body>
<h1>
	<p style="text-align: center;">
		사원 명부
		 </p>
</h1>
<p style="text-align: center;">
<input type="button" value="사원명부 전체보기" id="emp_btn_1" onclick="location.href='./empList.do';">
<input type="button" value="사원명부 검색하기" id="emp_btn_1" onclick="location.href='./empSearch.do';">
<input type="button" value="사원명부 추가하기" id="emp_btn_1" onclick="location.href='./empCreate.do';">
<input type="button" value="사원명부 삭제하기" id="emp_btn_1" onclick="location.href='./empDelete.do';">
</p>
</body>
</html>
