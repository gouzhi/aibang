<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/taglibs.jsp"%>
<!DOCTYPE unspecified PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>消息中心 - 华金所</title>
<%@ include file="/WEB-INF/jsp/common/head.jsp" %>
<link href="${css_imagedomain}/front/css/trading.css" rel="stylesheet" type="text/css" />
<link href="${css_imagedomain}/front/css/xiaoxiMask.css" rel="stylesheet" type="text/css" />
<script src="${css_imagedomain}/front/js/trading.js" type="text/javascript"></script>

</head> 
<body style="background: #e8e8e8;">
<%@ include file="/WEB-INF/jsp/common/top.jsp"%>
<div class="accountContent clear">
    <div id="nav_point" class="icoPoint">
		<span><a href="${education_domain}" style="font-size: 14px;color:#777;">首页</a></span>
        <i> &gt; </i>
        <span style="font-size: 14px;color:#777;">消息中心</span>
    </div>
	<%@ include file="/WEB-INF/jsp/common/left.jsp"%>
	<div class="account-Right fl">
		<h3 class="messageHead">消息中心</h3>
	<form action="page" method="post" id="form">
	<input type="hidden" name="isread" id="isread" value="${query.isread }">
		<div class="message">
			<div class="messageNav_list">
				<span class="dope dopes active" onclick="getAllMessage()">
					<a href="${project_name}/user/message/page" >全部消息</a>
				</span>
				<span class="dope" onclick="getNoReadMessage()">
					<a href="${project_name}/user/message/page?isread=1" >未读消息</a>
				</span>
			</div>
            <div class="messageNav">
            	<label>
                	<input type="checkbox" id="chk_all">
                    <span class="selected">全选</span>
                </label>
                <input type="button" value="标记为已读" class="mark selected"/>
                <input type="button" value="删除" class="delete selected" />

				<script>
					$(function(){

						$('.selected').on("mouseover",function(){
							$(this).css('color','#6b6b6b');
						});
						$('.selected').on("mouseout",function(){
							$(this).css('color','#a6a6a6');
						});
					});
				</script>

            </div>
            <ul class="messageList">
            	<c:forEach items="${page.result}" var="item">
            	<li>
					<label class="messSp2">
						<input type="checkbox" name="icheckbox" value="${item.ID }"/>
						<span class="<c:if test="${item.STATUS == 2 }">read</c:if>">${item.MSG_TITLE }</span>
					</label>
                	<span class="messSp1"><fmt:formatDate value="${item.CREATE_TIME }" pattern="yyyy-MM-dd"/></span>
                    <span class="messSp3"><a href="javascript:void(0)" onclick="detail('detail?id=${item.ID}')">[详情]</a></span>
                </li>
            	</c:forEach>
            </ul>

            <div class="pagination" style="width: 900px;padding: 20px 0 50px;">
			<span style="text-align: center;">${page.frontPageStr}</span>
			</div>
			<div class="clear"></div>
        </div>
		<style>
			.pagination ul{width: 900px;}
		</style>
        </form>
    </div>
    
</div>
<%@ include file="/WEB-INF/jsp/common/foot.jsp"%>
<%@ include file="detail.jsp"%>
</body> 
</html>
<script type="text/javascript">
var noticesIds = [];
$(function() {
	$("#chk_all").on("click",function() {
        $('input[name="icheckbox"]').prop("checked",this.checked); 
    });
    var $subBox = $("input[name='icheckbox']");
    $subBox.on("click",function(){
        $("#chk_all").prop("checked",$subBox.length == $("input[name='icheckbox']:checked").length ? true : false);
    });
    //显示未读消息
    $("#showNotRead").on("click",function(){
    	if(this.checked){
    		$("#isread").val(1);
    	}else{
    		$("#isread").val(0);
    	}
    	$("#form").submit();
    });
	//移入变色
	$('.messageList li').on("mouseover",function(){
		$(this).css('background','#fbfbfb');
	});
	$('.messageList li').on("mouseout",function(){
		$(this).css('background','#fff');
	});
    //标记为已读
    $(".mark").on("click",function(){
    	getChecked();
    	if(null == noticesIds || noticesIds.length == 0){
    		//alert("请选择需要标记为已读的消息");
    	}
    	SubAjax("domark", noticesIds)
    });
    
    //delete
    $(".delete").on("click",function(){
    	getChecked();
    	if(null == noticesIds || noticesIds.length == 0){
    		//alert("请选择需要删除的消息");
    	}
    	SubAjax("doremove", noticesIds)
    });
});
//get checked checkbox id
function getChecked(){
	$('input[name="icheckbox"]').map(function(){
		if(this.checked){
			noticesIds.push($(this).val());
		}
	});
}
//comcmon ajax submit
function SubAjax(url,noticesIds){
	$.ajax({
		url:url,
		data:{"records":noticesIds},
		type:"post",
		dataType:"json",
		success:function(result){
			if(result == "200"){
				//alert("操作成功");
				window.location.reload(true);
			}else{
				alert(result);
			}
		}
	});
}
/**
 * 详情
 */
function detail(url){
	$.ajax({
		type:"post",
		url:url,
		dataType:"html",
		async:true,
		success:function(data){
			$("#messageDetail").html(data);
			$('.mask').show();
			$('.xiaoxi_tan').show();	
		}
	});
}
</script>