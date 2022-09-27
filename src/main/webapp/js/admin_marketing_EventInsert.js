//파일 삭제 버튼
$("#delFile1").on("click", function () {
	var uFile = $("#uploadFile1").val("");
});
$("#delFile2").on("click", function () {
	var uFile = $("#uploadFile2").val("");
});
$("#delFile3").on("click", function () {
	var uFile = $("#uploadFile3").val("");
});
$("#delFile4").on("click", function () {
	var uFile = $("#uploadFile4").val("");
});
$("#delFile5").on("click", function () {
	var uFile = $("#uploadThumbnail").val("");
});


// 이벤트 유효성 체크
function event_writeCheck() {
	var event_title = document.getElementById("event_title");
	var event_target = document.getElementById("event_target");
	var event_start_date = document.getElementById("event_start_date");
	var event_content = document.getElementById("event_content");
	var uploadThumbnail = document.getElementById("uploadThumbnail");
	
	if(event_title.value == "") {
	alert("제목을 입력하세요!");
	event_title.focus();
	return false;
	};
	if(event_target.value == "") {
	alert("대상을 입력하세요!");
	event_target.focus();
	return false;
	};
	if(event_start_date.value == "") {
	alert("시작날짜를 입력하세요!");
	event_start_date.focus();
	return false;
	};
	if(event_content.value == "") {
	alert("내용을 입력하세요!");
	event_content.focus();
	return false;
	};
	if(uploadThumbnail.value == "") {
	alert("썸네일을 추가하세요!");
	uploadThumbnail.focus();
	return false;
	};
	document.upload.submit();
};

// 날짜 더하기
$("#event_start_date").val(new Date());
let date = new Date();
date.setMonth(date.getMonth() + 1);

$("#event_end_date").val(date);
datePickerSet($("#event_start_date"), $("#event_end_date"), true); //다중은 시작하는 달력 먼저, 끝달력 2번째
// var date2 = $('#start_dat').datepicker('getDate', '+1d');
//     date2.setDate(date2.getDate() + 1);
//     $('.dropoffDate').datepicker('setDate', date2)

/*
 * 달력 생성기
 * @param sDate 파라미터만 넣으면 1개짜리 달력 생성
 * @example   datePickerSet($("#datepicker"));
 *
 *
 * @param sDate,
 * @param eDate 2개 넣으면 연결달력 생성되어 서로의 날짜를 넘어가지 않음
 * @example   datePickerSet($("#datepicker1"), $("#datepicker2"));
 */
function datePickerSet(sDate, eDate, flag) {
  //시작 ~ 종료 2개 짜리 달력 datepicker
  if (
    !isValidStr(sDate) &&
    !isValidStr(eDate) &&
    sDate.length > 0 &&
    eDate.length > 0
  ) {
    let sDay = sDate.val();
    let eDay = eDate.val();

    if (flag && !isValidStr(sDay) && !isValidStr(eDay)) {
      //처음 입력 날짜 설정, update...
      let sdp = sDate.datepicker().data("datepicker");
      console.log("flag");
      sdp.selectDate(new Date(sDay.replace(/-/g, "/"))); //익스에서는 그냥 new Date하면 -을 인식못함 replace필요

      let edp = eDate.datepicker().data("datepicker");
      edp.selectDate(new Date(eDay.replace(/-/g, "/"))); //익스에서는 그냥 new Date하면 -을 인식못함 replace필요
    }

    //시작일자 세팅하기 날짜가 없는경우엔 제한을 걸지 않음
    if (!isValidStr(eDay)) {
      sDate.datepicker({
        maxDate: new Date(eDay.replace(/-/g, "/")),
      });
    }
    sDate.datepicker({
      language: "ko",
      autoClose: true,
      onSelect: function () {
        console.log("select");
        datePickerSet(sDate, eDate);
      },
    });

    //종료일자 세팅하기 날짜가 없는경우엔 제한을 걸지 않음
    if (!isValidStr(sDay)) {
      eDate.datepicker({
        minDate: new Date(sDay.replace(/-/g, "/")),
      });
    }
    eDate.datepicker({
      language: "ko",
      autoClose: true,
      onSelect: function () {
        datePickerSet(sDate, eDate);
      },
    });

    //한개짜리 달력 datepicker
  } else if (!isValidStr(sDate)) {
    let sDay = sDate.val();
    if (flag && !isValidStr(sDay)) {
      //처음 입력 날짜 설정, update...
      let sdp = sDate.datepicker().data("datepicker");
      sdp.selectDate(new Date(sDay.replace(/-/g, "/"))); //익스에서는 그냥 new Date하면 -을 인식못함 replace필요
    }

    sDate.datepicker({
      language: "ko",
      autoClose: true,
    });
  }

  function isValidStr(str) {
    if (str == null || str == undefined || str == "") return true;
    else return false;
  }
}
$(function () {
  $(".week").click(function () {
    let st = new Date($("#event_start_date").val());
    st.setDate(st.getDate() - 7);
    $("#event_start_date").val(st);
    datePickerSet($("#event_start_date"), $("#event_end_date"), true);
  });
  $(".month").click(function () {
    let st = new Date($("#event_start_date").val());
    st.setMonth(st.getMonth() - 1);
    $("#event_start_date").val(st);
    datePickerSet($("#event_start_date"), $("#event_end_date"), true);
  });
  $(".threemonth").click(function () {
    let st = new Date($("#event_start_date").val());
    st.setMonth(st.getMonth() - 3);
    $("#event_start_date").val(st);
    datePickerSet($("#event_start_date"), $("#event_end_date"), true);
  });
  $(".sixmonth").click(function () {
    let st = new Date($("#event_start_date").val());
    st.setMonth(st.getMonth() - 6);
    $("#event_start_date").val(st);
    datePickerSet($("#event_start_date"), $("#event_end_date"), true);
  });
  $(".year").click(function () {
    let st = new Date($("#event_start_date").val());
    st.setFullYear(st.getFullYear() - 1);
    $("#event_start_date").val(st);
    datePickerSet($("#event_start_date"), $("#event_end_date"), true);
  });
});
