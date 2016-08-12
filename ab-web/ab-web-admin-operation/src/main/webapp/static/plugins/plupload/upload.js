(function($){
	$.fn.uploadFile=function(options){
		options.currObj=$(this);		
		 //实例化一个plupload上传对象			
		var uploadoptions={ 
				runtimes : 'html5,flash,silverlight,html4',
				browse_button : $(this).attr("id"), 
				//container: $(this).parent()[0], // ... or DOM Element itself
				url : options.url,
				flash_swf_url : '../js/Moxie.swf',
				silverlight_xap_url : '../js/Moxie.xap',
				multi_selection: false,
				filters : {
					max_file_size : '10mb',
					mime_types: [
						{title : "Image files", extensions : "jpg,gif,png"},
						{title : "Zip files", extensions : "zip,rar"},
						{title : "Word files", extensions : "doc,docx"}
					]
				},
				init:{
					FilesAdded:function(uploader,files){
						/*plupload.each(files, function(file) {
						options.currObj.parent().append('<div id="' + file.id + '">' + file.name + ' (' + plupload.formatSize(file.size) + ') <b></b></div>');
					});*/
					uploader.start();
					},
					FileUploaded:function(uploader,file,res){
//						var info=eval("json="+res.response);
						options.callback(res.response);
						
						/*if(options.callback!=null)
						{
							options.callback(info.path);
						}*/
					},
					Error:function(uploader,err){
						if(err.code ==-601){
							alert("该类型文件不能上传！");
						}
					}				
				}
				
			};
		
		$.extend(uploadoptions,options);		
		var uploader = new plupload.Uploader(uploadoptions);		
		uploader.init();		 	
	}
})(jQuery);

