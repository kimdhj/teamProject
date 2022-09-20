$(function() {
	// 오늘 날짜를 출력
	$("#today").text(new Date().toLocaleDateString());

	// datepicker 한국어로 사용하기 위한 언어설정
	$.datepicker.setDefaults($.datepicker.regional['ko']);

	// 시작일(fromDate)은 종료일(toDate) 이후 날짜 선택 불가
	// 종료일(toDate)은 시작일(fromDate) 이전 날짜 선택 불가

	// 시작일.
	$('#fromDate').datepicker({
		showOn : "both", // 달력을 표시할 타이밍 (both: focus or button)
		buttonImage : "/img/calendar.png", // 버튼 이미지
		buttonImageOnly : true, // 버튼 이미지만 표시할지 여부
		buttonText : "날짜선택", // 버튼의 대체 텍스트
		dateFormat : "yy-mm-dd", // 날짜의 형식
		changeMonth : true, // 월을 이동하기 위한 선택상자 표시여부
		// minDate: 0, // 선택할수있는 최소날짜, ( 0 : 오늘 이전 날짜 선택 불가)
		maxDate : 0,
		onClose : function(selectedDate) {
			// 시작일(fromDate) datepicker가 닫힐때
			// 종료일(toDate)의 선택할수있는 최소 날짜(minDate)를 선택한 시작일로 지정
			$("#toDate").datepicker("option", "minDate", selectedDate);
		}
	});

	// 종료일
	$('#toDate').datepicker({
		showOn : "both",
		buttonImage : "/img/calendar.png",
		buttonImageOnly : true,
		buttonText : "날짜선택",
		dateFormat : "yy-mm-dd",
		changeMonth : true,
		// minDate: 0, // 오늘 이전 날짜 선택 불가
		maxDate : 0,
		onClose : function(selectedDate) {
			// 종료일(toDate) datepicker가 닫힐때
			// 시작일(fromDate)의 선택할수있는 최대 날짜(maxDate)를 선택한 종료일로 지정
			$("#fromDate").datepicker("option", "maxDate", selectedDate);
		}
	});
});

// 기간조회
function searchDateOneWeek() {
	let d = new Date();
	const yearNow = d.getFullYear();
	const monthNow = ('0' + (d.getMonth() + 1)).slice(-2);
	const dayNow = ('0' + d.getDate()).slice(-2);
	const today = yearNow + "-" + monthNow + "-" + dayNow;
	let sel_day = -7; // 일주일전
	d.setDate(d.getDate() + sel_day);
	let year = d.getFullYear();
	let month = ('0' + (d.getMonth() + 1)).slice(-2);
	let day = ('0' + d.getDate()).slice(-2);
	dt = year + "-" + month + "-" + day;
	console.log(dt);
	document.getElementById("fromDate").value = dt;
	document.getElementById("toDate").value = today;
}
function searchDateOneMonth() {
	let d = new Date();
	const yearNow = d.getFullYear();
	const monthNow = ('0' + (d.getMonth() + 1)).slice(-2);
	const dayNow = ('0' + d.getDate()).slice(-2);
	const today = yearNow + "-" + monthNow + "-" + dayNow;
	let sel_month = -1;
	d.setMonth(d.getMonth() + sel_month);
	let year = d.getFullYear();
	let month = ('0' + (d.getMonth() + 1)).slice(-2);
	let day = ('0' + d.getDate()).slice(-2);
	dt = year + "-" + month + "-" + day;
	console.log(dt);
	document.getElementById("fromDate").value = dt;
	document.getElementById("toDate").value = today;
}
function searchDateThreeMonth() {
	let d = new Date();
	const yearNow = d.getFullYear();
	const monthNow = ('0' + (d.getMonth() + 1)).slice(-2);
	const dayNow = ('0' + d.getDate()).slice(-2);
	const today = yearNow + "-" + monthNow + "-" + dayNow;
	let sel_month = -3;
	d.setMonth(d.getMonth() + sel_month);
	let year = d.getFullYear();
	let month = ('0' + (d.getMonth() + 1)).slice(-2);
	let day = ('0' + d.getDate()).slice(-2);
	dt = year + "-" + month + "-" + day;
	console.log(dt);
	document.getElementById("fromDate").value = dt;
	document.getElementById("toDate").value = today;
}
function searchDateSixMonth() {
	let d = new Date();
	const yearNow = d.getFullYear();
	const monthNow = ('0' + (d.getMonth() + 1)).slice(-2);
	const dayNow = ('0' + d.getDate()).slice(-2);
	const today = yearNow + "-" + monthNow + "-" + dayNow;
	let sel_month = -6;
	d.setMonth(d.getMonth() + sel_month);
	let year = d.getFullYear();
	let month = ('0' + (d.getMonth() + 1)).slice(-2);
	let day = ('0' + d.getDate()).slice(-2);
	dt = year + "-" + month + "-" + day;
	console.log(dt);
	document.getElementById("fromDate").value = dt;
	document.getElementById("toDate").value = today;
}



