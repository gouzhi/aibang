/*******************************************************************************
 * jQuery Validate扩展验证方法 (zff)
 ******************************************************************************/
/*****************************************************************
                  jQuery Validate扩展验证方法  (linjq)       
*****************************************************************/
$(function(){
	
	// 验证值小数位数不能超过两位
	jQuery.validator.addMethod("decimal", function(value, element) {
		var decimal = /^-?\d+(\.\d{1,2})$/;
		return this.optional(element) || (decimal.test(value));
		}, "小数位数两位!");
    // 判断整数value是否等于0 
    jQuery.validator.addMethod("isIntEqZero", function(value, element) { 
         value=parseInt(value);      
         return this.optional(element) || value==0;       
    }, "整数必须为0"); 
      
    // 判断整数value是否大于0
    jQuery.validator.addMethod("isIntGtZero", function(value, element) { 
         value=parseInt(value);      
         return this.optional(element) || value>0;       
    }, "整数必须大于0"); 
      
    // 判断整数value是否大于或等于0
    jQuery.validator.addMethod("isIntGteZero", function(value, element) { 
         value=parseInt(value);      
         return this.optional(element) || value>=0;       
    }, "整数必须大于或等于0");   
    
    // 判断整数value是否不等于0 
    jQuery.validator.addMethod("isIntNEqZero", function(value, element) { 
         value=parseInt(value);      
         return this.optional(element) || value!=0;       
    }, "整数必须不等于0");  
    
    // 判断整数value是否小于0 
    jQuery.validator.addMethod("isIntLtZero", function(value, element) { 
         value=parseInt(value);      
         return this.optional(element) || value<0;       
    }, "整数必须小于0");  
    
    // 判断整数value是否小于或等于0 
    jQuery.validator.addMethod("isIntLteZero", function(value, element) { 
         value=parseInt(value);      
         return this.optional(element) || value<=0;       
    }, "整数必须小于或等于0");  
    //整数最多8位小数最多两位
    jQuery.validator.addMethod("intMaxEight", function(value, element) {
		var decimal = /^([1-9][\d]{0,7}|0)(\.[\d]{0,2})?$/;;
		return this.optional(element) || (decimal.test(value));
		}, "整数最多8位小数最多两位!");      
    
    // 判断浮点数value是否等于0 
    jQuery.validator.addMethod("isFloatEqZero", function(value, element) { 
         value=parseFloat(value);      
         return this.optional(element) || value==0;       
    }, "浮点数必须为0"); 
      
    // 判断浮点数value是否大于0
    jQuery.validator.addMethod("isFloatGtZero", function(value, element) { 
         value=parseFloat(value);      
         return this.optional(element) || value>0;       
    }, "浮点数必须大于0"); 
      
    // 判断浮点数value是否大于或等于0
    jQuery.validator.addMethod("isFloatGteZero", function(value, element) { 
         value=parseFloat(value);      
         return this.optional(element) || value>=0;       
    }, "浮点数必须大于或等于0");   
    
    // 判断浮点数value是否不等于0 
    jQuery.validator.addMethod("isFloatNEqZero", function(value, element) { 
         value=parseFloat(value);      
         return this.optional(element) || value!=0;       
    }, "浮点数必须不等于0");  
    
    // 判断浮点数value是否小于0 
    jQuery.validator.addMethod("isFloatLtZero", function(value, element) { 
         value=parseFloat(value);      
         return this.optional(element) || value<0;       
    }, "浮点数必须小于0");  
    
    // 判断浮点数value是否小于或等于0 
    jQuery.validator.addMethod("isFloatLteZero", function(value, element) { 
         value=parseFloat(value);      
         return this.optional(element) || value<=0;       
    }, "浮点数必须小于或等于0");  
    
    // 判断浮点型  
    jQuery.validator.addMethod("isFloat", function(value, element) {       
         return this.optional(element) || /^[-\+]?\d+(\.\d+)?$/.test(value);       
    }, "只能包含数字、小数点等字符"); 
     
    // 匹配integer
    jQuery.validator.addMethod("isInteger", function(value, element) {       
         return this.optional(element) || (/^[-\+]?\d+$/.test(value) && parseInt(value)>=0);       
    }, "匹配integer");  
     
    // 判断数值类型，包括整数和浮点数
    jQuery.validator.addMethod("isNumber", function(value, element) {       
         return this.optional(element) || /^[-\+]?\d+$/.test(value) || /^[-\+]?\d+(\.\d+)?$/.test(value);       
    }, "匹配数值类型，包括整数和浮点数");  
    
    // 只能输入[0-9]数字
    jQuery.validator.addMethod("isDigits", function(value, element) {       
         return this.optional(element) || /^\d+$/.test(value);       
    }, "只能输入0-9数字");  
    // 只能输入[0-9]和“.”
    jQuery.validator.addMethod("isDigitsDot", function(value, element) {    
    	  if(value<=0){return false;}
    	  if(value=100){return true;}
         //return this.optional(element) || /^([1-9]+\d*)|((0\.\d{1,2})|([1-9]+\d*\.\d{1,2}))$/.test(value); 
         return this.optional(element) || /^[1-9]{1}$/.test(value) || /^[1-9]{1}\d{1}$/.test(value) || /^[1-9]{1}\d{1}\.\d{1,2}$/.test(value) || /^\d{1}\.\d{1,2}$/.test(value);
    }, "请输入正确的年化收益");
    // 判断中文字符 
    jQuery.validator.addMethod("isChinese", function(value, element) {       
         return this.optional(element) || /^[\u0391-\uFFE5]+$/.test(value);       
    }, "只能包含中文字符。");   
 
    // 判断英文字符 
    jQuery.validator.addMethod("isEnglish", function(value, element) {       
         return this.optional(element) || /^[A-Za-z]+$/.test(value);       
    }, "只能包含英文字符。");   
 
     // 手机号码验证    
    jQuery.validator.addMethod("isMobile", function(value, element) {    
      var length = value.length;    
      return this.optional(element) || (length == 11 && /^(((13[0-9]{1})|(17[0-9]{1})|(15[0-9]{1})|(18[0-9]{1}))+\d{8})$/.test(value));    
    }, "请正确填写您的手机号码。");

    // 电话号码验证    
    jQuery.validator.addMethod("isPhone", function(value, element) {    
      var tel = /^(\d{3,4}-?)?\d{7,9}$/g;    
      return this.optional(element) || (tel.test(value));    
    }, "请正确填写您的电话号码。");

    // 联系电话(手机/电话皆可)验证   
    jQuery.validator.addMethod("isTel", function(value,element) {   
        var length = value.length;   
        var mobile = /^(((13[0-9]{1})|(15[0-9]{1})|(18[0-9]{1}))+\d{8})$/;   
        var tel = /^(\d{3,4}-?)?\d{7,9}$/g;       
        return this.optional(element) || tel.test(value) || (length==11 && mobile.test(value));   
    }, "请正确填写您的联系方式");
    // 邮箱验证    
    jQuery.validator.addMethod("isEmail", function(value, element) {    
      var email = /^(?:[a-zA-Z0-9]+[_\-\+\.]?)*[a-zA-Z0-9]+@(?:([a-zA-Z0-9]+[_\-]?)*[a-zA-Z0-9]+\.)+([a-zA-Z]{2,})+$/g;    
      return this.optional(element) || (email.test(value));    
    }, "请正确填写您的邮箱");
 
     // 匹配qq      
    jQuery.validator.addMethod("isQq", function(value, element) {       
         return this.optional(element) || /^[1-9]\d{4,12}$/.test(value);       
    }, "匹配QQ");   
 
     // 邮政编码验证    
    jQuery.validator.addMethod("isZipCode", function(value, element) {    
      var zip = /^[0-9]{6}$/;    
      return this.optional(element) || (zip.test(value));    
    }, "请正确填写您的邮政编码。");  
    
    // 匹配密码，以字母开头，长度在6-32之间，只能包含字符、数字和下划线。      
    jQuery.validator.addMethod("isPwd", function(value, element) {       
         return this.optional(element) || /^.{6,32}$/.test(value);       
    }, "以字母开头，长度在6-32之间，只能包含字符、数字和下划线。");  
    
    // 身份证号码验证
    jQuery.validator.addMethod("isIdCardNo", function(value, element) { 
      //var idCard = /^(\d{6})()?(\d{4})(\d{2})(\d{2})(\d{3})(\w)$/;   
      return this.optional(element) || isIdCardNo(value);    
    }, "请输入正确的身份证号码。"); 
    
    // 16位银行卡号（19位通用）银行卡号验证
    jQuery.validator.addMethod("isBankCard", function(value, element) { 
      return this.optional(element) || luhmCheck(value);    
    }, "请输入正确的银行卡号。"); 

    // IP地址验证   
    jQuery.validator.addMethod("ip", function(value, element) {    
      return this.optional(element) || /^(([1-9]|([1-9]\d)|(1\d\d)|(2([0-4]\d|5[0-5])))\.)(([1-9]|([1-9]\d)|(1\d\d)|(2([0-4]\d|5[0-5])))\.){2}([1-9]|([1-9]\d)|(1\d\d)|(2([0-4]\d|5[0-5])))$/.test(value);    
    }, "请填写正确的IP地址。");
   
    // 字符验证，只能包含中文、英文、数字、下划线等字符。    
    jQuery.validator.addMethod("stringCheck", function(value, element) {       
         return this.optional(element) || /^[a-zA-Z0-9\u4e00-\u9fa5-_]{4,16}$/.test(value);       
    }, "只能包含中文、英文、数字、下划线等字符");   
    // 用户名验证，只能包含英文、数字、_、- 。    
    jQuery.validator.addMethod("usernameCheck", function(value, element) {       
         return this.optional(element) || /^[a-zA-Z0-9_-]{4,16}$/.test(value);       
    }, "只能包含中文、英文、数字、下划线等字符");
    // 匹配english  
    jQuery.validator.addMethod("isEnglish", function(value, element) {       
         return this.optional(element) || /^[A-Za-z]+$/.test(value);       
    }, "匹配english");   
    
    // 匹配汉字  
    jQuery.validator.addMethod("isChinese", function(value, element) {       
         return this.optional(element) || /^[\u4e00-\u9fa5]+$/.test(value);       
    }, "匹配汉字");   
    
    // 匹配中文(包括汉字和字符) 
    jQuery.validator.addMethod("isChineseChar", function(value, element) {       
         return this.optional(element) || /^[\u0391-\uFFE5]+$/.test(value);       
    }, "匹配中文(包括汉字和字符) "); 
      
    // 判断是否为合法字符(a-zA-Z0-9-_)
    jQuery.validator.addMethod("isRightfulString", function(value, element) {       
         return this.optional(element) || /^[A-Za-z0-9_-]+$/.test(value);       
    }, "判断是否为合法字符(a-zA-Z0-9-_)");   
    
    // 判断是否包含中英文特殊字符，除英文"-_"字符外
    jQuery.validator.addMethod("isContainsSpecialChar", function(value, element) {  
         var reg = RegExp(/[(\ )(\`)(\~)(\!)(\@)(\#)(\$)(\%)(\^)(\&)(\*)(\()(\))(\+)(\=)(\|)(\{)(\})(\')(\:)(\;)(\')(',)(\[)(\])(\.)(\<)(\>)(\/)(\?)(\~)(\！)(\@)(\#)(\￥)(\%)(\…)(\&)(\*)(\（)(\）)(\—)(\+)(\|)(\{)(\})(\【)(\】)(\‘)(\；)(\：)(\”)(\“)(\’)(\。)(\，)(\、)(\？)]+/);   
         return this.optional(element) || !reg.test(value);       
    }, "含有中英文特殊字符");   
	//判断手机短信验证码
    jQuery.validator.addMethod("isSmsCode", function (value, element) {
        return this.optional(element) || /^\d{6}$/.test(value);
    },"请输入正确的短信验证码");
    //判断验证码
    jQuery.validator.addMethod("isVerifyCode", function (value, element) {
        return this.optional(element) || /^[0-9a-zA-Z]{4}$/.test(value);
    },"请输入正确的验证码");
    //充值金额验证
    jQuery.validator.addMethod("isRightAmount", function (value, element) {
        return this.optional(element) || /^\d+(\.\d{0,2})?$/.test(value)
    },"充值金额必须为整数或小数");
    //提现金额验证
    jQuery.validator.addMethod("isRightCashAmount", function (value, element) {
        return this.optional(element) || /^\d+(\.\d{0,2})?$/.test(value)
    },"提现金额必须为整数或小数");
    //充值最大金额验证
    jQuery.validator.addMethod("isBigAmountRecharge", function (value, element) {
        var isBig = true;
        if(value>99999999){
            isBig = false;
        }
        return this.optional(element) || isBig
    },"超出单次最大充值金额");
    //提现最大金额验证
    jQuery.validator.addMethod("isBigAmountCash", function (value, element) {
        var isBig = true;
        var avilibleAmount = Number($("#avilableAmount").html());
        if(value>avilibleAmount){
            isBig = false;
        }
        return this.optional(element) || isBig
    },"提现金额不能大于可提现余额");
    //提现最小金额判断
    jQuery.validator.addMethod("isLittleAmountCash", function (value, element) {
        var isLittle = true;
        if(value<1){
            isLittle = false;
        }
        return this.optional(element) || isLittle
    },"单笔最小取现金额为1元");
    //提现判断验证码
    jQuery.validator.addMethod("isVerifyCodeCash", function (value, element) {
        return this.optional(element) || /^[0-9a-zA-Z]{4}$/.test(value);
    },"请输入正确的验证码");
    //充值金额不能为零
    jQuery.validator.addMethod("isZeroAmountRecharge", function (value, element) {
        var isZero = true;
        if(value==0){
            isZero = false;
        }
        return this.optional(element) || isZero
    },"充值金额不能为0");
    //提现金额不能为零
    jQuery.validator.addMethod("isZeroAmountCash", function (value, element) {
        var isZero = true;
        if(value==0){
            isZero = false;
        }
        return this.optional(element) || isZero
    },"提现金额不能为0");
	// 身份证号码的验证规则
	function isIdCardNo(num) {
		// if (isNaN(num)) {alert("输入的不是数字！"); return false;}
		var len = num.length, re;
		if (len == 15)
			re = new RegExp(/^(\d{6})()?(\d{2})(\d{2})(\d{2})(\d{2})(\w)$/);
		else if (len == 18)
			re = new RegExp(/^(\d{6})()?(\d{4})(\d{2})(\d{2})(\d{3})(\w)$/);
		else {
			// alert("输入的数字位数不对。");
			return false;
		}
		var a = num.match(re);
		if (a != null) {
			if (len == 15) {
				var D = new Date("19" + a[3] + "/" + a[4] + "/" + a[5]);
				var B = D.getYear() == a[3] && (D.getMonth() + 1) == a[4]
						&& D.getDate() == a[5];
			} else {
				var D = new Date(a[3] + "/" + a[4] + "/" + a[5]);
				var B = D.getFullYear() == a[3] && (D.getMonth() + 1) == a[4]
						&& D.getDate() == a[5];
			}
			if (!B) {
				// alert("输入的身份证号 "+ a[0] +" 里出生日期不对。");
				return false;
			}
		}
		if (!re.test(num)) {
			// alert("身份证最后一位只能是数字和字母。");
			return false;
		}
		return true;
	}

	//Luhm校验规则：16位银行卡号（19位通用）:
	 
	// 1.将未带校验位的 15（或18）位卡号从右依次编号 1 到 15（18），位于奇数位号上的数字乘以 2。
	// 2.将奇位乘积的个十位全部相加，再加上所有偶数位上的数字。
	// 3.将加法和加上校验位能被 10 整除。
	 
	//方法步骤很清晰，易理解，需要在页面引用Jquery.js    
	 
	 
	//bankno为银行卡号 banknoInfo为显示提示信息的DIV或其他控件
	function luhmCheck(bankno){
		if(bankno.length == 19){		
		}else if(bankno.length == 16){			
		}else{
			return false;
		}
	    var lastNum=bankno.substr(bankno.length-1,1);//取出最后一位（与luhm进行比较）
	 
	    var first15Num=bankno.substr(0,bankno.length-1);//前15或18位
	    var newArr=new Array();
	    for(var i=first15Num.length-1;i>-1;i--){    //前15或18位倒序存进数组
	        newArr.push(first15Num.substr(i,1));
	    }
	    var arrJiShu=new Array();  //奇数位*2的积 <9
	    var arrJiShu2=new Array(); //奇数位*2的积 >9
	     
	    var arrOuShu=new Array();  //偶数位数组
	    for(var j=0;j<newArr.length;j++){
	        if((j+1)%2==1){//奇数位
	            if(parseInt(newArr[j])*2<9)
	            arrJiShu.push(parseInt(newArr[j])*2);
	            else
	            arrJiShu2.push(parseInt(newArr[j])*2);
	        }
	        else //偶数位
	        arrOuShu.push(newArr[j]);
	    }
	     
	    var jishu_child1=new Array();//奇数位*2 >9 的分割之后的数组个位数
	    var jishu_child2=new Array();//奇数位*2 >9 的分割之后的数组十位数
	    for(var h=0;h<arrJiShu2.length;h++){
	        jishu_child1.push(parseInt(arrJiShu2[h])%10);
	        jishu_child2.push(parseInt(arrJiShu2[h])/10);
	    }        
	     
	    var sumJiShu=0; //奇数位*2 < 9 的数组之和
	    var sumOuShu=0; //偶数位数组之和
	    var sumJiShuChild1=0; //奇数位*2 >9 的分割之后的数组个位数之和
	    var sumJiShuChild2=0; //奇数位*2 >9 的分割之后的数组十位数之和
	    var sumTotal=0;
	    for(var m=0;m<arrJiShu.length;m++){
	        sumJiShu=sumJiShu+parseInt(arrJiShu[m]);
	    }
	     
	    for(var n=0;n<arrOuShu.length;n++){
	        sumOuShu=sumOuShu+parseInt(arrOuShu[n]);
	    }
	     
	    for(var p=0;p<jishu_child1.length;p++){
	        sumJiShuChild1=sumJiShuChild1+parseInt(jishu_child1[p]);
	        sumJiShuChild2=sumJiShuChild2+parseInt(jishu_child2[p]);
	    }      
	    //计算总和
	    sumTotal=parseInt(sumJiShu)+parseInt(sumOuShu)+parseInt(sumJiShuChild1)+parseInt(sumJiShuChild2);
	     
	    //计算Luhm值
	    var k= parseInt(sumTotal)%10==0?10:parseInt(sumTotal)%10;        
	    var luhm= 10-k;
	     
	    if(lastNum==luhm){
	    	return true;
	    }
	    else{
	    	return false;
	    }        
	}
});