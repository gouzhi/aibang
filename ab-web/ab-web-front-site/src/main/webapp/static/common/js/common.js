function jzts(){}

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
function validFun(obj,toFixedNum)
{  
	var re1 = new RegExp("^[\\+\\d]?\\d*?\\.?\\d{0,"+toFixedNum+"}?$");
	if(!obj.value.match(re1))
	    obj.value = obj.t_value;
	else 
	    obj.t_value=obj.value;
	if(obj.value.match(/^(?:[\+\d]?\d+(?:\.\d+)?)?$/))
	obj.o_value=obj.value; 
}
