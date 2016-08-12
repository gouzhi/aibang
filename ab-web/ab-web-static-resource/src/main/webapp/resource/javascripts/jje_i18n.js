$(document).ready(function() {
    loadBundles("zh_CN");
});

function loadBundles(lang) {
    jQuery.i18n.properties({
                name:'Messages',
                path:'/admin/resources/bundle/',
                mode:'both',
                language:lang,
        	    callback: function() {
        	        if(typeof i18nCallback == "function")
                        i18nCallback();
        	    }
            });
}

function i18n(key) {
    return jQuery.i18n.prop(key);
}
