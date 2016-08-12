MapHelper = $.Class.create({
		obj:null,
		opts:null,
		initialize:function(opts){
			
			
			try{
				
				if(!opts){
					opts={};
				}
				this.opts=opts;
			    
				var mapOptions = new MMapOptions();
			    mapOptions.zoom = opts.zoom?opts.zoom:10;
			    mapOptions.toolbar = opts.toolbar?opts.toolbar:DEFAULT;
			    mapOptions.overviewMap = opts.overviewMap?opts.overviewMap:SHOW;
			    mapOptions.center = new MLngLat(opts.latitude?opts.latitude:"121.4139427",opts.longitude?this.opts.longitude:"31.18660055");
		    
			    this.obj= new MMap(opts.div?opts.div:"map",mapOptions);
			    if(opts.overlays
				    &&opts.overlays.length>0){
			    	this.addOverlay(opts.overlays,opts.fit);
					this.addEventListeners(opts.overlays);
			    }
		    }catch(ex){
		    	alert(ex);
		    }
	    
	},
	getDiv:function(){
		return this.opts.div;
	},
	destroy:function(){
		this.getOriginal().destroy();
	},
	clearMap:function(){
		this.getOriginal().clearMap();
	},
	getOriginal:function(){
		return this.obj;
	},
	removeAllOverlays:function(overlays,fit){
    	this.getOriginal().removeAllOverlays();
	},
	addOverlays:function(overlays,fit){
	    if(overlays
		    &&overlays.length>0){
		    	this.addOverlay(overlays,fit);
				this.addEventListeners(overlays);
		    }
	},
	addOverlay:function(lays,fit){
		var overlays=[];
		for(var i=0;i<lays.length;i++){
			var overlay=lays[i];
			if(!overlay){
				continue;
			}
			overlays.push(overlay.getOriginal());
		}
		this.getOriginal().addOverlays(overlays,!fit?fit:true);
	},
	addEventListeners:function(lays){
		
		try{
		 for(var i=0;i<lays.length;i++){
			var overlay=lays[i];
			if(!overlay){
				continue;
			}
			overlay.addEventListeners(this.getOriginal());
	    	for(var event in overlay.events){
	    		var eventHandler=overlay.events[event];
		    	this.getOriginal().addEventListener(overlay.getOriginal(),eventHandler.event,eventHandler.handler);
	    	}
		 }
		}catch(ex){
			alert(ex);
		}
	},
	clearTip:function(){
		this.obj.closeTip();
	}
});

MapLabel=$.Class.create({
		obj:null,
		opts:null,
		initialize:function(opts){
			if(!opts){
					opts={};
			}
			this.opts=opts;
			var label=new MLabelOptions();
		    label.content= opts.content;
		    label.hasBackground=true;
		    label.hasBorder =false;
		    label.backgroundColor=0xADFF2F; 
		    label.alpha =0.7; 
		    label.fontStyle.name="黑体"; 
		    label.fontStyle.size="12";
		    label.fontStyle.bold=true;
		    label.fontStyle.color=0x000d46; 
		    label.labelAlign=TOP_LEFT;
		    label.labelPosition=new MPoint(-20,5);
		    this.obj=label;
		    this.opts=opts;
		},
		getOriginal:function(){
			return this.obj;
		}
});

MapMarker=$.Class.create({
		obj:null,
		id:null,
		events:null,
		eventlist:null,
		opts:null,
		initialize:function(opts){
			
			try{
				if(!opts){
					opts={};
				}
				if(!opts.longitude
						||!opts.latitude){
					return null;
				}
				
				this.opts=opts;
				
				var mLL = new MLngLat(opts.longitude,opts.latitude);
				
			    var markerOption=new MMarkerOptions();
			    
			    if(opts.image){
					markerOption.imageUrl=opts.image;
					if(opts.imageSize){
			        	markerOption.imageSize=new MSize(opts.imageSize.width,opts.imageSize.height);
					}else{
			        	markerOption.imageSize=new MSize(36,36);
					}
					markerOption.picAgent=false;
			    }
				
			    if(opts.label){
				    markerOption.labelOption=opts.label.getOriginal();
			    }
				if(opts.tip){
					markerOption.tipOption=opts.tip.getOriginal();		
					markerOption.canShowTip= true;		
				}
		        
			    var marker = new MMarker(mLL,markerOption);
			    marker.id=opts.id;
			    this.id=marker.id;
			    this.obj=marker;
			    if(this.opts.events){
				    for(var i=0;i<this.opts.events.length;i++){
					    this.addEvent(this.opts.events[i].event,this.opts.events[i].handler,this.opts.events[i].needParent);
				    }
			    }
			    
			}catch(ex){
		    	alert(ex);
		    }
		},
		getId:function(){
			return this.id;
		},
		getOriginal:function(){
			return this.obj;
		},
		addEventListeners:function(parent){
		    if(this.opts.events){
		    	for(var i=0;i<this.eventlist.length;i++){
		    		this.addEventListener(this.eventlist[i],parent);
		    	}
		    }
		},
		addEventListener:function(event,parent){
			if(!this.events){
				this.events={};
			}
			this.events[event.event]={
				event:event.event,
				handler:event.handler
			};
    		if(event.needParent){
    			this.events[event.event].handler=this.events[event.event].handler.call(this,parent);
    		}
		},
		addEvent:function(event,handler,needParent){
			if(!this.eventlist){
				this.eventlist=[];
			}
			this.eventlist.push({
				 event:event,
				 handler:handler,
				 needParent:needParent?needParent:false
		    });
		}
});

MapSearch=$.Class.create({
	obj:null,
	opts:null,
	mlsp:null,
	initialize:function(opts){
		if(!opts){
			opts={};
		}
		this.opts=opts;
		var mls = new MPoiSearch(); 
		var mlsp = new MPoiSearchOptions();
		mlsp.eid=opts.eid?opts.eid:"62272";
		mlsp.range=opts.range?opts.range:3000;
		
		mlsp.recordsPerPage=opts.record?opts.record:8; 
		mlsp.pageNum=opts.pageNum?opts.pageNum:1;
		mlsp.returnType="JSON";
		
		if(opts.callback){
			mls.setCallbackFunction(opts.callback);
		}
		this.obj=mls;
		this.mlsp=mlsp;
	},
	searchByKeywords:function(){
		if(this.opts.keyword
			&&this.opts.citycode){
			this.getOriginal().poiSearchByKeywords(this.opts.keyword,this.opts.citycode,this.mlsp);
		}
	},
	typeAHead:function(){
		if(this.opts.keyword
			&&this.opts.citycode){
			this.getOriginal().typeAHead(this.opts.keyword,this.opts.citycode,this.mlsp);
		}
	},
	getOriginal:function(){
		return this.obj;
	}
});

MapTip=$.Class.create({
	obj:null,
	opts:null,
	initialize:function(opts){
	
		try{
			if(!opts){
				opts={};
			}
			this.opts=opts;
			
			if(HTML_CUSTOM_TIP==this.opts.tipType){
				this.createHTML_BUBBLE_TIP();
			}else{
				this.createIMG_BUBBLE_TIP();
			}

		}catch(ex){
			alert(ex);
		}
	},
	createHTML_BUBBLE_TIP:function(){
		
			var tipOption = new MTipOptions();
		    tipOption.tipType = HTML_CUSTOM_TIP; 
		    tipOption.content="<div style='width:200px;height:50px'>"+this.opts.content+"</div>";   
		    tipOption.tipAlign=BOTTOM_RIGHT; 
		    tipOption.tipPosition=new MPoint(this.opts.x,this.opts.y); 		
		
			this.obj=tipOption;
	
	},
	createIMG_BUBBLE_TIP:function(){
	
			var tipOption=new MTipOptions();
			
			var titleFontStyle=new MFontStyle();
	        titleFontStyle.size=14;
	        titleFontStyle.color=0xFFFFFF;
	        titleFontStyle.bold=false;
	
	      	var titleFillStyle=new MFillStyle();
	        titleFillStyle.color=0x145697;
	
	        var contentFontStyle=new MFontStyle();
	        contentFontStyle.size=12;
	        contentFontStyle.color=0xFF0066;
	        contentFontStyle.bold=false;
	
	        var contentFillStyle=new MFillStyle();
	        contentFillStyle.color=0xFFFFCC;
	
	        var linestyle=new MLineStyle();//创建线样式对象
	        linestyle.color=0x145697;//线的颜色，16进制整数，默认为0x005890（蓝色）
	
	        tipOption.title=this.opts.titleHtml;
	        tipOption.titleFontStyle=titleFontStyle;
	        tipOption.titleFillStyle=titleFillStyle;
	
	        tipOption.content=this.opts.content;
	        tipOption.contentFontStyle=contentFontStyle;
	        tipOption.fillStyle=contentFillStyle;
	
	        tipOption.borderStyle=linestyle;
	        tipOption.tipType=IMG_BUBBLE_TIP;
	        tipOption.tipHeight=130;
	        tipOption.tipWidth=200+this.opts.title.length*10;
	        tipOption.alpha=0.7;
		
	        this.obj=tipOption;
		
	},
	getOriginal:function(){
		return this.obj;
	}
});