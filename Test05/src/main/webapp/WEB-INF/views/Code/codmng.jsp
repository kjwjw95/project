<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>


	<style>
  table {
    width: 100%;
    border: 1px solid #CCC;
    border-collapse: collapse;
    margin-left: auto;
    margin-right: auto;
    width : 40%;
  }
  th, td {
    border: 1px solid #CCC;
    border-collapse: collapse;
    text-align: center;
  }
</style>


	<script src="http://code.jquery.com/jquery-1.11.2.min.js"></script>
	<script src="http://code.jquery.com/jquery-migrate-1.2.1.min.js"></script>

	<script type="text/javascript">
	$(function() {
		var status = 0;
		$("#list_table tr").click(function(){     
		 
		
        var tr = $(this);
        var td = tr.children();
        var num = td.eq(0).text();
        var lv = td.eq(1).text();
        var upcd = td.eq(2).text();
        var name = td.eq(3).text();
        var useyn = td.eq(4).find('input.chk').val();
     //  console.log("클릭한 Row의 모든 데이터 : "+ useyn);
        $("#cdno").val(num);
        $("#cdlvl").val(lv);
        $("#upcd").val(upcd);
        $("#cdname").val(name);
        if(useyn=="Y"){
        	$("#ckbox").prop("checked",true);
        }
        	
        else
        	$("#ckbox").prop("checked",false);
		});
		
		$("#insert").click(function(){//추가하기
			$("#cdno").val("");
			$("#cdlvl").removeAttr("readonly");
			$("#cdlvl").val("");
			$("#upcd").removeAttr("readonly");
			$("#upcd").val("");
			$("#cdname").removeAttr("readonly");
			$("#cdname").val("");
			$("#ckbox").removeAttr("disabled");
			$("#ckbox").prop("checked",false);
			status=1;
		});
		
		
		
		$("#update").click(function(){//수정하기
			//console.log("수정");
			$("#cdlvl").removeAttr("readonly");
			$("#upcd").removeAttr("readonly");
			$("#cdname").removeAttr("readonly");
			$("#ckbox").removeAttr("disabled");
			status=2;
		});
		
		$("#save").click(function(){
			if($("#ckbox").is(":checked"))
				$("#useyn").val("Y");
			else
				$("#useyn").val("N");
			
			switch(status){
			case 0:
				alert("변동사항이 없습니다.");
				break;
			case 1:
				$("#form1").attr('action','codeInsert.do');
				$("#form1").submit()
				break;
			case 2:
				$("#form1").attr('action','codeUpdate.do');
				$("#form1").submit()
				break;
			}
		});
		
	});
 

	</script>

	<title>Codemng</title>
</head>
<body>

<br>

<p style="text-align: center;">
전체 리스트
<table id="list_table" >
    <colgroup>
        <col width="13%"/>
        <col width="27%"/>
        <col width="30%"/>
        <col width="17%"/>
        <col width="13%"/>
    </colgroup>
    <thead>
        <tr>
            <th scope="col">코드번호</th>
            <th scope="col">코드레벨</th>
            <th scope="col">상위코드</th>
            <th scope="col">코드이름</th>
            <th scope="col">사용여부</th>
        </tr>
    </thead>
    <tbody>
        <c:choose>
            <c:when test="${fn:length(list) > 0}">
                <c:forEach items="${list}" var="row">
                    <tr>
                        <td>${row.cdno }</td>
                        <td>${row.cdlvl }</td>
                        <td>${row.upcd }</td>
                        <td>${row.cdname }</td>
                        <td><input type='checkbox'  <c:if test="${row.useyn eq 'Y'}">checked</c:if> disabled />
                        <input type="hidden" name="useyn" class="chk"  value="${row.useyn}">
                        </td>
                    </tr>
                </c:forEach>
            </c:when>
            <c:otherwise>
                <tr>
                    <td colspan="5">조회된 결과가 없습니다.</td>
                </tr>
            </c:otherwise>
        </c:choose>
    </tbody>
</table>
<br>
<form method="post" name="form1" id="form1" action="">
<table  id="form_table" style="">
	<thead>
        <tr style="border: 1px solid #444444" bgcolor="#E2E2E2">
            <th colspan="2">코드내용</th>
        </tr>
		<tr>
			<td>코드번호 :</td>
			<td><INPUT TYPE="text" name="cdno" id="cdno" SIZE=15  readonly></td>
		</tr>
		<tr>
			<td>코드레벨 :</td>
			<td><INPUT TYPE="text" name="cdlvl" id="cdlvl" SIZE=15  readonly></td>
		</tr>
		<tr>
			<td>상위코드 :</td>
			<td><INPUT TYPE="text" name="upcd" id="upcd" SIZE=15  readonly></td>
		</tr>
		<tr>
			<td>코드이름 :</td>
			<td><INPUT TYPE="text" name="cdname" id="cdname" SIZE=18  readonly></td>
		</tr>
		<tr>
			<td>사용여부 :</td>
			<td><input type='checkbox' id="ckbox" class="chBox" disabled/>
			<input type="hidden" name="useyn" id="useyn" value="Y"></td>
			
		</tr>
		<tr>
			<td colspan="2">
			<input type="button" id="insert" value ="추가">
			<input type="button" id="update" value ="수정">
			<input type="button" id="save" value ="저장">
			</td>

		</tr>

</table>

</form>
</body>

</html>