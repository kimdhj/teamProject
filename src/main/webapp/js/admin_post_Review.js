$(function() {
	$(".week").click(function() {
		let st = new Date($("#start_date").val());
		st.setDate(st.getDate() - 7);
		$("#start_date").val(st);
		datePickerSet($("#start_date"), $("#end_date"), true);
	});
	$(".month").click(function() {
		let st = new Date($("#start_date").val());
		st.setMonth(st.getMonth() - 1);
		$("#start_date").val(st);
		datePickerSet($("#start_date"), $("#end_date"), true);
	});
	$(".threemonth").click(function() {
		let st = new Date($("#start_date").val());
		st.setMonth(st.getMonth() - 3);
		$("#start_date").val(st);
		datePickerSet($("#start_date"), $("#end_date"), true);
	});
	$(".sixmonth").click(function() {
		let st = new Date($("#start_date").val());
		st.setMonth(st.getMonth() - 6);
		$("#start_date").val(st);
		datePickerSet($("#start_date"), $("#end_date"), true);
	});
	$(".year").click(function() {
		let st = new Date($("#start_date").val());
		st.setFullYear(st.getFullYear() - 1);
		$("#start_date").val(st);
		datePickerSet($("#start_date"), $("#end_date"), true);
	});
});

// 날짜 더하기
$("#start_date").val(new Date());
let date = new Date();
date.setMonth(date.getMonth() + 1);

$("#end_date").val(date);
datePickerSet($("#start_date"), $("#end_date"), true); // 다중은 시작하는 달력 먼저, 끝달력
														// 2번째
// var date2 = $('#start_dat').datepicker('getDate', '+1d');
// date2.setDate(date2.getDate() + 1);
// $('.dropoffDate').datepicker('setDate', date2)

/*
 * 달력 생성기 @param sDate 파라미터만 넣으면 1개짜리 달력 생성 @example
 * datePickerSet($("#datepicker"));
 * 
 * 
 * @param sDate, @param eDate 2개 넣으면 연결달력 생성되어 서로의 날짜를 넘어가지 않음 @example
 * datePickerSet($("#datepicker1"), $("#datepicker2"));
 */
function datePickerSet(sDate, eDate, flag) {

	// 시작 ~ 종료 2개 짜리 달력 datepicker
	if (!isValidStr(sDate) && !isValidStr(eDate) && sDate.length > 0
			&& eDate.length > 0) {
		let sDay = sDate.val();
		let eDay = eDate.val();

		if (flag && !isValidStr(sDay) && !isValidStr(eDay)) { // 처음 입력 날짜 설정,
																// update...
			let sdp = sDate.datepicker().data("datepicker");
			console.log("flag");
			sdp.selectDate(new Date(sDay.replace(/-/g, "/"))); // 익스에서는 그냥 new
																// Date하면 -을
																// 인식못함
																// replace필요

			let edp = eDate.datepicker().data("datepicker");
			edp.selectDate(new Date(eDay.replace(/-/g, "/"))); // 익스에서는 그냥 new
																// Date하면 -을
																// 인식못함
																// replace필요
		}

		// 시작일자 세팅하기 날짜가 없는경우엔 제한을 걸지 않음
		if (!isValidStr(eDay)) {
			sDate.datepicker({
				maxDate : new Date(eDay.replace(/-/g, "/"))
			});

		}
		sDate.datepicker({
			language : 'ko',
			autoClose : true,
			onSelect : function() {
				console.log("select");
				datePickerSet(sDate, eDate);
			}
		});

		// 종료일자 세팅하기 날짜가 없는경우엔 제한을 걸지 않음
		if (!isValidStr(sDay)) {
			eDate.datepicker({
				minDate : new Date(sDay.replace(/-/g, "/"))
			});
		}
		eDate.datepicker({
			language : 'ko',
			autoClose : true,
			onSelect : function() {
				datePickerSet(sDate, eDate);
			}
		});

		// 한개짜리 달력 datepicker
	} else if (!isValidStr(sDate)) {
		let sDay = sDate.val();
		if (flag && !isValidStr(sDay)) { // 처음 입력 날짜 설정, update...
			let sdp = sDate.datepicker().data("datepicker");
			sdp.selectDate(new Date(sDay.replace(/-/g, "/"))); // 익스에서는 그냥 new
																// Date하면 -을
																// 인식못함
																// replace필요
		}

		sDate.datepicker({
			language : 'ko',
			autoClose : true
		});
	}

	function isValidStr(str) {
		if (str == null || str == undefined || str == "")
			return true;
		else
			return false;
	}
}

$(document).ready(function() {
	// 상단 탭 버튼
	$('#all').click(function() {

		$('#all').removeClass("unselect");
		$('#all').addClass("select");
		$('#category').removeClass("select");
		$('#category').addClass("unselect");

		$('#cate_box').hide();
		$('#all_box').show();
	});
	$('#category').click(function() {

		$('#category').removeClass("unselect");
		$('#category').addClass("select");
		$('#all').removeClass("select");
		$('#all').addClass("unselect");
		$('#all_box').hide();
		$('#cate_box').show();
	});
	// 상단 모든 카테고리 코드
	// 클릭해서 삭제
	$(".del").click(function(e) {

		$(this).parents('tr').remove();
	})
	// 선택 된 요소 삭제
	$(".seldel").click(function(e) {

		console.log($('.delche:checked'))
		$('.delche:checked').parents('tr').remove();
		$('.allche').removeAttr('checked');
	});
	// 해제시 전체 클릭 비활성화+모두 클릭되면 전체 클릭 활성화
	$('.delche:checked').click(function() {
		// 해제시 전체 클릭 비활성화
		$('.allche').prop("checked", false);
		//  모두 클릭되면 전체 클릭 활성화
		if ($('#all_box tbody>tr').length == $('.delche:checked').length) {
			$('.allche').prop("checked", true);
		}
	});
	//  전체 클릭 클릭시 전체온오프
	$('.allche').click(function() {
		if ($('.allche').is(':checked')) {
			$('.delche').prop("checked", true);
		} else {
			$('.delche').prop("checked", false);
		}
	})
	// checked 초기화
	$('.delche').prop("checked", false);
	$('.allche').prop("checked", false);
	// 하단에 있는 카테고리 홍보 코드
	// 리셋 버튼 코드 초기화
	$('.reset').click(function(e) {
		$(this).parents('tr').children('td:eq(3)').children().text('default');
		$(this).parents('tr').children('td:eq(3)').children().attr("data-default", "default");
	})
	// 코드 변화 감지에 따른 행동
	observer = new MutationObserver(function(mutations) {
		mutations.forEach(function(mutation) {
			console.log();
			$(mutation.target).parents('tr').children('td:eq(1)').children().text('default')
		});
	});
	const num = document.getElementsByClassName('num');
	for (let i = 0; i < num.length; i++) {
		observer.observe(document.getElementsByClassName('num')[i], { childList: true });
	}
})