function valueToText(str, value) {
	//alert(str);
	str = str.substring(1, str.length - 1);
	//alert(str);
	var array = str.split(",");
	for ( var i = 0; i < array.length; i++) {
		//alert(array[i]);
		var array2 = array[i].split("=");
		//alert("array2[0]" + array2[0]);
		//alert("value" + value);
		if ($.trim(array2[0]) == $.trim(value)) {
			return array2[1];
		}
	}
	
	return "类型没有定义";
}