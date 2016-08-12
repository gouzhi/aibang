$(function() {
		 //  字符验证
		 jQuery.validator.addMethod( "stringCheck", function (value, element)  {       
		    return this.optional(element) || /^[\u0391-\uFFE5\w]+$/.test(value);       
		 } ,  " 只能包括中文字、英文字母、数字和下划线 " );  
		 
		//  身份证号码验证        
		 jQuery.validator.addMethod( "isIdCardNo", function (value, element)  {       
		      var pattern = /^\d{18}|\d{15}$/;
		      if (!pattern.test(value)) { 
		      	return false; 
		      } else {
		      	return true; 
		      } 
		 } ,  " 请正确输入您的证件类型 " ); 

		 //金额验证
		 jQuery.validator.addMethod( "priceCheck", function (value, element)  {
             var pattern = /^(?:\d+|\d+\.\d{0,2})?$/;
             if (!pattern.test(value)) {
                 return false;
             } else {
                 return true;
             }
		 } ,  " 价格请输入数字 " );


    //  卡号数字验证
		 jQuery.validator.addMethod( "cardNoEnd", function (value, element)  {
		    return this.optional(element) || /^\d{4}$/.test(value);
		 } ,  " 请输入正确的卡号未四位!" );

    //  电话号码验证
		 jQuery.validator.addMethod( "isPhone", function (value, element)  {
           var length = value.length;
           var mobile = /^(((13[0-9]{1})|(15[0-9]{1}))+\d{8})$/;
           var tel = /^\d{3,4}-?\d{7,9}$/;
           return this.optional(element) || (tel.test(value) || mobile.test(value));
		 } ,  " 请输入正确的手机号码!" );

         jQuery.validator.addClassRules("isCardNoEnd", {
			  cardNoEnd: true
		 });
    
		 jQuery.validator.addClassRules("isCardNo", {
			  isIdCardNo: true  
		 });
		 
		 jQuery.validator.addClassRules("nameCheck", {
			 stringCheck: true  
		 });
		 
        jQuery.validator.addClassRules("validatePrice", {
             priceCheck: true
        });

        jQuery.validator.addClassRules("isPhoneCheck", {
             isPhone: true
        });
});

jQuery.extend(jQuery.validator.messages, {
        required: "必选字段",
		remote: "请修正该字段",
		email: "请输入正确格式的电子邮件",
		url: "请输入合法的网址",
		date: "请输入合法的日期",
		dateISO: "请输入合法的日期 (ISO).",
		number: "请输入合法的数字",
		digits: "只能输入整数",
		creditcard: "请输入合法的信用卡号",
		equalTo: "请再次输入相同的值",
		accept: "请输入拥有合法后缀名的字符串",
		maxlength: jQuery.validator.format("请输入一个长度最多是 {0} 的字符串"),
		minlength: jQuery.validator.format("请输入一个长度最少是 {0} 的字符串"),
		rangelength: jQuery.validator.format("请输入一个长度介于 {0} 和 {1} 之间的字符串"),
		range: jQuery.validator.format("请输入一个介于 {0} 和 {1} 之间的值"),
		max: jQuery.validator.format("请输入一个最大为 {0} 的值"),
		min: jQuery.validator.format("请输入一个最小为 {0} 的值")
});
//=================================================================================



CompareValidation = $.Class.create({

  initialize : function () {
  },

  compareDate : function (startDateStr , endDateStr , separator, msg) {
	if (!startDateStr || !endDateStr) {
	  return true;
	}

	var startDate = new Date();
	var endDate = new Date();
	var $startDateEles = startDateStr.split(separator);
	var $endDateEles = endDateStr.split(separator);

	try {
	  startDate = new Date($startDateEles[0], ($startDateEles[1] - 1), $startDateEles[2]);
	  endDate = new Date($endDateEles[0], ($endDateEles[1] - 1), $endDateEles[2]);
	} catch (err) {
	  alert('日期格式转化错误');
	  return false;
	}

	if(startDate > endDate){
	  alert(msg);
	  return false
	}
	return true;
  },

  compareAmount : function (minAmount , maxAmount , msg) {
	if (!minAmount || !maxAmount) {
	  return true;
	}

	var $minAmount = 0;
	var $maxAmount = 0;
    try {
      $minAmount = parseInt(minAmount);
      $maxAmount = parseInt(maxAmount);
    } catch ( err ){
    	alert('数值转换错误');
    	return false;
    }

    if ($minAmount >= $maxAmount) {
      alert(msg);
      return false;
    }
    return true;
  },
  
  compareDays : function (minDays , maxDays , msg) {
		if (!minDays || !maxDays) {
		  return true;
		}

		var $minDays = 0;
		var $maxDays = 0;
	    try {
	    	$minDays = parseInt(minDays);
	    	$maxDays = parseInt(maxDays);
	    } catch ( err ){
	    	alert('数值转换错误');
	    	return false;
	    }

	    if ($minDays >= $maxDays) {
	      alert(msg);
	      return false;
	    }
	    return true;
  }

});
