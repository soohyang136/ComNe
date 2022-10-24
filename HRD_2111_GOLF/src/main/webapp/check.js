function selectName(){
	var value_str = document.getElementById("cust_name");
	var value_input = document.getElementById("cust_no");
	value_input.value = value_str.options[value_str.selectedIndex].value;
}

function selectTeacher(){
	var value_str = document.getElementById("teacher");
	var value_price = document.getElementById("price");
	var value_no = document.getElementById("cust_no");
	if(Number(value_no.value) >= 20000){
		value_price.value = Number(value_str.options[value_str.selectedIndex].value) / 2;	
	}
	else value_price.value = Number(value_str.options[value_str.selectedIndex].value);
	
}

function check(){
	var value_str = document.getElementById("place");
	if(frm.date.value.length == 0) {
		alert("수강월이 입력되지 않았습니다.")
		frm.data.focus();
		return false;
	}
	if(frm.cust_no.value.length == 0) {
			frm.cust_name.focus();
		return false;
	}
	if(value_str.options[value_str.selectedIndex].value == 0) {
		alert("강의장소가 선택되지 않았습니다.")
		frm.place.focus();
		return false;
	}
	if(frm.price.value.length == 0) {
		alert("강의가 선택되지 않았습니다.")
		frm.teacher.focus();
		return false;
	}
	alert("등록이 완료되었습니다.");
	return true;
}