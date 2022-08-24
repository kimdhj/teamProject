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
    if (!isValidStr(sDate) && !isValidStr(eDate) && sDate.length > 0 && eDate.length > 0) {
        let sDay = sDate.val();
        let eDay = eDate.val();

        if (flag && !isValidStr(sDay) && !isValidStr(eDay)) { // 처음 입력 날짜 설정,
																// update...
            let sdp = sDate.datepicker().data("datepicker");
            console.log("flag");
            sdp.selectDate(new Date(sDay.replace(/-/g, "/")));  // 익스에서는 그냥 new
																// Date하면 -을
																// 인식못함
																// replace필요

            let edp = eDate.datepicker().data("datepicker");
            edp.selectDate(new Date(eDay.replace(/-/g, "/")));  // 익스에서는 그냥 new
																// Date하면 -을
																// 인식못함
																// replace필요
        }

        // 시작일자 세팅하기 날짜가 없는경우엔 제한을 걸지 않음
        if (!isValidStr(eDay)) {
            sDate.datepicker({
                maxDate: new Date(eDay.replace(/-/g, "/"))
            });

        }
        sDate.datepicker({
            language: 'ko',
            autoClose: true,
            onSelect: function () {
                console.log("select");
                datePickerSet(sDate, eDate);
            }
        });

        // 종료일자 세팅하기 날짜가 없는경우엔 제한을 걸지 않음
        if (!isValidStr(sDay)) {
            eDate.datepicker({
                minDate: new Date(sDay.replace(/-/g, "/"))
            });
        }
        eDate.datepicker({
            language: 'ko',
            autoClose: true,
            onSelect: function () {
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
            language: 'ko',
            autoClose: true
        });
    }

    function isValidStr(str) {
        if (str == null || str == undefined || str == "")
            return true;
        else
            return false;
    }

}

$().ready(function () {
    $(".purchaseCancel").click(function () {
        Swal.fire({
            title: '구매를 취소하시겠습니까?',
            text: "취소하시면 상품을 받아볼 수 없습니다. 🥺",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: '예',
            cancelButtonText: '아니오'
        }).then((result) => {
            if (result.isConfirmed) {
                Swal.fire(
                    '구매가 취소되었습니다.',
                    '즐거운 쇼핑되세요 😊'
                )
            }
        })
    });
});