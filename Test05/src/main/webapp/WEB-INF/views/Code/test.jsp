<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:choose>
	<c:when test="${fn:length(lists) > 0}">
		<c:forEach items="${lists}" var="row">
			<tr id="lists" value="test" style="border : 1px solid #CCC; border-collapse : collapse; text-align : center;">
				<td value=${row.delivcom}>${row.itemcd}</td>
				<td value=${row.delivno}>${row.itemname}</td>
				<td value=${row.stockamt}>${row.madenmcd}</td>
				<td value=${row.outitemlistcd}>${row.madenname}</td>
				<td>${row.unitname}</td>
				<td>${row.delivamt}</td>
				<td>${row.id}</td>
				<td>${row.delivname}</td>
				<td>${row.relcd}</td>
				<td>${row.addrcd}</td>
				<td>${row.addrname}</td>
				<td>${row.mobiletelno}</td>
				<td>${row.hometelno}</td>
				<td>${row.checkyn}</td>
				<c:choose>
					<c:when test="${row.delivyn eq 'Y'}">
						<td value=${row.delivyn}><input type="checkbox" checked  disabled >
					</c:when>
					<c:otherwise>
						<td value=${row.delivyn}><input type="checkbox" disabled >
					</c:otherwise>
				</c:choose>
			</tr>
		</c:forEach>
	</c:when>
</c:choose>