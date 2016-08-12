// JavaScript Document


$(function(){
   //已选择中的叉的点击事件；
	$('.yixuan .cancel').click(function(){
       var str=$(this).prev().text();
        if(str.indexOf("%")>0){
			$("input[name='borrowAprContext']").val("");
			$("input[name='borrowAprMin']").val("");
	        $("input[name='borrowAprMax']").val("");
        }else if(str.indexOf("万")>0){
        	$("input[name='tenderAccountContext']").val("");
			$("input[name='tenderAccountMinMin']").val("");
	        $("input[name='tenderAccountMinMax']").val("");
        }else if(str.indexOf("个")>0){
            $("input[name='borrowPeriodContext']").val("");
			$("input[name='borrowPeriodMin']").val("");
	        $("input[name='borrowPeriodMax']").val("");
        }else{
        	$("input[name='verifyStatusContext']").val("");
        	$("input[name='investTag']").val("");
        }
            submitForm();
	});	

	//年化收益率
	$("#borrowApr span").click(function(){
		var str=$(this).text();
       if(str.indexOf("-")>0){//包含“-”
 		  $("input[name='borrowAprContext']").val(str);
          $("input[name='borrowAprMin']").val(str.substring(0,str.indexOf("-")-1));
          $("input[name='borrowAprMax']").val(str.substring(str.indexOf("-")+1,str.lastIndexOf("%")));
		}else if((str.indexOf("-")==-1)&&(str.indexOf("上")>0)){//不包含“-”
			$("input[name='borrowAprContext']").val(str);
			$("input[name='borrowAprMin']").val("");
	        $("input[name='borrowAprMax']").val(str.substring(0,str.indexOf("%")));
        }else if((str.indexOf("-")==-1)&&(str.indexOf("下")>0)){
        	$("input[name='borrowAprContext']").val(str);
        	$("input[name='borrowAprMin']").val(str.substring(0,str.indexOf("%")));
	        $("input[name='borrowAprMax']").val("");
        }else{
        	$("input[name='borrowAprContext']").val("");
			$("input[name='borrowAprMin']").val("");
	        $("input[name='borrowAprMax']").val("");
		}
           submitForm();
    });
	//投资金额
	$("#tenderAccount span").click(function(){
		var str=$(this).text();
       if(str.indexOf("-")>0){//包含“-”
    	  $("input[name='tenderAccountContext']").val(str);
          $("input[name='tenderAccountMinMin']").val(str.substring(0,str.indexOf("万")));
          $("input[name='tenderAccountMinMax']").val(str.substring(str.indexOf("-")+1,str.lastIndexOf("万")));
		}else if((str.indexOf("-")==-1)&&(str.indexOf("上")>0)){//不包含“-”
			$("input[name='tenderAccountContext']").val(str);
			$("input[name='tenderAccountMinMin']").val("");
	        $("input[name='tenderAccountMinMax']").val(str.substring(0,str.indexOf("万")));
        }else if((str.indexOf("-")==-1)&&(str.indexOf("下")>0)){
        	$("input[name='tenderAccountContext']").val(str);
        	$("input[name='tenderAccountMinMin']").val(str.substring(0,str.indexOf("万")));
	        $("input[name='tenderAccountMinMax']").val("");
        }else{

        	$("input[name='tenderAccountContext']").val("");
			$("input[name='tenderAccountMinMin']").val("");
	        $("input[name='tenderAccountMinMax']").val("");
		}
            submitForm();
    });
	//投资期限
	$("#borrowPeriod span").click(function(){
		var str=$(this).text();
       if(str.indexOf("-")>0){//包含“-”
 		  $("input[name='borrowPeriodContext']").val(str);
          $("input[name='borrowPeriodMin']").val(str.substring(0,str.indexOf("-")));
          $("input[name='borrowPeriodMax']").val(str.substring(str.indexOf("-")+1,str.lastIndexOf("个")));
		}else if((str.indexOf("-")==-1)&&(str.indexOf("上")>0)){//不包含“-”
			$("input[name='borrowPeriodContext']").val(str);
			$("input[name='borrowPeriodMin']").val("");
	        $("input[name='borrowPeriodMax']").val(str.substring(0,str.indexOf("个")));
        }else if((str.indexOf("-")==-1)&&(str.indexOf("下")>0)){
        	$("input[name='borrowPeriodContext']").val(str);
        	$("input[name='borrowPeriodMin']").val(str.substring(0,str.indexOf("个")));
	        $("input[name='borrowPeriodMax']").val("");
        }else{
        	$("input[name='borrowPeriodContext']").val("");
			$("input[name='borrowPeriodMin']").val("");
	        $("input[name='borrowPeriodMax']").val("");
		}
          submitForm();
    });
	//投资状态
	$("#vs span").click(function(){
		if($(this).attr("class")=="searchSp1"){
			$("input[name='verifyStatusContext']").val("");
		}else{
			$("input[name='verifyStatusContext']").val($(this).text());
		}
        $("input[name='investTag']").val($(this).attr("id"));
           submitForm();
    });
  
       
        
       
    });

 
//提交表单
function submitForm(){
	$("#form").submit();
}
//全部清除已选择的状态
function cancelAll(){ 
	 $("form input").removeAttr("name");
	 submitForm();
}
//确定按钮触发的方法
function confirm(){
    var min=parseInt($("#min").val());
	var max=parseInt($("#max").val());
   if(min>=0&&max>=0){
	   if(min<max){
        $("input[name='tenderAccountMinMin']").val(min);
		$("input[name='tenderAccountMinMax']").val(max);
	   }else{
		$("input[name='tenderAccountMinMin']").val(max);
		$("input[name='tenderAccountMinMax']").val(min);  
	   }
		$("input[name='tenderAccountContext']").val(min+"万元-"+max+"万元");
		submitForm();
   }else if(min>=0){
       $("input[name='tenderAccountMinMin']").val("");
       $("input[name='tenderAccountMinMax']").val(min);
       $("input[name='tenderAccountContext']").val(min+"万元以上");
       submitForm();
	}else if(max>=0){
       $("input[name='tenderAccountMinMin']").val(max);
       $("input[name='tenderAccountMinMax']").val("");
       $("input[name='tenderAccountContext']").val(max+"万元以下");
       submitForm();
    } 
   
}

//排序
function defaultClick(){
        $("input[name='sortTag']").val($(this).attr("id"));
        submitForm();
}
function sortAccountClick(){
	 var val=$("input[name='sortTag']").val();
     if(val==2){
    	  $("input[name='sortTag']").val(-2);
		  }else{
			  $("input[name='sortTag']").val(2);
		  }	
      submitForm();
	
}
function sortPeriodClick(){
	var val=$("input[name='sortTag']").val();
    if(val==3){
   	  $("input[name='sortTag']").val(-3);
		  }else{
		  $("input[name='sortTag']").val(3);
		  }	
          submitForm();
	
}