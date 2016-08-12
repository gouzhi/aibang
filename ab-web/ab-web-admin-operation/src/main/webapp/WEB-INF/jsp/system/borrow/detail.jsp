<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/taglib.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<base href="${project_name}/">

<meta charset="utf-8" />
<title>添加产品</title>
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
<!-- ueditor -->
<script type="text/javascript" charset="utf-8" src="${css_imagedomain}/plugins/ueditor1_3_5/ueditor.config.js"></script>
<script type="text/javascript" charset="utf-8" src="${css_imagedomain}/plugins/ueditor1_3_5/ueditor.all.min.js"></script>
<script type="text/javascript" charset="utf-8" src="${css_imagedomain}/plugins/ueditor1_3_5/lang/zh-cn/zh-cn.js"></script>
</head>
<script type="text/javascript">
$(top.hangge());
var projectRemarkEditor = UE.getEditor('porjectRemark',{readonly:true});
var borrowUserRemarkEditor = UE.getEditor('borrowUserRemark',{readonly:true});
var vouchRemarkEditor = UE.getEditor('vouchRemark',{readonly:true});
var windControlEditor = UE.getEditor('windControl',{readonly:true});
</script>
<body>
<div class="center centerW" id="zhongxin">
	<div class="row-fluid">
	    <div class="span12">审核反馈</div>
	</div>
	<div class="row-fluid">
	    <div class="span2 pl">审核状态：</div>
	    <div class="span4">
	    <c:forEach items="${audiconfigs}" var="item">
           <c:if test="${borrow.verifyStatus eq item.code}"><span>${item.cname }</span></c:if>
        </c:forEach>
	    </div>
	    <div class="span2 pl">审核说明：</div>
	    <div class="span4">
	     <c:if test="${fn:length(audit.VERIFY_REMARK)<='20'}">
			 <span>${audit.VERIFY_REMARK}</span>
		</c:if>
	    <c:if test="${fn:length(audit.VERIFY_REMARK)>'20'}">
		   <span title="${audit.VERIFY_REMARK}">${fn:substring(audit.VERIFY_REMARK,0,20)}...</span>
	    </c:if>
	    
	    </div>
	</div>
	<div class="row-fluid">
	    <div class="span12">产品基本信息</div>
	</div>
	<div class="row-fluid">
	    <div class="span2 pl">产品名称：</div>
	    <div class="span4"><span>${borrow.bname }</span></div>
	    <div class="span2 pl">还款方式：</div>
	    <div class="span4">
           <c:forEach items="${repayconfigs }" var="item">
           <c:if test="${borrow.repayType eq item.code}"><span>${item.cname }</span></c:if>
           </c:forEach>
	    </div>
	</div>
     <div class="row-fluid">
     	<div class="span2 pl">关联借款：</div>
         <div class="span4">
       		<c:forEach items="${projects }" var="item">
       		<c:if test="${borrowUser.projectId eq item.id}"><span>${item.pname }</span></c:if>
       		</c:forEach>
         </div>
         <div class="span2 pl">开始时间：</div>
         <div class="span4"><span><fmt:formatDate value="${borrow.tenderStartTime }" pattern="yyyy-MM-dd"/></span></div>
     </div>
     <div class="row-fluid">
     	<div class="span2 pl">产品类型：</div>
         <div class="span4">
           <c:forEach items="${borrowconfigs }" var="item">
           <c:if test="${borrow.borrowType eq item.code}"><span>${item.cname }</span></c:if>
           </c:forEach>
         </div>
          <div class="span2 pl">结束时间：</div>
    	<div class="span4"><span><fmt:formatDate value="${borrow.tenderEndTime }" pattern="yyyy-MM-dd"/></span></div>
     </div>
     <div class="row-fluid">
     	<div class="span2 pl">年化收益：</div>
         <div class="span4"><span>${borrow.borrowApr }%</span></div>
        <div class="span2 pl">最低投资金额：</div>
    	<div class="span4"><span><fmt:formatNumber value="${borrow.tenderAccountMin }" />元</span></div>
     </div>
     <div class="row-fluid">
     	<div class="span2 pl">借款总额：</div>
         <div class="span4"><span><fmt:formatNumber value="${borrow.account }"/>元</span> </div>
    	<div class="span2 pl">递增金额：</div>
    <div class="span4"><span><fmt:formatNumber value="${borrow.tenderAccountStep }"/></span>元</div>
	</div>
<div class="row-fluid">
	<div class="span2 pl">投资周期：</div>
    <div class="span4">
    <span>${borrow.borrowPeriod }</span>${borrow.repayType == 1?'月':'天'}
    </div>
    <div class="span2 pl">最高投资金额：</div>
    <div class="span4"><span><fmt:formatNumber value="${borrow.tenderAccountMax }" />元</span></div>
</div>
<c:if test="${borrow.status eq 1}">
<div class="row-fluid">
    <div class="span12">还款进度</div>
</div>
<div class="row-fluid">
	    <div class="span2 pl">资金规模:</div>
	    <div class="span4"><span>${borrow.account}</span></div>
	    <div class="span2 pl">应还总额:</div>
	    <div class="span4"><span>${borrow.repayAccountYes+borrow.repayAccountWait}</span></div>
</div>
<div class="row-fluid">
	    <div class="span2 pl">已还总额:</div>
	    <div class="span4"><span>${borrow.repayAccountYes }</span></div>
	    <div class="span2 pl">未还总额:</div>
	    <div class="span4"><span>${borrow.repayAccountWait}</span></div>
</div>
<div class="row-fluid">
	    <div class="span2 pl">已还本金:</div>
	    <div class="span4"><span>${borrow.repayAccountCapitalYes }</span></div>
	    <div class="span2 pl">未还本金:</div>
	    <div class="span4"><span>${borrow.repayAccountCapitalWait }</span></div>
</div>
<div class="row-fluid">
	    <div class="span2 pl">已还利息:</div>
	    <div class="span4"><span>${borrow.repayAccountInterestYes }</span></div>
	    <div class="span2 pl">未还利息:</div>
	    <div class="span4"><span>${borrow.repayAccountInterestWait}</span></div>
</div>
<div class="row-fluid">
	    <div class="span2 pl">审核时间:</div>
	    <div class="span4">
	    <span>
	    <c:if test="${borrow.verifyStatus eq 3 ||borrow.verifyStatus eq 4|| borrow.verifyStatus eq 12 ||borrow.verifyStatus eq 13}"><fmt:formatDate value="${borrow.verifyTime}" pattern="yyyy-MM-dd"/></c:if>
	    </span>
	    </div>
	    <div class="span2 pl">审核备注:</div>
	    <div class="span4">
	    <c:if test="${borrow.verifyStatus eq 3 ||borrow.verifyStatus eq 4|| borrow.verifyStatus eq 12 ||borrow.verifyStatus eq 13}">
	        <c:if test="${fn:length(borrow.verifyRemark)<='20'}">
			    <span class="center">${borrow.verifyRemark}</span>
			 </c:if>
			<c:if test="${fn:length(borrow.verifyRemark)>'20'}">
			   <span class="center1" title="${borrow.verifyRemark}">${fn:substring(borrow.verifyRemark,0,20)}...</span>
			</c:if>
	    </c:if>
	  
	    </div>
</div>
</c:if>
<div class="row-fluid">
    <div class="span12">其他信息</div>
</div>
<div class="row-fluid">
    <div class="span2 pL40">项目信息：</div>
</div>
<div class="row-fluid">
    <div class="span11 pL40">
        <script id="porjectRemark" name="porjectRemark" type="text/plain">${borrow.porjectRemark}</script>
    </div>
</div>
<div class="row-fluid">
    <div class="span2 pL40">企业信息：</div> 	
 </div>
<div class="row-fluid">
    <div class="span11 pL40">
        <script id="borrowUserRemark" name="borrowUserRemark" type="text/plain">${borrow.borrowUserRemark}</script>
    </div>
</div>
<%-- <div class="row-fluid">
    <div class="span2 pL40">担保机构：</div>
    <div class="span4">
   		<c:forEach items="${enterprices }" var="item">
   		<c:if test="${borrow.vouchId eq item.id}"><span>${item.entName }</span></c:if>
   		</c:forEach>
     </div>
 </div> --%>
 <div class="row-fluid">
    <div class="span2 pL40">还款来源：</div> 	
 </div>
<div class="row-fluid">
    <div class="span11 pL40">
        <script id="vouchRemark" name="vouchRemark" type="text/plain">${borrow.vouchRemark}</script>
    </div>
</div>
<div class="row-fluid">
    <div class="span2 pL40">风险控制：</div> 	
 </div>
<div class="row-fluid">
    <div class="span11 pL40">
        <script id="windControl" name="windControl" type="text/plain">${borrow.windControl}</script>
    </div>
</div>
<%-- <div class="row-fluid">
    <div class="span12">合同</div>
</div>
<div class="row-fluid">
    <div class="span2">
    	<img alt="" src="${css_imagedomain}/images/word.jpg" width="75px" height="75px">
    </div>
    <div class="span2"><a href="javascript:void(0)"  style="disay:block;height:75px;line-height:75px;">点击查看</a></div>
</div> --%>
</div>
</body>
<%@include file="../../common/alert_message.jsp"%>
</html> 