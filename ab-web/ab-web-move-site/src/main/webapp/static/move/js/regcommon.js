var regUrl="http://${web_name}${web_domain}${project_name}/loadReg";
(function($) {      
	 $.fn.loadreg = function(options) {
		 //TODO 部署后需要修改下面的地址为正
		 $(this).load(regUrl,function(){
		 });
	 };
})(jQuery); 