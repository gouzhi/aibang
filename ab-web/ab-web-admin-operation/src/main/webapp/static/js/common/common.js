/**
 * 获取图片上传的完整路径
 * @param path 上传的servlet
 * @param type 上传的类型（image,file,excel,word）
 * @returns {String}
 */
function getUploadFullUrl(path,type)
{
	return path+"?command=FILEUPLOAD&type="+type;
}
 
	
//校验整数
//例如  onkeypress="validFun(this)" onkeyup="validFun(this)
function checkNumFun(obj) {
    var Reg = /^[0-9]*[1-9][0-9]*$/;
    var varNum = obj.value;
    if (Reg.test(varNum) == false) {
        if (varNum != '')
            obj.value = 0;
    }
}
//校验数字或小数
//例如  onkeypress="validFun(this)" onkeyup="validFun(this)
//toFixedNum 小数位数
function validFun(obj){  
	/*var re1 = new RegExp("^[\\+\\d]?\\d*?\\.?\\d{0,"+toFixedNum+"}?$");
	if(!obj.value.match(re1))
	    obj.value = obj.t_value;
	else 
	    obj.t_value=obj.value;
	if(obj.value.match(/^(?:[\+\d]?\d+(?:\.\d+)?)?$/))
	obj.o_value=obj.value; */
	obj.value = obj.value.replace(/[^\d.]/g,"");  //清除“数字”和“.”以外的字符  
	obj.value = obj.value.replace(/^\./g,"");  //验证第一个字符是数字而不是.  
	obj.value = obj.value.replace(/\.{2,}/g,"."); //只保留第一个. 清除多余的  
	obj.value = obj.value.replace(".","$#$").replace(/\./g,"").replace("$#$",".");  
	obj.value=obj.value.replace(/^(\-)*(\d+)\.(\d\d).*$/,'$1$2.$3');//只能输入两个小数  
}
