<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>


	<style>
  table {
    border: 1px solid #CCC;
    border-collapse: collapse;
    margin-left: auto;
    margin-right: auto;
    width : 100%;
  }
  div{
  	margin-left: auto;
    margin-right: auto;
    width : 100%;
  }

</style>


	<script src="http://code.jquery.com/jquery-1.11.2.min.js"></script>
	<script src="http://code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
	<script type="text/javascript">
	var ischk="";
	$.ListUp = function(){
		$.ajax({
			url : "OutItemList.do",
			type : "post",
			
			dataType : "html",
			success : function(data){
				$('#outItemList').html(data);
			}
			
/*			dataType : "json",
			success : function(data){
				$('#outItemList').empty();
				if(data.length>0){
					$(data).each(function(i){
						var html="";
						html+='<tr id="lists" value="test" style="border : 1px solid #CCC; border-collapse : collapse; text-align : center;" >'
						html+='<td value="'+data[i].delivcom+'">'+data[i].itemcd+'</td>';
						html+='<td value="'+data[i].delivno+'">'+data[i].itemname+'</td>';
						html+='<td value="'+data[i].stockamt+'">'+data[i].madenmcd+'</td>';
						html+='<td value="'+data[i].outitemlistcd+'">'+data[i].madenname+'</td>';
						html+='<td>'+data[i].unitname+'</td>';
						html+='<td>'+data[i].delivamt+'</td>';
						html+='<td>'+data[i].id+'</td>';
						html+='<td>'+data[i].delivname+'</td>';
						html+='<td>'+data[i].relcd+'</td>';
						html+='<td>'+data[i].addrcd+'</td>';
						html+='<td>'+data[i].addrname+'</td>';
						html+='<td>'+data[i].mobiletelno+'</td>';
						html+='<td>'+data[i].hometelno+'</td>';
						html+='<td>'+data[i].checkyn+'</td>';
						
						if(data[i].delivyn=="Y"){
							html+='<td value="'+data[i].delivyn+'"><input type="checkbox" checked  disabled ></td>';
						}
						else if(data[i].delivyn=="N" || data[i].delivyn==""){
							html+='<td value="'+data[i].delivyn+'"><input type="checkbox" disabled></td>';
						}
						html+='</tr>';
						$('#outItemList').append(html);
					});
				}
				else{
					var html="";
					html+='<tr style="border : 1px solid #CCC; border-collapse : collapse; text-align : center;">'
					html+='<td colspan="15">검색 결과가 없습니다.</td>';
					html+='</tr>';
					$('#outItemList').append(html);
				}
			}*/
		})
	}
	
	$.Reset=function(){
		$("#itemcd").text('');
    	$("#itemname").text('');
    	$("#madenmcd").text('');
    	$("#madenname").text('');
    	$("#unitname").text('');
    	$("#delivamt").text('');
    	$("#id").text('');
    	$("#delivname").text('');
    	$("#relcd").text('');
    	$("#addrcd").text('');
    	
    	$("#addrname").text('');
    	$("#id").text('');
    	$("#mobiletelno").text('');
    	$("#hometelno").text('');
    	$("#checkyn").val('');
   		$("#checkyn").prop("checked",false);
    	$("#delivyn").val('');
		$("#delivyn").prop("checked",false);
    	$("#delivcom").val('');
    	$("#delivno").val('');
    	$("#meseage").text('');
    	ischk="";
	}
	
	$(document).ready(function(){
		$.ListUp();
		$.Reset();
	});
	
	$(function() {
	$('#outItemList').on('click','tr',function(event){     //******입고내용 쓰기
		var tr = $(this);
    	var td = tr.children();
    	//console.log(">>>>>><<<<<<<");
    	var itemcd = td.eq(0).text();
    	var itemname = td.eq(1).text();
   		var madenmcd = td.eq(2).text();
   		var madenname = td.eq(3).text();
   		var unitname = td.eq(4).text();
   		var delivamt = td.eq(5).text();
   		var id = td.eq(6).text();
    	var delivname = td.eq(7).text();
   		var relcd = td.eq(8).text();
   		var addrcd = td.eq(9).text();
   		var addrname = td.eq(10).text();
   		var mobiletelno = td.eq(11).text();
   		var hometelno = td.eq(12).text();
   		var checkyn = td.eq(13).text();
   		var delivyn = td.eq(14).attr('value');
   		
   		var delivcom = td.eq(0).attr('value');
   		var delivno = td.eq(1).attr('value');
   		var stockamt = td.eq(2).attr('value');
   		var outitemlistcd = td.eq(3).attr('value');
   		
    	$("#itemcd").text(itemcd);
    	$("#itemname").text(itemname);
    	$("#madenmcd").text(madenmcd);
    	$("#madenname").text(madenname);
    	$("#unitname").text(unitname);
    	$("#delivamt").text(delivamt);
    	$("#id").text(id);
    	$("#delivname").text(delivname);
    	$("#relcd").text(relcd);
    	$("#addrcd").text(addrcd);
    	$("#addrname").text(addrname);
    	$("#mobiletelno").text(mobiletelno);
    	$("#hometelno").text(hometelno);
    	$("#checkyn").val(checkyn);
    		if(checkyn=='Y')	$("#checkyn").prop("checked",true);
    		else $("#checkyn").prop("checked",false);
    	$("#delivyn").val(delivyn);
    		if(delivyn=='Y')	$("#delivyn").prop("checked",true);
			else $("#delivyn").prop("checked",false);
    	
    	$("#delivcom  option:contains("+delivcom+")").attr('selected','selected');
    	
  //  		console.log(delivyn+td.eq(14).attr('value'));
    	$("#delivno").val(delivno);
    	$("#meseage").text(itemname+"의 재고 수량은 "+stockamt+unitname+"입니다.");
    	$("#outitemlistcd").val(outitemlistcd);
    	console.log(outitemlistcd);
    	ischk=checkyn;
    	//$("#insamt").prop('readonly', false);
    	//$("#insamt").val("");
    	
    	/*
    	$.ajax({
			url : "initemLookup.do",
			type : "post",
			dataType : "json",
			data : {itemcd : itemcd},
			success : function(data){
				$.InListUp(data);
			}
		})*/
    	
		});
	
	$("#save").click(function(){
		if($("#checkyn").attr("checked")=="checked")
			$("#checkyn").val("Y");
		else
			$("#checkyn").val("N");
		if($("#delivyn").attr("checked")=="checked")
			$("#delivyn").val("Y");
		else
			$("#delivyn").val("N");
		console.log("저장"+$("#checkyn").val()+$("#delivyn").val()+$("#delivcom").val()+$("#delivno").val()+$("#outitemlistcd").val());
		$.ajax({
			url : "outitemupdate.do",
			type : "post",
			dataType : "json",
			data : {checkyn : $("#checkyn").val(),
					delivyn : $("#delivyn").val(),
					delivcom : $("#delivcom").val(),
					delivno : $("#delivno").val(),
					outitemlistcd : $("#outitemlistcd").val(),
					delivamt : $("#delivamt").text(),
					itemcd : $("#itemcd").text()
					},
			success : function(){
				setTimeout(function(){
					$.ListUp();
				},20)
				$.Reset();
			},
			error : function(request, status, error){
		    console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		    }
		})

	});
	
	});
	</script>

	<title>outlist</title>
</head>
<body>


<div>
<b> 금일 출고 리스트</b>
</div>
<br>
<table id="initem_table" >
    <colgroup>
        <col width="5%"/>
        <col width="5%"/>
        <col width="7%"/>
        <col width="8%"/>
        <col width="6%"/>
        <col width="8%"/>
        <col width="8%"/>
        <col width="9%"/>
        <col width="6%"/>
        <col width="8%"/>
        <col width="10%"/>
        <col width="6%"/>
        <col width="6%"/>
        <col width="4%"/>
        <col width="4%"/>
    </colgroup>
    <thead>
        <tr style="border : 1px solid #CCC; border-collapse : collapse;" >
            <th scope="col">상품코드</th>
            <th scope="col">상품명</th>
            <th scope="col">제조사코드</th>
            <th scope="col">제조사명</th>
            <th scope="col">단위명</th>
            <th scope="col">출고수량</th>
            <th scope="col">회원아이디</th>
            <th scope="col">이름</th>
            <th scope="col">관계</th>
            <th scope="col">우편번호</th>
            <th scope="col">주소</th>
            <th scope="col">휴대전화</th>
            <th scope="col">집전화</th>
            <th scope="col">검수여부</th>
            <th scope="col">배송여부</th>
            
            
        </tr>
    </thead>
    <tbody id="outItemList">
        
    </tbody>
</table>
<div id="meseage">

</div>
<br>
<form method="post" name="form1" id="form1" action="">
<table  id="form_table" style="">
	<thead>
        <tr style="border: 1px solid #444444" bgcolor="#E2E2E2">
            <th colspan="6">출고내용
<span style= "float:right"><input type="button" id="save" value ="저장">&emsp;</span></th>
        </tr>
		<tr>
			<td>상품코드 :</td>
			<td id="itemcd" ></td>
			<td>상품명 :</td>
			<td id="itemname" ></td>
			<td>제조사 :</td>
			<td id="madenmcd" ></td>
		</tr>
		<tr>
			<td>단위 :</td>
			<td id="unitname" ></td>
			<td>출고수량 :</td>
			<td id="delivamt" ></td>
		</tr>
		<tr>
			<td>회원아이디 :</td>
			<td id="id" ></td>
			<td>회원이름 :</td>
			<td id="delivname" ></td>
			<td>관계 :</td>
			<td id="relcd" ></td>
		</tr>
		<tr>
			<td>우편번호 :</td>
			<td id="addrcd" ></td>
			<td>주소 :</td>
			<td id="addrname" ></td>
			<td>휴대전화 :</td>
			<td id="mobiletelno" ></td>
		</tr>
		<tr>
			<td>집전화 :</td>
			<td id="hometelno"></td>
			<td>검수여부 :</td>
			<td><INPUT TYPE="checkbox" id="checkyn"></td>
			<td>배송여부 :</td>
			<td><INPUT TYPE="checkbox" id="delivyn"></td>
		</tr>
		<tr>
			<td>배송회사 :</td>
			<td><select id="delivcom" style="width : 120px">
				<c:choose>
					<c:when test="${fn:length(list)>0 }">
						<c:forEach items="${list}" var="row">
							<option value="${row.cdno}">${row.cdname}</option>
						</c:forEach>
					</c:when>
				</c:choose>
			</select></td>
			<td>송장번호 :</td>
			<td><INPUT TYPE="text" id="delivno" SIZE=20 ></td>
			<td><input type='hidden' id="outitemlistcd"></td>
		</tr>
		<tr>
			

		</tr>

</table>

</form>
<br>
<br>
<br>
</body>

</html>