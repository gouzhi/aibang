<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/taglib.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<base href="${project_name}/">
<meta charset="utf-8" />
<title>产品列表</title>
<meta name="description" content="overview & stats" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link type="text/css" rel="stylesheet" href="${css_imagedomain}/css/bootstrap.min.css"  />
<link type="text/css" rel="stylesheet" href="${css_imagedomain}/css/font-awesome.min.css" />
<link type="text/css" rel="stylesheet" href="${css_imagedomain}/css/ace.min.css" />
<link type="text/css" rel="stylesheet" href="${css_imagedomain}/css/ace-responsive.min.css" />
<link type="text/css" rel="stylesheet" href="${css_imagedomain}/css/ace-skins.min.css" />
<link type="text/css" rel="stylesheet" href="${css_imagedomain}/css/custom.css" />
<script type="text/javascript" src="${css_imagedomain}/js/jquery-1.9.1.min.js"></script>
</head>
<body>

<div class="container-fluid" id="main-container">
<div id="page-content">
<div class="row-fluid">
<div class="row-fluid">
	
	<table><tr height="14px;"><td colspan="100"></td></tr></table>
	<!-- 查询 -->
	<form action="borrow/signatureList.do" method="post">
	<div class="center">
		<div class="row-fluid">
	    	<div class="span2">
	        	<input type="text" placeholder="请输入产品编号" class="span12" name="id" value="${borrowQuery.id }"/>
	        </div>
	        <div class="span2">
	        	<input type="text" placeholder="请输入产品名称关键字" class="span12" name="bname" value="${borrowQuery.bname}"/>
	        </div>
	        <div class="span2 pR">
	            <select class="span12" name="contractStatus" id="contractStatus">
	                <option value="">合同生成状态</option>
	                <option value="0" <c:if test="${borrowQuery.contractStatus eq 0 }">selected="selected"</c:if>>待生成</option>
	                <option value="1" <c:if test="${borrowQuery.contractStatus eq 1 }">selected="selected"</c:if>>已生成</option>
	                <option value="2" <c:if test="${borrowQuery.contractStatus eq 2 }">selected="selected"</c:if>>生成失败</option>
	            </select>
	        </div>
	        <div class="span2 pR">
	            <select class="span12" name="tenderSignStatus" id="tenderSignStatus">
	                <option value="">投资人签章状态</option>
	                <option value="0" <c:if test="${borrowQuery.tenderSignStatus eq 0 }">selected="selected"</c:if>>待签章</option>
	                <option value="1" <c:if test="${borrowQuery.tenderSignStatus eq 1 }">selected="selected"</c:if>>已签章</option>
	                <option value="2" <c:if test="${borrowQuery.tenderSignStatus eq 2 }">selected="selected"</c:if>>签章失败</option>
	            </select>
	        </div>
	        <div class="span2 pR">
	            <select class="span12" name="borrowerSignStatus" id="borrowerSignStatus">
	                <option value="">借款人签章状态</option>
	                <option value="0" <c:if test="${borrowQuery.borrowerSignStatus eq 0 }">selected="selected"</c:if>>待签章</option>
	                <option value="1" <c:if test="${borrowQuery.borrowerSignStatus eq 1 }">selected="selected"</c:if>>已签章</option>
	                <option value="2" <c:if test="${borrowQuery.borrowerSignStatus eq 2 }">selected="selected"</c:if>>签章失败</option>
	            </select>
	        </div>
	        <div class="span2 pR">
	            <select class="span12" name="systemSignStatus" id="systemSignStatus">
	                <option value="">平台签章状态</option>
	               <option value="0" <c:if test="${borrowQuery.systemSignStatus eq 0 }">selected="selected"</c:if>>待签章</option>
	                <option value="1" <c:if test="${borrowQuery.systemSignStatus eq 1 }">selected="selected"</c:if>>已签章</option>
	                <option value="2" <c:if test="${borrowQuery.systemSignStatus eq 2 }">selected="selected"</c:if>>签章失败</option>
	            </select>
	        </div>
	         <div class="span2 pR">
	            <select class="span12" name="fileStatus" id="fileStatus">
	                <option value="">合同归档状态</option>
	                <option value="0" <c:if test="${borrowQuery.fileStatus eq 0 }">selected="selected"</c:if>>未归档</option>
	                <option value="1" <c:if test="${borrowQuery.fileStatus eq 1 }">selected="selected"</c:if>>已归档</option>
	                <option value="2" <c:if test="${borrowQuery.fileStatus eq 2 }">selected="selected"</c:if>>归档失败</option>
	            </select>
	        </div>
	         <div class="span1">
	        	 <input type="submit" value="搜索" class="span12" />
	        </div>
		</div>
	</div>
	</form>
	<!-- 表格数据 -->
	<table id="table_report" class="table table-striped table-bordered table-hover">
		<thead>
		<tr>
			<th class="center">产品编号</th>
			<th class="center">产品名称</th>
			<th class="center">合同生成状态</th>
			<th class="center">投资人签章状态</th>
			<th class="center">借款人签章状态</th>
			<th class="center">平台签章状态</th>
			<th class="center">归档状态</th>
			<th class="center">操作</th>
		</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.result }" var="item">
			<tr>
				<td>${item.ID }</td>
				<td><a class="td_a" href="javascript:void(0)" style="color: blue;"  onclick="showDetail(${item.ID })" >${item.B_NAME }</a></td>
				<td>
				<c:if test="${item.CONTRACT_STATUS == 0}">待生成</c:if>
				<c:if test="${item.CONTRACT_STATUS == 1}">已生成</c:if>
				<c:if test="${item.CONTRACT_STATUS == 2}">生成失败</c:if>
				</td>
				<td>
				<c:if test="${item.TENDER_SIGN_STATUS == 0}">未签章</c:if>
				<c:if test="${item.TENDER_SIGN_STATUS == 1}">已签章</c:if>
				<c:if test="${item.TENDER_SIGN_STATUS == 2}">签章失败</c:if>
				</td>
				<td>
				<c:if test="${item.BORROWER_SIGN_STATUS == 0}">未签章</c:if>
				<c:if test="${item.BORROWER_SIGN_STATUS == 1}">已签章</c:if>
				<c:if test="${item.BORROWER_SIGN_STATUS == 2}">签章失败</c:if>
				</td>
				<td>
				<c:if test="${item.SYSTEM_SIGN_STATUS == 0}">未签章</c:if>
				<c:if test="${item.SYSTEM_SIGN_STATUS == 1}">已签章</c:if>
				<c:if test="${item.SYSTEM_SIGN_STATUS == 2}">签章失败</c:if>
				</td>
				<td>
				<c:if test="${item.FILE_STATUS == 0}">未归档</c:if>
				<c:if test="${item.FILE_STATUS == 1}">已归档</c:if>
				<c:if test="${item.FILE_STATUS == 2}">归档失败</c:if>
				</td>
			    <td>
			    <c:if test="${item.CONTRACT_STATUS == 0 ||item.CONTRACT_STATUS == 2 }">
			       <a  href="javascript:void(0)" style="color: blue;" onclick="generateContract(${item.ID })">生成合同</a>
			               投资人签章 借款人签章 平台签章 合同归档
			    </c:if>
			    <c:if test="${item.CONTRACT_STATUS == 1&&(item.TENDER_SIGN_STATUS == 0 ||item.TENDER_SIGN_STATUS == 2)}">
			                生成合同
			    <a href="javascript:void(0)" style="color: blue;" onclick="investorSignature(${item.ID })"> 投资人签章</a>
			               借款人签章 平台签章 合同归档
			     </c:if>
			     <c:if test="${item.TENDER_SIGN_STATUS == 1&&(item.BORROWER_SIGN_STATUS == 0 ||item.BORROWER_SIGN_STATUS == 2)}">
			             生成合同   投资人签章 
			       <a  href="javascript:void(0)" style="color: blue;" onclick="borrowerSignature(${item.ID })">借款人签章</a>
			              平台签章 合同归档
			    </c:if>
			    <c:if test="${item.BORROWER_SIGN_STATUS == 1&&(item.SYSTEM_SIGN_STATUS == 0 ||item.SYSTEM_SIGN_STATUS == 2)}">
			               生成合同   投资人签章  借款人签章
			       <a  href="javascript:void(0)" style="color: blue;" onclick="flatSignature(${item.ID })">平台签章</a>
			               合同归档
			    </c:if>
			     <c:if test="${item.SYSTEM_SIGN_STATUS == 1&&(item.FILE_STATUS == 0 ||item.FILE_STATUS == 2)}">
			            生成合同   投资人签章  借款人签章 平台签章
			       <a  href="javascript:void(0)" style="color: blue;" onclick="filing('${item.ID }')"> 合同归档</a>
			    </c:if>  
			     <c:if test="${item.CONTRACT_STATUS == 1&&item.TENDER_SIGN_STATUS == 1&&item.BORROWER_SIGN_STATUS == 1&&item.SYSTEM_SIGN_STATUS == 1&&item.FILE_STATUS == 1}">
			           生成合同   投资人签章  借款人签章 平台签章 合同归档 
			    </c:if>      
			    </td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="page-header position-relative">
	<table style="width:100%;">
		<tr>
			<td style="vertical-align:top;"><div class="pagination" style="float: right;padding-top: 0px;margin-top: 0px;">${page.pageStr}</div></td>
		</tr>
	</table>
	</div>
</div>
</div>
</div>
</div>
<!-- 返回顶部  -->
<a href="#" id="btn-scroll-up" class="btn btn-small btn-inverse">
	<i class="icon-double-angle-up icon-only"></i>
</a>
</body>
<%@include file="../../common/alert_message.jsp"%>
</html>
<script type="text/javascript">
$(top.hangge());
//off shelf

		function filing(id)
		{
		    //合同归档
			//$('#filing').click(function(){
				//var id = $("#borrowId").val();
				//alert(id);
				//alert("正在归档,请耐心等待");
				top.jzts()
				$.ajax({
					type: "post",
					url: "${project_name}/tender/filing?id="+id,
					success: function(data)
					{
						alert(data);
						window.location.reload();
					}
				});
			//})
		}


//显示详情
//显示详情
function showDetail(borrowid){
	top.jzts();
 	var diag = new top.Dialog();
 	diag.Drag=true;
	diag.Title ="详情";
	diag.URL = '${project_name}/borrow/detail.do?borrowid='+borrowid;
	diag.Width = 950;
	diag.Height = 1500;
	diag.CancelEvent = function(){ //关闭事件
	if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
		top.jzts();
		setTimeout("self.location.reload()",100);
		
	}
	//top.mainFrame.reloadPage(/borrow\/prelim.do/);
	diag.close();
	};
	diag.show();
}

//生成合同
function generateContract(borrowId){
	var url = "${project_name}/contractSign/generateContract";
	
	$.ajax({
		beforeSend: function(){
			top.jzts();
	       } ,
		type:"post", 
	    url:url, 
		cache:false,
		data:{borrowId:borrowId},
		dateType:"json",
		success: function(data){
	    	   var obj = eval("("+data+")");
    		   alert(obj.msg);
    		   window.location.reload();
	       } ,
	       complete: function(){
	    	   top.hangge(); 
	       } 
	});
}

//投资人签章
function investorSignature(borrowid){
	$.ajax({
		type: "post",
		url: "${project_name}/tender/investorSignature?borrowId="+borrowid,
		success: function(data)
		{
			alert(data);
			window.location.reload();
		}
	});

}

//借款人签章
function borrowerSignature(borrowid){
	$.ajax({
		type: "post",
		url: "${project_name}/tender/borrowerSignature?borrowId="+borrowid,
		success: function(data)
		{
			alert(data);
			window.location.reload();
		}
	});

}

//平台签章
function flatSignature(borrowid){
	
// 	alert("正在投资人签章,请内心等待");
	$.ajax({
		type: "post",
		url: "${project_name}/tender/flatSignature?borrowId="+borrowid,
		success: function(data)
		{
			alert(data);
			window.location.reload();
		}
	});

}

</script>
