MemberHelper = $.Class.create({
  containerId : '',

  initialize : function () {
  },

  initialize : function (_containerId) {
    containerId = _containerId;
  },

  get : function() {
    $.ajax({
      url: "/admin/member/get",
      type: "POST",
      error: function() { alert('Error loading data!'); },
      success: function(data) {
        $( '#' + containerId ).append(data);
      }
    });
  },

//  set : function(mapping) {
//	  $.ajax({
//	      url: "/admin/member/getJson",
//	      type: "GET",
//	      dataType: "JSON",
//	      async:false,  
//	      error: function() { alert('Error loading data!'); },
//	      success: function(data) {
//	    	  for (var key in mapping) {
//	    	        $('#' + mapping[key]).val(data[key]);
//	    	  };
//	      }
//	    });	  
//  }
//  
  
  set : function(mapping) {
    $.getJSON("/admin/member/getJson",
      function(memberJson) {
      for (var key in mapping) {
        $('#' + mapping[key]).val(memberJson[key]);
      }
    });
  }
  
  
  
});

