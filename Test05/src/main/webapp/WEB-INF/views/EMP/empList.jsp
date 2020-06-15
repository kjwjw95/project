<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>empList</title>
</head>
<body>
<h1>
	사원 명부 
</h1>
<br>

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
         
    </tbody>
</table>


</body>
</html>