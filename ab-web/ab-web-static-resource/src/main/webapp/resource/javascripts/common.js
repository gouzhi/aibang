function trim() {
  $(":text").each(function() {
    $(this).val($.trim($(this).val()));
  });
}

function compareDate(date1 , date2) {
	if(date1.getTime() > date2.getTime()){
		return 1;
	}
	
	if(date1.getTime() == date2.getTime()) {
		return 0;
	}
	
	return -1;
}

function pasertDate(dateString) {
	return new Date(Date.parse(dateString.replace(/-/g, "/"))); 
}

function formatDate(date) {
		var year=date.getFullYear();
		var month=date.getMonth()+1;
		var day=date.getDate();
		return year+"-"+(month<10?("0"+month):month)+"-"+(day<10?("0"+day):day); 
}