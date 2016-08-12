<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/taglib.jsp"%>
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8" />
		<title></title>
		<meta name="description" content="overview & stats" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<link type="text/css" rel="stylesheet" href="${css_imagedomain}/css/bootstrap.min.css"  />
		<link type="text/css" rel="stylesheet" href="${css_imagedomain}/css/font-awesome.min.css" />
		<link type="text/css" rel="stylesheet" href="${css_imagedomain}/css/ace.min.css" />
		<link type="text/css" rel="stylesheet" href="${css_imagedomain}/css/ace-responsive.min.css" />
		<link type="text/css" rel="stylesheet" href="${css_imagedomain}/css/ace-skins.min.css" />
		<link type="text/css" rel="stylesheet" href="${css_imagedomain}/css/custom.css" />
		<script type="text/javascript" src="${css_imagedomain}/js/jquery-1.9.1.min.js"></script>
		<script type="text/javascript" src="${css_imagedomain}/js/ace-elements.min.js"></script>
		<script type="text/javascript" src="${css_imagedomain}/js/ace.min.js"></script>
	</head>
<body>
<style type="text/css">
</style>
 <script type="text/javascript">
	top.hangge();
	/**
	 * 对Rechargeinfo管理后台，操作成功或者失败
	 * @author zhaoyu
	 */
	function addRechargeInfo() {
		var remark = $("#remark").val();
		//必须填写，不填跳出
		if(!remark){
			alert("备注必填");
			return;
		}
		var param = {
			//数量
			amount:$("#amount").val(),
			//状态 1成功 2失败
			status:$("input:radio[name='status']:checked").val(),
			//备注
			remark:remark
		};
		$.post("${project_name}/recharge/manual/${accountRecharge.ID}",param,function(data){
			//data 0 成功 1 参数错误 2 系统错误
			if(data==0){
				alert("成功");
			}else if(data==1){
				alert("参数错误");
			}else{
				alert("系统错误");
			}
		});
	}
</script>
<div class="center centerW">
	<div id="zhongxin" style="font-size: 16px;">
        <div class="row-fluid">
            <div class="span12" >充值情况</div>
        </div>
        <div class="row-fluid">
		    <div class="span3" style="text-align: right;">充值时间：</div>
            <div class="span3"><fmt:formatDate value="${accountRecharge.CREATE_TIME}"  pattern="yyyy-MM-dd HH:mm:ss"/></div>
			<div class="span3" style="text-align: right;">充值流水号： </div>
			<div class="span3">${accountRecharge.TRADE_ID}</div>
	    </div>
		<div class="row-fluid">
		    <div class="span3" style="text-align: right;">用户名：</div>
			<div class="span2">${accountRecharge.USERNAME}</div>
			<div class="span2 " style="text-align: right;">充值金额：</div>
			<div class="span2">${accountRecharge.MONEY}</div>
			<div class="span2 " style="text-align: right;">手续费：</div>
			<div class="span2">${accountRecharge.FEE}</div>
		</div>
		<div class="row-fluid">
		    <div class="span3 " style="text-align: right;">实际充值金额：</div>
			<div class="span2">${accountRecharge.BALANCE}</div>
			<div class="span2 " style="text-align: right;">充值方式：</div>
			<div class="span2">${accountRecharge.P_NAME}</div>
			<div class="span2 " style="text-align: right;">银行信息：</div>
			<div class="span2">${accountRecharge.BANK_ACCOUNT}</div>
	   </div>
		<div class="row-fluid">
			<div class="span3" style="text-align: right">状态：</div>
			<div class="span2">
				<c:forEach items="${statusTypes}" var="item" varStatus="vs">
					<c:if test="${item.code eq accountRecharge.STATUS}">
						${item.cname}
					</c:if>
				</c:forEach>
			</div>
		</div>

		<c:if test="${accountRecharge.STATUS eq 2}">
        <div class="row-fluid">
            <div class="span12">操作</div>
        </div>
        <div class="row-fluid">
		<div class="span2"  style="text-align: center;">      
		       <label><input type="radio" checked="checked" name="form-field-radio"><span class="lbl">手动异步</span></label>
        </div>
			<div class="span3 autOk" style="background-color: #287ad2;text-align: center;">异步充值信息</div>
		</div>
		<div class="row-fluid">
			<div class="span2 "  style="text-align: center;">
			   <label><input type="radio" name="form-field-radio" checked="checked"><span class="lbl">手动审核</span></label>
            </div>
		</div>
		<div class="widget-main">
			<div class="control-group span10">
				<label class="control-label span2" style="text-align: center">状态：</label>
				<div class="controls">
					<label class="span2" style="text-align: center">
						<input name="status" type="radio" value="1" checked="checked"><span class="lbl">成功</span>
					</label>
					<label class="span2" style="text-align: center">
						<input name="status" type="radio" value="2"><span class="lbl">失败</span>
					</label>
				</div>
			</div>
		<div class="row-fluid">
			<div class="span2 " style="text-align: center;">到账金额：</div>
			<div class="span3 "><input type="text" id="amount" class="span11" ></div>
			<div class="span5 ">（一旦审核通过将不可再进行修改）</div>
		</div>
		<div class="row-fluid">
			<div class="span2 " style="text-align: center;">备注<span style="color: red">*</span>：</div>
			<div class="span8 "><textarea data-maxlength="50" id="remark" class="span12 limited" maxlength="50"></textarea></div>
		</div>
		 <div class="row-fluid">
			<div class="span10 " style="text-align: center;"><input type="submit" id="subBtn" onclick="addRechargeInfo()" class="span2" value="确定"></div>
		 </div>
		</div>
		</c:if>
		</div>
</div>
<div id="zhongxin2" class="center" style="display:none"><img src="${css_imagedomain}/images/jzx.gif"  style="width: 50px;" /><br/><h4 class="lighter block green"></h4></div>
</body>
</html>
