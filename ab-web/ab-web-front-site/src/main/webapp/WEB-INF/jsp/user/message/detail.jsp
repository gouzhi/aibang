<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/taglibs.jsp"%>
<div id="messageDetail">
<div class="mask"></div>
<div class="xiaoxi_tan">
	
	<h3>消息提示</h3>
    <span class="Close">x</span>
    <p>${message.contents }</p>
</div>
</div>
<script type="text/javascript">
$(function(){
	$('.Close').click(function(){
		$('.mask').hide();
		$('.xiaoxi_tan').hide();
		window.location.href="${project_name}/user/message/page";
	});
});
</script>