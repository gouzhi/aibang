<%@ page language="java" pageEncoding="UTF-8"%>

<div id="navi" class="footBg">
<a href="${project_name}/toIndex" class="a1"><b></b><span>首页</span></a>
<a href="${project_name}/toFind" class="a2"><b></b><span>发现</span></a>
<a href="${project_name}/toRelease" class="a3"><b></b><span>发布</span></a>
<a href="${project_name}/toInfo" class="a4"><b></b><span>消息</span></a>
<a href="${project_name}/user/center/accountall" class="a5"><b></b><span>我的</span></a>
</div>
 
<script type="text/javascript" language="javascript">
$(function(){
var modelName=$("#nav_point").val();
$("#navi").find("a").removeClass("hover");
$("#navi").find("a span:contains("+modelName+")").parents("a").addClass("hover");
});
</script>