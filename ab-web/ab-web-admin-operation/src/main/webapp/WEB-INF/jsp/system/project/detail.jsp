<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8" />
<title>查看项目详细信息</title>
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
var editor1=UE.getEditor('editor1',{readonly:true});
var editor2=UE.getEditor('editor2',{readonly:true});
</script>
<body>
 <div class="center centerW" id="zhongxin">
    <div class="row-fluid">
        <div class="span12">项目详情</div>
    </div>
    <div class="row-fluid">
    	<div class="span1"></div>
    	<div class="span8">
        	<div class="span2">项目名称：</div>
        	<div class="span8">${hjsBorrowProject.P_NAME}</div>
        </div>
    </div>
    <div class="row-fluid">
    	<div class="span1"></div>
        <div class="span8">
            <div class="span2">项目金额：</div>
            <div class="span8"><fmt:formatNumber value="${hjsBorrowProject.BORROW_AMOUNT_MIN}" pattern="#"/>万 至<fmt:formatNumber value="${hjsBorrowProject.BORROW_AMOUNT_MAX}" pattern="#"/> 万</div>
        </div>
    </div>
    <div class="row-fluid">
    	<div class="span1"></div>
        <div class="span8">
        	<div class="span2">项目期限：</div>
        	<div class="span8">${hjsBorrowProject.BORROW_SDATE}个月 至 ${hjsBorrowProject.BORROW_EDATE}个月</div>
        </div>
    </div>
    <div class="row-fluid">
    	<div class="span1"></div>
        <div class="span8">
        	<div class="span2">项目利率：</div>
        	<div class="span8">${hjsBorrowProject.PROJECT_APR}%</div>
        </div>
    </div>
    <div class="row-fluid">
    	<div class="span1"></div>
        <div class="span8">
        	<div class="span2">项目主体：</div>
        	<div class="span8">
        	<c:if test="${hjsBorrowProject.LOAN_TYPE eq 1 }">
        	公司借款
        	</c:if>
        	  ${hjsBorrowProject.ENT_NAME}</div>
        </div>
    </div>
    <!--表格-->
  	
    <div class="table-responsive">
   <table class="table table-bordered">
      <thead>
         <tr>
            <th>序号</th>
            <th>产品名称</th>
            <th>产品金额（元）</th>
            <th>产品利率</th>
            <th>产品周期</th>
            <th>状态</th>
         </tr>
      </thead>
      <tbody>
      <c:forEach items="${hjsBorrows}" var="hb" varStatus="vshb">
         <tr>
            <td>${vshb.index+1}</td>
            <td>${hb.bname}</td>
            <td>${hb.account}</td>
            <td>${hb.borrowApr}</td>
            <td>${hb.borrowPeriod}个月</td>
            <td>
            <c:choose>
             <c:when test="${hb.tenderScale eq 100}">满标</c:when>
             <c:otherwise>未满标</c:otherwise>
            </c:choose>
            </td>
         </tr>
      </c:forEach>
    
      </tbody>
   </table>
</div>
 
    <div class="row-fluid">
		<div class="span2 pL40"><span class="required">*</span>项目信息：</div>
	</div>
	<div class="row-fluid" >
		<div class="span11 pL40" >
			 <script id="editor1" name="projectRemark" type="text/plain" >${hjsBorrowProject.PROJECT_REMARK}</script>
		</div>
	</div>
	<div class="row-fluid">
		<div class="span2 pL40">其它信息：</div>
	</div>
	<div class="row-fluid">
          <div class="span11 pL40">
                 <script id="editor2" name="otherRemark" type="text/plain">${hjsBorrowProject.OTHER_REMARK}</script>
          </div>
      </div>
     
</div>
</body>
<jsp:include page="../../common/alert_message.jsp"></jsp:include>
</html>