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
	
	$.ListUp = function(){//**************조회버튼 누르기
		
		itemrefrsh=$("#classfication").val();
		
		$.ajax({
			url : "itemLookup.do",
			type : "post",
			dataType : "json",
			data : {itemclscd :$("#classfication").val()},
			success : function(data){
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
		})
		
	}
	
	$.InListUp = function(data){//***************금일 입고 리스트
		$('#inItemList').empty();
		if(data.length>0){
			$(data).each(function(i){
				var html="";
				html+='<tr id="list" value="'+data[i].insitemlistcd+'" style="border : 1px solid #CCC; border-collapse : collapse; text-align : center;" >'
				html+='<td>'+data[i].itemcd+'</td>';
				html+='<td>'+data[i].itemname+'</td>';
				html+='<td>'+data[i].madenmcd+'</td>';
				html+='<td>'+data[i].maden+'</td>';
				html+='<td>'+data[i].itemunitcd+'</td>';
				html+='<td>'+data[i].itemunit+'</td>';
				html+='<td>'+data[i].insamt+'</td>';
				html+='</tr>';
				$('#inItemList').append(html);
				//console.log(data[i].insitemlistcd);
			});
		}
		else{
			var html="";
			html+='<tr style="border : 1px solid #CCC; border-collapse : collapse; text-align : center;">'
			html+='<td colspan="9">금일 입고리스트가 없습니다.</td>';
			html+='</tr>';
			$('#inItemList').append(html);
		}
	}
	
	
	
	
	$.Reset = function(){
		$("#cdno").val("");
    	$("#itemname").val("");
    	$("#madename").val("");
		$("#unitname").val("");
    	$("#insamt").val("");
    	$("#insamt").prop('readonly', true);
    	status=0;
	}
	
	$(function() {
		var status = 0;
		var itemrefrsh= "";
		var itemname= "";
		var madename= "";
		var unitname= "";
		var itemcd= "";
		var insamt= "";
		var insitemlistcd= "";
		
		
		$('#itemList').on('click','tr',function(event){     //******입고내용 쓰기
			var tr = $(this);
        	var td = tr.children();
        	var cdnumm = td.eq(0).text();
        	var itemnamem = td.eq(1).text();
       		var madenamem = td.eq(3).text();
       		var unitnamem = td.eq(5).text();
       		var madecodem = td.eq(2).text();
       		var unitcodem = td.eq(4).text();
       		
       		status = 2;
    		itemname= itemnamem;
    		madename= madenamem;
    		unitname= unitnamem;
    		itemcd= cdnumm;
    		unitcode=unitcodem;
    		madecode=madecodem;
    		
        
        	$("#cdno").val(cdnumm);
        	$("#itemname").val(itemnamem);
        	$("#madename").val(madename);
        	$("#unitname").val(unitname);
        	$("#insamt").prop('readonly', false);
        	$("#insamt").val("");
        	
        	
        	$.ajax({
				url : "initemLookup.do",
				type : "post",
				dataType : "json",
				data : {itemcd : itemcd},
				success : function(data){
					$.InListUp(data);
				}
			})
        	
			});
		
		//************금일 입고 리스트 클릭했을 때
		$('#inItemList').on('click','tr',function(event){     //******입고내용 쓰기
			var tr = $(this);
        	var td = tr.children();
        	var cdnumm = td.eq(0).text();
        	var itemnamem = td.eq(1).text();
       		var madenamem = td.eq(3).text();
       		var unitnamem = td.eq(5).text();
       		var madecodem = td.eq(2).text();
       		var unitcodem = td.eq(4).text();
       		var insamtm = td.eq(6).text();
    		itemname= itemnamem;
    		madename= madenamem;
    		unitname= unitnamem;
    		itemcd= cdnumm;
    		unitcode=unitcodem;
    		madecode=madecodem;
    		insamt=insamtm;
    		var insitemlistcdm=tr.attr('value');
    		insitemlistcd=insitemlistcdm;
    		console.log(insitemlistcd);
        

        	$("#cdno").val(cdnumm);
        	$("#itemname").val(itemnamem);
        	$("#insamt").prop('readonly', true);
        	$("#madename").val(madename);
        	$("#unitname").val(unitname);
        	$("#insamt").val(insamt);
        	
        	$.ajax({
				url : "initemLookup.do",
				type : "post",
				dataType : "json",
				data : {itemcd : itemcd},
				success : function(data){
					$.InListUp(data);
				}
			})
        	
			});
		
		
		
		
		
		$("#update").click(function(){//수정하기
			$("#insamt").removeAttr("readonly");
			status=1;
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
		$("#insamt").change(function(){//수정하기
			insamt=$(this).val();
		});
		
		$("#save").click(function(){//******저장하기
			switch(status){
			case 0:
				alert("변동사항이 없습니다.");
				break;
			case 1:
				console.log("INSERT 시작"+ itemcd + insamt);
				$.ajax({
					url :"initemUpdate.do",
					type : "post",
					dataType : "json",
					data : {itemcd : itemcd,
							insamt : insamt,
							insitemlistcd : insitemlistcd
							},
					success : function(data){
						
						$.InListUp(data);
						
					},
					error : function(error){
						console.log("error");
					}
				})
				break;
			case 2:
				
				console.log("INSERT 시작"+ itemcd + insamt);
				$.ajax({
					url :"initemInsert.do",
					type : "post",
					dataType : "json",
					data : {itemcd : itemcd,
							insamt : insamt,
							insitemlistcd : insitemlistcd
							},
					success : function(data){
						
						$.InListUp(data);
						console.log("SUCESS");
					},
					error : function(error){
						console.log("error");
					}
				})
				break;
			}
			setTimeout(function(){
				$.ListUp();
			},20)
			
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
			
					$.ListUp();

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
<div>
<b> 금일 입고 리스트</b>
</div>
<br>
<table id="initem_table" >
    <colgroup>
        <col width="10%"/>
        <col width="25%"/>
        <col width="15%"/>
        <col width="20%"/>
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
            <th scope="col">입고수량</th>
            
            
        </tr>
    </thead>
    <tbody id="inItemList">
        
    </tbody>
</table>

<br>
<form method="post" name="form1" id="form1" action="">
<table  id="form_table" style="">
	<thead>
        <tr style="border: 1px solid #444444" bgcolor="#E2E2E2">
            <th colspan="2">입고내용</th>
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
			<td><INPUT TYPE="text" id="madename" SIZE=30  readonly>
			&emsp;&emsp;&emsp;&emsp;단위명 : &nbsp;
			<INPUT TYPE="text" id="unitname" SIZE=30  readonly>
			</td>
		</tr>
		<tr>
			<td>입고수량 :</td>
			<td ><INPUT TYPE="text" id="insamt" SIZE=30  readonly></td>
		</tr>
		<tr>
			<td colspan="2" align="center">
			<input type="button" id="update" value ="수정">
			<input type="button" id="save" value ="저장">
			</td>

		</tr>

</table>

</form>
</body>

</html>