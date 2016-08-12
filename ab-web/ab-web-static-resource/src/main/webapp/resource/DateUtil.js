function DateUtil() {
		
}

DateUtil.prototype.parse = function(dateString) {
	var splitArray = dateString.split("-");
    return new Date(splitArray[0],splitArray[1] - 1, splitArray[2]);
}

DateUtil.prototype.compare = function (startDate , endDate) {
    if (startDate > endDate) {
        return 1;
    }
    
    if (startDate = endDate) {
        return 0;
    }
    return -1;
}