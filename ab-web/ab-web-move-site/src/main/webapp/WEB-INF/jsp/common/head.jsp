<%@ page language="java"  pageEncoding="UTF-8"%>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link href="${css_imagedomain}/move/css/mobile.css" rel="stylesheet" />
	<link href="${css_imagedomain}/move/css/secCss.css" rel="stylesheet" />
	<script src="${css_imagedomain}/move/js/zepto.min.js"></script>
	<script type="text/javascript">
	//禁用Enter键表单自动提交
    document.onkeydown = function(event) {
        var target, code, tag;
        if (!event) {
            event = window.event; //针对ie浏览器
            target = event.srcElement;
            code = event.keyCode;
            if (code == 13) {
                tag = target.tagName;
                if (tag == "TEXTAREA") { return true; }
                else { return false; }
            }
        }
        else {
            target = event.target; //针对遵循w3c标准的浏览器，如Firefox
            code = event.keyCode;
            if (code == 13) {
                tag = target.tagName;
                if (tag == "INPUT") { return false; }
                else { return true; } 
            }
        }
    };
	</script>
</head>

