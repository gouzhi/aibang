
function loadTypeAndSeats(autoType, autoStatus) {
  $.ajax({
    url: contextPath() + "/admin/autorental/auto/queryTypeAndSeats/"+ autoType,
    type: 'GET',
    dataType: 'JSON',
    error: function() { alert('Error loading data!'); },
    success: function(data) {

      $("#autoName" + autoStatus).empty();
      $("#seatsNums" + autoStatus).empty();

      var seatsNumbers = new Array();
      $.each(eval(data), function(i, item) {
        $("<option value='" + item.id + "'>" + item.name + "</option>").appendTo( $("#autoName" + autoStatus) );
        if(item.seatsNumber){
	    	var seatsNumberArray = item.seatsNumber.split(",");
	        for(var i =0;i< seatsNumberArray.length;i++){
	        	if(seatsNumberArray[i]!=""){
	       		seatsNumbers.push(seatsNumberArray[i]);	
	        	}
	        }
        }
      });
      for(var i=seatsNumbers.length-1;i>=1;i--){
          if(seatsNumbers[i-1] == seatsNumbers[i]){
        	  seatsNumbers.splice(i,1);
          }    
      }

      seatsNumbers.sort(function compare(a,b){return parseInt(a)-parseInt(b);})
      for(var i =0;i< seatsNumbers.length;i++){
    	  $("<option value='" + seatsNumbers[i] + "'>" + seatsNumbers[i] + "</option>").appendTo( $("#seatsNums" + autoStatus) );
      }
      
    }
  });
}

function loadAllNamesAndSeats(autoStatus){
	$.ajax({
	    url: contextPath() + "/admin/autorental/auto/queryAllSeats",
	    type: 'GET',
	    dataType: 'JSON',
	    error: function() { alert('Error loading data!'); },
	    success: function(data) {

            $("#autoName" + autoStatus).empty();
            $("#seatsNums" + autoStatus).empty();

		    var seatsNumbs = eval(data)['seatsNumbs' + autoStatus];
		    var names = eval(data)['autoDtos'];
			for(var i = 0;i<seatsNumbs.length;i++){
				$("<option value='" + seatsNumbs[i] + "'>" + seatsNumbs[i] + "</option>").appendTo($("#seatsNums" + autoStatus));
			}
			for(var i = 0;i<names.length;i++){
				$("<option value='" + names[i].id + "'>" + names[i].name + "</option>").appendTo($("#autoName" + autoStatus));
			}
	    }
	  });
}
