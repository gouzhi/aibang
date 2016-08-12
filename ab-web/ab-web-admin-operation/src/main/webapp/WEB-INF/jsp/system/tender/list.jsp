<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/taglib.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<base href="${project_name}/">

<meta charset="utf-8" />
<title>订单列表</title>
<meta name="description" content="overview & stats" /> 
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link type="text/css" rel="stylesheet" href="${css_imagedomain}/css/bootstrap.min.css" />
<link type="text/css" rel="stylesheet" href="${css_imagedomain}/css/bootstrap-responsive.min.css" />
<link type="text/css" rel="stylesheet" href="${css_imagedomain}/css/font-awesome.min.css" />
<link type="text/css" rel="stylesheet" href="${css_imagedomain}/css/ace.min.css" />
<link type="text/css" rel="stylesheet" href="${css_imagedomain}/css/ace-responsive.min.css" />
<link type="text/css" rel="stylesheet" href="${css_imagedomain}/css/ace-skins.min.css" />
<link type="text/css" rel="stylesheet" href="${css_imagedomain}/css/custom.css" />
<script type="text/javascript" src="${css_imagedomain}/js/jquery-1.9.1.min.js"></script>
<!-- My97DatePicker -->
<link type="text/css" rel="stylesheet" href="${css_imagedomain}/My97DatePicker/skin/WdatePicker.css" />
<script language="javascript" type="text/javascript" src="${css_imagedomain}/My97DatePicker/WdatePicker.js"></script>
<script language="javascript" type="text/javascript" src="${css_imagedomain}/My97DatePicker/lang/zh-cn.js"></script>

<script type="text/javascript">
	$(top.hangge());
</script>
</head>

<body>
<jsp:useBean id="now" class="java.util.Date" />
 <fmt:formatDate value="${now}" type="both" dateStyle="long" pattern="yyyy-MM-dd" var="today"/>
	<div class="container-fluid" id="main-container">


		<div id="page-content" class="clearfix">

			<div class="row-fluid">

				<div class="row-fluid">

					<!-- 检索  -->
					<form action="tender/list.do" id="tender" method="post">
						<table>
							<tr>
								<td><span class="input-icon"> <input
										autocomplete="off" id="userNameOrBname" type="text"
										name="userNameOrBname"  placeholder="这里输入关键词" value="${query.userNameOrBname}"/>
										<i id="nav-search-icon" class="icon-search"></i>
								</span></td>
							<td><span class="input-icon">
									<select name="tag" id="tag">
											<option value="">全部订单</option>
											<c:forEach items="${hjsSysConfigs}" var="hsc" varStatus="vspc">
												<option value="${hsc.code}" <c:if test="${hsc.code eq query.tag}">selected="selected"</c:if>>${hsc.cname}</option>
											</c:forEach>
									</select>
									</span>
								</td>
								<td align="right">            
								 <input class="Wdate span11" type="text" placeholder="点击显示日历" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',maxDate:'#F{$dp.$D(\'createTimeEnd\')||\'%y-%M-%d\'}'})" id="createTimeBegin" name="createTimeBegin" validate="{required:true,messages:{required:'请选择开始时间'}}" value="<fmt:formatDate value="${query.createTimeBegin}" pattern="yyyy-MM-dd" />"/>
                                 </td>
								<td align="right">         	
								 <input class="Wdate span11" type="text" placeholder="点击显示日历" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',minDate:'#F{$dp.$D(\'createTimeBegin\')}',maxDate:'%y-%M-%d'})" id="createTimeEnd" name="createTimeEnd" validate="{required:true,messages:{required:'请选择结束时间'}}" value="<fmt:formatDate value="${query.createTimeEnd}" pattern="yyyy-MM-dd" />" />
								 </td>
								
								 <td align="right">&nbsp;&nbsp;&nbsp;<button
										class="btn btn-mini btn-light" onclick="search();" title="查询">查询</button>
							     </td>

								
							</tr>
						</table>
						<!-- 检索  -->


						<table id="table_report"
							class="table table-striped table-bordered table-hover">

							<thead>
								<tr>
									<th class="center"><label><input type="checkbox"
											id="zcheckbox" /><span class="lbl"></span></label></th>
									<th class="center">ID</th>
									<!-- <th class="center">订单编号</th> -->
									<th class="center">用户名</th>
									<th class="center">产品名称</th>
									<th class="center">投标金额（元）</th>
									<th class="center">预计收益（元）</th>
									<th class="center">订单时间</th>
									<th class="center">订单状态</th>
									<th class="center">合同归档状态</th>
									<th class="center">操作</th>
                                </tr>
							</thead>

							<tbody>
                                <!-- 开始循环 -->
								<c:choose>
									<c:when test="${not empty page.result}">

										<c:forEach items="${page.result}" var="td">

											<tr >
												<td class='center' style="width: 30px;">
												   <label><input type='checkbox' name='ids' value="${td.id }" />
												   <span class="lbl"></span>
												   </label>
											    </td>
											    <td class="center"><a style="cursor: pointer;" onclick="detail(${td.ID})">${td.ID}</a></td>
                                                <td class="center">${td.USERNAME}</td>
												<td class="center">${td.B_NAME}</td>
												<td class="center">${td.TENDER_ACCOUNT}</td>
                                                <td class="center">${td.RECOVER_ACCOUNT_ALL}</td>
                                                <td class="center"><fmt:formatDate value="${td.CREATE_TIME}" pattern="yyyy/MM/dd HH:mm:ss" /><br />
                                                </td>
                                                <td class="center" style="width: 60px;">
                                                 <!-- 未付款0,申请中(进行中**%（投资开始时间到结束时间内的状态）、进行中**%（到达投资结束时间的状态）、满标不通过、流标不通过) ,退款中2,已退款3,持有中(满标通过、未放款、已放款、未还款
                                                 ),已结清5-->
                                                  <c:choose>
                                                  <c:when test="${(td.VERIFY_STATUS eq 2 || td.VERIFY_STATUS eq 4 || td.VERIFY_STATUS eq 13)&&(td.STATUS eq 1 || td.STATUS eq 7)}">
                                                                                                                                申请中
                                                  </c:when>
                                                  <c:when test="${(td.VERIFY_STATUS eq 3 || td.VERIFY_STATUS eq 6 || td.VERIFY_STATUS eq 5 || td.VERIFY_STATUS eq 11)&&(td.STATUS eq 1)}">
                                                                                                                                 持有中 
                                                  </c:when>
                                                   <c:when test="${(td.VERIFY_STATUS eq 12)&&(td.STATUS eq 4)}">
                                                                                                                                已退款
                                                  </c:when>  
                                                  <c:when test="${(td.VERIFY_STATUS eq 8 || td.VERIFY_STATUS eq 10)&&(td.STATUS eq 1)}">
                                                                                                                                已结清
                                                  </c:when>
                                                  
                                                  <c:when test="${td.STATUS eq 0}">
                                                                                                                                未付款
                                                  </c:when>
                                                  <c:when test="${td.STATUS eq 5}">
                                                                                                                                系统取消 <a
													align="center" class='btn btn-mini btn-info'
													onclick="deal(${td.ID})">操作</a>
                                                  </c:when>
                                                  <c:when test="${td.STATUS eq 6}">
                                                                                                                                异常投标<a
													align="center" class='btn btn-mini btn-info'
													onclick="deal(${td.ID})">操作</a>
                                                  </c:when>
												  </c:choose>
												</td>
												<td class="center">
													<c:choose>
														<c:when test="${td.FILE_STATUS eq 0}">
															未归档
														</c:when>
														<c:when test="${td.FILE_STATUS eq 1}">
															已归档
														</c:when>
														<c:when test="${td.FILE_STATUS eq 2}">
															归档失败
														</c:when>
													</c:choose>

												</td>
												<td class="center"><c:choose>
													<c:when test="${td.FILE_STATUS eq 1}"><a href="${td.VIEWPDF_URL}">查看合同</a></c:when>
													<c:otherwise>查看合同</c:otherwise>
												</c:choose>
												</td>
											</tr>
                                       </c:forEach>
                                  </c:when>
									<c:otherwise>
										<tr class="main_info">
											<td colspan="10" class="center">没有相关数据</td>
										</tr>
									</c:otherwise>
								</c:choose>
                            </tbody>
						</table>

						<div class="page-header position-relative">
							<table style="width: 100%;">
							  <tr>
                                <td style="vertical-align: top;">
                                <div class="pagination" style="float: right; padding-top: 0px; margin-top: 0px;">${page.pageStr}</div>
                                </td>
						      </tr>
							</table>
						</div>
					</form>
				</div>




				<!-- PAGE CONTENT ENDS HERE -->
			</div>
			<!--/row-->

		</div>
		<!--/#page-content-->
	</div>
	<!--/.fluid-container#main-container-->

	<!-- 返回顶部  -->
	<a href="#" id="btn-scroll-up" class="btn btn-small btn-inverse"> <i
		class="icon-double-angle-up icon-only"></i>
	</a>

	
	
	


	
	<script type="text/javascript">
        //检索
		function search() {
          $("#tender").submit();
		}
       
     </script>

	<script type="text/javascript">
		$(function() {
            //复选框
			$('table th input:checkbox').on(
					'click',
					function() {
						var that = this;
						$(this).closest('table').find(
								'tr > td:first-child input:checkbox').each(
								function() {
									this.checked = that.checked;
									$(this).closest('tr').toggleClass(
											'selected');
								});

					});

		});
		 function detail(id){
		        	top.jzts();
		         	var diag = new top.Dialog();
		         	diag.Drag=true;
		        	diag.Title ="详情";
		        	diag.URL = '${project_name}/tender/detail.do?id='+id;
		        	diag.Width = 950;
		        	diag.Height = 300;
		        	diag.CancelEvent = function(){ //关闭事件
		        	if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
		        		top.jzts();
		        		setTimeout("self.location.reload()",100);
		        		
		        	}

		        	diag.close();
		        	};
		        	diag.show();
		        }
		 function deal(id){
			 $.ajax({
					url:"borrow/unFreeZeBgByTenderId.do",
					type:"post",
					dataType:"text",
					data:"tenderId="+id,
					success:function(result){
							alert(result);
							window.location.reload(true);
					},
					error:function(){
						alert("操作失败");
					}
				});
			 
		 }
	</script>

</body>
<jsp:include page="../../common/alert_message.jsp"></jsp:include>
</html>

