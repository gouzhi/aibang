<%@ page language="java" pageEncoding="UTF-8"%>

<div id="navi" class="footBg"><a href="http://www.huafax.com/hjsh5/" class="a1"><b></b><span>精选推荐</span></a><a href="${project_name}/borrow/list" class="a2"><b></b><span>产品列表</span></a><a href="${project_name}/user/center/accountall" class="a3"><b></b><span>个人中心</span></a></div>
 
<script type="text/javascript" language="javascript">
$(function(){
var modelName=$("#nav_point").val();
$("#navi").find("a").removeClass("hover");
$("#navi").find("a span:contains("+modelName+")").parents("a").addClass("hover");
});
</script>