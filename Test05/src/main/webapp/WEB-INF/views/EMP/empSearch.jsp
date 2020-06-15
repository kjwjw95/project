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
	사원 검색
</h1>
<br>

<form name="form1" method="post" action ="empSearch.do">
<select name="searchOption">

					<option value="ENAME" <c:out value="${map.searchOption =='ENAME'?'selected':''}"/>>사원명</option>
					<option value="EMPNO" <c:out value="${map.searchOption =='EMPNO'?'selected':''}"/>>사원번호</option>
					<option value="MGR" <c:out value="${map.searchOption =='MGR'?'selected':''}"/>>MGR</option>
					<option value=JOB <c:out value="${map.searchOption =='JOB'?'selected':''}"/>>직종</option>
					<option value="DEPTNO" <c:out value="${map.searchOption =='DEPTNO'?'selected':''}"/>>부서번호</option>

				</select>
				<input name="keyword" value="${map.keyword }" SIZE=3 >
				<input type="submit" value="검색">
</form>


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
            <c:when test="${fn:length(map.empList) > 0}">
                <c:forEach items="${map.empList }" var="row">
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
검색 결과는 ${map.count }개가 있습니다.

</body>
</html>