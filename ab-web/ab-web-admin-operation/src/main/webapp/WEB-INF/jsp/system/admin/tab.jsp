<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/taglib.jsp"%>
<!DOCTYPE html>
<html lang="en">
	<head>
	<base href="${project_name}/">
	<script type="text/javascript" src="${css_imagedomain}/js/jquery-1.7.2.js"></script>
	<script type="text/javascript" src="${css_imagedomain}/plugins/tab/js/framework.js"></script>
	<link href="${css_imagedomain}/plugins/tab/css/import_basic.css" rel="stylesheet" type="text/css"/>
	<link  rel="stylesheet" type="text/css" id="skin" prePath="${css_imagedomain}/plugins/tab/" /><!--默认相对于根目录路径为../，可添加prePath属性自定义相对路径，如prePath="<%=request.getContextPath()%>"-->
	<script type="text/javascript" charset="utf-8" src="${css_imagedomain}/plugins/tab/js/tab.js"></script>
	<script type="text/javascript" charset="utf-8" src="${css_imagedomain}/js/jQuery.md5.js"></script>
	</head>
<body>
<div id="tab_menu" ></div>
<div style="width:100%;">
	<div id="page" style="width:100%;height:100%;"></div>
</div>		
</body>
<script type="text/javascript">
//回刷列表页 在页面加载的时候显示
//参数 re 路径的正则表达式 例如 /Customer\/contactList/;
function reloadPage(re)
{
	$(window.document).find("iframe").each(function(){
		if(re.test($(this).attr('src'))){ 
		   //$(this).contents().find("form").submit();
		    var results = new RegExp('[\\?&]pageNumber=([^&#]\d*)').exec($(this)[0].contentWindow.location.href); 
		    if(results!=null)
		    {
		       $(this)[0].contentWindow.nextPage(results[1]);
		    }else
		    {
		       $(this)[0].contentWindow.nextPage(1);
		    }
		}
	});
}

//添加TAB 页
function showTabPage(title,url)
{
	tabAddHandler($.md5(url),title,url);
}
//关闭当前显示的Tab
function closeCurrTab()
{
	$(".tab_item2_selected").find(".tab_close").click();
}
function tabAddHandler(mid,mtitle,murl){
	tab.add({
	id :mid,
	title :mtitle,
	url :murl,
	isClosed :true
	});
	tab.update({
		id :mid,
		title :mtitle,
		url :murl,
		isClosed :true
	});
	tab.activate(mid);
}
 var tab;	
$( function() {
	 tab = new TabView( {
		containerId :'tab_menu',
		pageid :'page',
		cid :'tab1',
		position :"top"
	});
	tab.add( {
		id :'tab1_index1',
		title :"主页",
		url :"${project_name}/login_default.do",
		isClosed :false
	});
	/**tab.add( {
		id :'tab1_index1',
		title :"主页",
		url :"/per/undoTask!gettwo",
		isClosed :false
	});
	**/
});

	function cmainFrameT(){
		var hmainT = document.getElementById("page");
		var bheightT = document.documentElement.clientHeight;
		hmainT .style.width = '100%';
		hmainT .style.height = (bheightT  - 51) + 'px';
	}
	cmainFrameT();
	window.onresize=function(){  
		cmainFrameT();
	};

</script>
</html>

