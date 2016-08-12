<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="../admin/top.jsp"%> 
</head> 
<body>
<div id="page-content" class="clearfix">
  <div class="row-fluid">
 	<div class="span12">
 		<form action="test/saveMessage.do" method="post">
 		<table>
 			<tr>
 				<td>用户名</td>
 				<td><input type="text" name="username"></td>
 			</tr>
 			<tr>
 				<td>邮箱</td>
 				<td id="duckid"><input type="text" name="email"></td>
 			</tr>
 			<tr>
 				<td>手机号</td>
 				<td><input type="text" name="mobile"></td>
 			</tr>
 			<tr>
 				<td>说明</td>
 				<td><script id="editor1" type="text/plain"></script></td>
 			</tr>
 			<tr>
 				<td>说明</td>
 				<td><script id="editor2" type="text/plain"></script></td>
 			</tr>
 		</table>
 		<button type="submit">submit</button>
 		</form>
 		
	</div>
	<!-- 编辑框-->
	<script type="text/javascript" charset="utf-8" src="${css_imagedomain}/plugins/ueditor1_3_5/ueditor.config.js"></script>
	<script type="text/javascript" charset="utf-8" src="${css_imagedomain}/plugins/ueditor1_3_5/ueditor.all.min.js"></script>
	<%-- <script type="text/javascript" charset="utf-8" src="${css_imagedomain}/js/myjs/editor.js"></script> --%>
	<!--建议手动加在语言，避免在ie下有时因为加载语言失败导致编辑器加载失败-->
    <!--这里加载的语言文件会覆盖你在配置项目里添加的语言类型，比如你在配置项目里配置的是英文，这里加载的中文，那最后就是中文-->
    <script type="text/javascript" charset="utf-8" src="${css_imagedomain}/plugins/ueditor1_3_5/lang/zh-cn/zh-cn.js"></script>
    <script type="text/javascript">
    UE.getEditor('editor1');
    UE.getEditor('editor2');
    </script>
	<!-- 编辑框-->
  </div><!--/row-->
</div><!--/#page-content-->
</div><!--/.fluid-container#main-container-->
		
		<!-- 返回顶部  -->
		<a href="#" id="btn-scroll-up" class="btn btn-small btn-inverse">
			<i class="icon-double-angle-up icon-only"></i>
		</a>
		
		<!-- 引入 -->
		<script type="text/javascript">window.jQuery || document.write("<script src='${css_imagedomain}/js/jquery-1.9.1.min.js'>\x3C/script>");</script>
		<script src="${css_imagedomain}/js/bootstrap.min.js"></script>
		<script src="${css_imagedomain}/js/ace-elements.min.js"></script>
		<script src="${css_imagedomain}/js/ace.min.js"></script>
		<!-- 引入 -->
		
		<!--提示框-->
		<script type="text/javascript" src="${css_imagedomain}/js/jquery.tips.js"></script>
		<!--引入属于此页面的js -->
		<script type="text/javascript" src="${css_imagedomain}/js/myjs/toolEmail.js"></script>		
	</body>
</html>

