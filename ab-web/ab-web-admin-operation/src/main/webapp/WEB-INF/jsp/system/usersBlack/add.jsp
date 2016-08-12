<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/taglib.jsp"%>
<!DOCTYPE html>
<html >
	<head>
		<base href="${project_name}/">
		<meta charset="utf-8" />
		<title></title>
		<meta name="description" content="overview & stats" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		
		<link type="text/css" rel="stylesheet" href="${css_imagedomain}/css/bootstrap.min.css"  />
		<link type="text/css" rel="stylesheet" href="${css_imagedomain}/css/bootstrap-responsive.min.css" />
		<link type="text/css" rel="stylesheet" href="${css_imagedomain}/css/font-awesome.min.css" />
		<link type="text/css" rel="stylesheet" href="${css_imagedomain}/css/ace.min.css" />
		<link type="text/css" rel="stylesheet" href="${css_imagedomain}/css/ace-responsive.min.css" />
		<link type="text/css" rel="stylesheet" href="${css_imagedomain}/css/ace-skins.min.css" />
        <link type="text/css" rel="stylesheet" href="${css_imagedomain}/css/custom.css" />
        <script type="text/javascript" src="${css_imagedomain}/js/jquery-1.9.1.min.js"></script>		
		<link rel="stylesheet" href="${css_imagedomain}/css/addUser.css" />
		<script type="text/javascript" src="${css_imagedomain}/js/common/common.js"></script>
		
	</head>
<body>
<div class="center">
	<div class="row-fluid">
        <div class="span12">添加受限用户</div>
    </div>
    <div class="row-fluid">
        <div class="span10">
        	<span class="span1"></span>
        	<form action="${project_name}/usersBlack/toAdd" method="post" name="checkForm" id="checkForm">
        	<input style="width:300px;" id="checkname" name="checkname" type="text" value="${checkname}" placeholder="请输入关键词" class="span3" />
        	<button class="btn btn-small btn-light" onclick="search();" title="查询">查询</button>
        	</form>
        </div>
    </div>
    
    <!--表格-->
  	<form action="${project_name}/usersBlack/add" method="post" name="addForm" id="addForm">
    <div class="table-responsive">
       <span style="color:red;">会员不会重复添加</span>
       <table class="table table-bordered">
          <thead>
             <tr>
                <th>
                    <label><input type="checkbox" id="zcheckbox"><span class="lbl"></span></label>
                </th>
                <th>用户编号</th>
                <th>用户名</th>
                <th>真实姓名</th>
                <th>注册时间</th>
             </tr>
          </thead>
          <tbody>
          	<c:if test="${not empty infoList}">
          	  <c:forEach items="${infoList}" var="user" varStatus="vs">
          	  	<tr>
                <td>
                    <label><input type='checkbox' name='ids' value="${user.hjsUserBase.id }" id="${user.hjsUserBase.id }"/><span class="lbl"></span></label>
                </td>
                <td>${vs.index+1}</td>
                <td>${user.hjsUser.username }</td>
                <td>${user.hjsUser.realName }</td>
                <td><fmt:formatDate value="${user.hjsUser.createTime }" pattern="yyyy-MM-dd"/></td>
              	</tr>
          	  
          	  </c:forEach>
          	  
          	
          	</c:if>
          </tbody>
       </table>
    </div>
    
    <div class="row-fluid">
        <div class="span12">受限设置</div>
    </div>
    
    <div class="row-fluid">
        <div class="span11">
        	<span class="w20"></span>
             <label><input type="checkbox" value="1" id="charge" name="charge"><span class="lbl"></span><span>限制返佣</span></label>
             <label><input type="checkbox" value="1" id="limiteTender" name="limiteTender"><span class="lbl"></span><span>限制投资</span></label>
        </div>
    </div>
    <div class="row-fluid">
        <input type="button" onclick="add();" value="确定" class="sure" />
    </div>
    </form>
</div>
</body>
</html>	
<script type="text/javascript">		
$(top.hangge());
function search(){
	$("#checkForm").submit();
}
function getCheck(){
	var ids="";
	$("input[name='ids']:checked").each(function(){
		ids+=$(this).val()+","; 
	});
	return ids;
}
function add(){
	var ids=getCheck();
	if(ids==""){
		alert("请选择要限制的会员");
		return false;
	}
	if(!$("#charge").is(":checked") && !$("#limiteTender").is(":checked")){
		alert("请选择要限制的内容");
		return false;
	}
	$("#addForm").submit();
}
</script>
<script type="text/javascript">		
		$(function() {									
			//复选框
			$('table th input:checkbox').on('click' , function(){
				var that = this;
				$(this).closest('table').find('tr > td:first-child input:checkbox')
				.each(function(){
					this.checked = that.checked;
					$(this).closest('tr').toggleClass('selected');
				});
					
			});
			
		});	
</script>