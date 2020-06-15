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
    width : 80%;
  }
  div{
  	margin-left: auto;
    margin-right: auto;
    width : 80%;
  }

</style>


	<script src="http://code.jquery.com/jquery-1.11.2.min.js"></script>
	<script src="http://code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
	<script type="text/javascript">
	
	$.ListUp = function(data){
		$('#itemList').empty();
		$.Reset();
		if(data.length>0){
			$(data).each(function(i){
				var html="";
				html+='<tr id="lists" value="test" style="border : 1px solid #CCC; border-collapse : collapse; text-align : center;" >'
				html+='<td>'+data[i].itemcd+'</td>';
				html+='<td>'+data[i].itemname+'</td>';
				html+='<td>'+data[i].madenmcd+'</td>';
				html+='<td>'+data[i].maden+'</td>';
				html+='<td>'+data[i].itemunitcd+'</td>';
				html+='<td>'+data[i].itemunit+'</td>';
				html+='<td>'+data[i].stockamt+'</td>';
				if(data[i].stockyn=="Y"){
					html+='<td><input type="checkbox" checked  disabled /><input type="hidden" name="stockyn" class="chk"  value="'+ data[i].stockyn +'"></td>';
				}
				else if(data[i].stockyn=="N" || data[i].stockyn==""){
					html+='<td><input type="checkbox" disabled /><input type="hidden" name="stockyn" class="chk"  value="'+ data[i].stockyn +'"></td>';
				}
				if(data[i].useyn=="Y"){
					html+='<td><input type="checkbox" checked  disabled /><input type="hidden" name="useyn" class="chk"  value="'+ data[i].useyn +'"></td>';
				}
				else if(data[i].useyn=="N"||data[i].useyn==""){
					html+='<td><input type="checkbox" disabled /><input type="hidden" name="useyn" class="chk"  value="'+ data[i].useyn +'"></td>';
				}
				html+='</tr>';
				$('#itemList').append(html);
			});
		}
		else{
			var html="";
			html+='<tr style="border : 1px solid #CCC; border-collapse : collapse; text-align : center;">'
			html+='<td colspan="9">검색 결과가 없습니다.</td>';
			html+='</tr>';
			$('#itemList').append(html);
		}
	}
	
	$.Reset = function(){
		$("#cdno").val("");
    	$("#cdno").prop('readonly', true);
    	$("#itemname").prop('readonly', true);
    	$("#itemname").val("");
    	$("#madename").val("");
    	$("#madename").val("C0051").prop("selected",true);
		$("#unitname").val("");
    	$("#unitname").val("C0061").prop("selected",true);
    	$("#chkbox").prop("disabled",true);
    	$("#madename").prop('disabled', true);
    	$("#unitname").prop('disabled', true);
    	status=0;
	}
	
	$(function() {
		var status = 0;
		var itemrefrsh= "";
		var itemname= "";
		var madename= "";
		var unitname= "";
		var useyn= "";
		var itemcd= "";
		
		
		$('#itemList').on('click','tr',function(event){     
			status=0;
			var tr = $(this);
        	var td = tr.children();
        	var cdnumm = td.eq(0).text();
        	var itemnamem = td.eq(1).text();
       		var madenamem = td.eq(2).text();
       		var unitnamem = td.eq(4).text();
        	var useynm = td.eq(8).find('input.chk').val();
        	
    		itemname= itemnamem;
    		madename= madenamem;
    		unitname= unitnamem;
    		useyn= useynm;
    		itemcd= cdnumm;
        	
        	
       		console.log(useynm);
        	$("#cdno").prop('readonly', true);
        	$("#itemname").prop('readonly', true);

        	$("#cdno").val(cdnumm);
        	$("#itemname").val(itemnamem);
        	$("#madename").val(madenamem).prop("selected",true);
        	$("#unitname").val(unitnamem).prop("selected",true);
        	$("#chkbox").prop("disabled",true);
        	$("#madename").prop('disabled', true);
        	$("#unitname").prop('disabled', true);
        	if(useyn=="Y"){
        		$("#chkbox").prop("checked",true);
        	}
        	else
        		$("#chkbox").prop("checked",false);
			});
		
		$("#insert").click(function(){//추가하기
			$("#cdno").val("");
			$("#itemname").removeAttr("readonly");
			$("#itemname").val("");
			$("#madename").removeAttr("disabled");
			$("#madename").val("");
			$("#unitname").removeAttr("disabled");
			$("#unitname").val("");
			$("#chkbox").removeAttr("disabled");
			$("#chkbox").prop("checked",false);
			status=1;
		});
		
		
		
		$("#update").click(function(){//수정하기
			$("#itemname").removeAttr("readonly");
			$("#madename").removeAttr("disabled");
			$("#unitname").removeAttr("disabled");
			$("#chkbox").removeAttr("disabled");
			status=2;
		});
		
		
		$("#itemname").change(function(){//수정하기
			 itemname=$(this).val();
		});
		$("#cdno").change(function(){//수정하기
			itemcd=$(this).val();
		});
		$("#madename").change(function(){//수정하기
			madename=$(this).val();
		});
		$("#unitname").change(function(){//수정하기
			unitname=$(this).val();
		});
		$("#chkbox").change(function(){//수정하기
			if($("#chkbox").is(":checked"))
				useyn="Y";
			else
				useyn="N";
			
		});
		
		
		
		
		$("#save").click(function(){
			
			switch(status){
			case 0:
				alert("변동사항이 없습니다.");
				break;
			case 1:
				if($("#chkbox").is(":checked"))
					useyn="Y";
				else
					useyn="N";
				console.log("INSERT 시작"+ itemrefrsh + itemname + madename + unitname + useyn+itemcd);
				
				$.ajax({
					url :"itemInsert.do",
					type : "post",
					dataType : "json",
					data : {itemrefrsh : itemrefrsh,
							itemname : itemname,
							madenmcd : madename,
							itemunitcd : unitname,
							useyn : useyn
							
					},
					success : function(data){
						$.ListUp(data);
						$.Reset();
						console.log("sucess");
					},
					error : function(error){
						console.log("error");
					}
				})
				
				break;
			case 2:
				
				//console.log("update 시작"+ itemrefrsh + itemname + madename + unitname + useyn+itemcd);
				$.ajax({
					url :"itemUpdate.do",
					type : "post",
					dataType : "json",
					data : {itemrefrsh : itemrefrsh,
							itemcd : itemcd,
							itemname : itemname,
							madenmcd : madename,
							itemunitcd : unitname,
							useyn : useyn
							
					},
					success : function(data){
						$.ListUp(data);
						$.Reset();
					},
					error : function(error){
						console.log("error");
					}
				})
				break;
			}
			
		});
			
		$('#itemcategori').click(function(){  ///******1차 분류 나타내는 함수
			
			$.ajax({
				url :"itemCategori.do",
				type : "post",
				dataType : "json",
				data : {cdno :$("#itemcategori").val()},
				success : function(data){
					//console.log("카테고리 선택");
					$('#classfication').empty();
					$(data).each(function(i){
						$('#classfication').append("<option value="+ data[i].cdno +">" + data[i].cdname +"</option>");
					});
				},
				error : function(error){
					console.log("error");
				}
			})
		});
		
		$('#lookup').click(function(){ //***** 조회 나타나는 함수
			itemrefrsh=$("#classfication").val();
			$.ajax({
				url : "itemLookup.do",
				type : "post",
				dataType : "json",
				data : {itemclscd :$("#classfication").val()},
				success : function(data){
					$.ListUp(data);
					
				}
			})
		});
	});
	</script>

	<title>Codemng</title>
</head>
<body>

<br>

<p style="text-align: center;">
<div >
<b> 전체 리스트</b>
<br>
<br>
카테고리 : 
&emsp;
<select id="itemcategori" style="width : 100px">
	<option value="">카테고리</option>
	<c:choose>
		<c:when test="${fn:length(list)>0 }">
			<c:forEach items="${list}" var="row">
				<option value="${row.cdno}">${row.cdname}</option>
			</c:forEach>
		</c:when>
	</c:choose>
</select>
&emsp;&emsp;
1차분류 :
&emsp;
<select id="classfication" style="width : 100px">

</select>
<span style= "float:right">
<input type="button" value="조회" id="lookup" style=" width : 80px">
</span>
</div>
<br>
<table id="list_table" >
    <colgroup>
        <col width="10%"/>
        <col width="15%"/>
        <col width="15%"/>
        <col width="10%"/>
        <col width="10%"/>
        <col width="10%"/>
        <col width="10%"/>
        <col width="10%"/>
        <col width="10%"/>
    </colgroup>
    <thead>
        <tr style="border : 1px solid #CCC; border-collapse : collapse;" >
            <th scope="col">상품코드</th>
            <th scope="col">상품명</th>
            <th scope="col">제조사코드</th>
            <th scope="col">제조사명</th>
            <th scope="col">단위코드</th>
            <th scope="col">단위명</th>
            <th scope="col">재고수량</th>
            <th scope="col">재고여부</th>
            <th scope="col">사용여부</th>
        </tr>
    </thead>
    <tbody id="itemList">
        
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
			<td>상품코드 :</td>
			<td><INPUT TYPE="text" id="cdno" SIZE=15  readonly></td>
		</tr>
		<tr>
			<td>상품명 :</td>
			<td><INPUT TYPE="text" id="itemname" SIZE=30  readonly></td>
		</tr>
		<tr>
			<td>제조사 :</td>
			<td>
				<select id="madename" style="width : 120px">
						<c:choose>
							<c:when test="${fn:length(mdname)>0 }">
								<c:forEach items="${mdname}" var="row">
									<option value="${row.cdno}">${row.cdname}</option>
								</c:forEach>
							</c:when>
						</c:choose>
				</select>
			
			
			&emsp;&emsp;&emsp;&emsp;단위명 : &nbsp;
				<select id="unitname" style="width : 120px">
						<c:choose>
							<c:when test="${fn:length(unname)>0 }">
								<c:forEach items="${unname}" var="row">
									<option value="${row.cdno}">${row.cdname}</option>
								</c:forEach>
							</c:when>
						</c:choose>
				</select>
			</td>
		</tr>
		<tr>
			<td>사용여부 :</td>
			<td ><input type='checkbox' id="chkbox" class="chBox" disabled/>
			<input type="hidden" name="useyn" id="useyn" value="Y"> 사용</td>
			
		</tr>
		<tr>
			<td colspan="2" align="center">
			<input type="button" id="insert" value ="추가">
			<input type="button" id="update" value ="수정">
			<input type="button" id="save" value ="저장">
			</td>

		</tr>

</table>

</form>
</body>

</html>