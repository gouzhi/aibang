AutoImageHelper = $.Class.create({
	root : "",
	autoCode : "",
	
	 initialize : function (_autoCode) {
		autoCode = _autoCode;
		root = "http://192.168.1.247:8001";
	  },
	
	getAutoImagesPath : function(){
		  return root +'/'+ autoCode;
	 },
	  
	getNoImagePath : function (){
		return root + "noImage.jpg";
	},
	
	getIndexFileContent : function(){
		var result;
		var helper = this;
		$.ajax({
				url: helper.getAutoImagesPath() + "/index.html",
				type:'get',
				async:false,
				success: function(data) {
					result = data;
	        	},
				error: function(){result = '';}
			});
		return result;
	},
	
	getAutoDefaultImage : function(){
		var defaultImagePath = '';
		var parentPath = this.getAutoImagesPath();
		var content = this.getIndexFileContent();
		if(content == ''){
			defaultImagePath = this.getNoImagePath();
			return defaultImagePath;
		}
		
		var temp = '';
		var pathArray = content.split("\n");
		$.each(pathArray, function(i,item){
			//if("default_" == item.substring(0,item.lastIndexOf("."))){
			if(item.indexOf("default_") != -1){
				temp = item;
			}
		});
		
		if(temp == ''){
			defaultImagePath = this.getNoImagePath();
		}else{
			defaultImagePath = parentPath + "/" + temp;
		}
		return defaultImagePath;
	}
});