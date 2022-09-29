
//작가 번호 검색 하기
 function checkAuthor(ca){
 	
 	
 	$.ajax({
			url: "/check_author.mdo",
			type: 'POST',
			contentType: "application/x-www-form-urlencoded; charset=UTF-8",
			data: {
				author_seq: $("#author_seq").val()
			},
			success: function(data) {
				console.log(data);
				$("#book_author").val(data);
				
			},
			error: function(jqXHR, textStatus, errorThrown) {
				console.log('error while post');
			}
		});
 	
 }


//책 사진 썸네일
function setThumbnail0(event) {
  var reader = new FileReader();

  reader.onload = function (event) {
    var img = document.createElement("img");
    img.setAttribute("src", event.target.result);
    img.width = 90;
    img.height = 100;
    removeAllchild(document.querySelector("td#book_thumbnail0"));
    document.querySelector("td#book_thumbnail0").appendChild(img);
  };
  function removeAllchild(td) {
    while (td.hasChildNodes()) {
      td.removeChild(td.firstChild);
    }
  }
  reader.readAsDataURL(event.target.files[0]);
}

//책 사진 썸네일
function setThumbnail1(event) {
  var reader = new FileReader();

  reader.onload = function (event) {
    var img = document.createElement("img");
    img.setAttribute("src", event.target.result);
    img.width = 90;
    img.height = 100;
    removeAllchild(document.querySelector("td#book_thumbnail1"));
    document.querySelector("td#book_thumbnail1").appendChild(img);
  };
  function removeAllchild(td) {
    while (td.hasChildNodes()) {
      td.removeChild(td.firstChild);
    }
  }
  reader.readAsDataURL(event.target.files[0]);
}


// 이벤트 유효성 체크
function event_writeCheck() {
	var book_price = document.getElementById("book_price");
	var category_num = document.getElementById("category_num");
	var book_title = document.getElementById("book_title");
	var book_points = document.getElementById("book_points");
	var book_publish = document.getElementById("book_publish");
	var author_seq = document.getElementById("author_seq");
	var book_author = document.getElementById("book_author");
	var book_isbn = document.getElementById("book_isbn");
	
	if(book_title.value == "") {
		Swal.fire({
			text: "제목을 입력하세요!",
			icon: "error"
		})	
		book_title.focus();
		return false;
	};
	if(book_isbn.value == "") {
		Swal.fire({
			text: "고유번호를 입력하세요!",
			icon: "error"
		})	
		book_isbn.focus();
		return false;
	};
	if(book_isbn.value < 0 || book_isbn.value > 999999999999999) {
		Swal.fire({
			text: "고유번호를 다시 확인 해주세요!",
			icon: "error"
		})	
		book_isbn.focus();
		return false;
	};
	if(book_price.value == "") {
		Swal.fire({
			text: "가격을 입력하세요!",
			icon: "error"
		})	
	book_price.focus();
	return false;
	};
	if(book_price.value < 0 || book_price.value > 999999999999) {
		Swal.fire({
			text: "가격을 다시 확인 해주세요!",
			icon: "error"
		})	
		book_price.focus();
		return false;
	};
	if(book_points.value == "") {
		Swal.fire({
			text: "포인트를 입력하세요!",
			icon: "error"
		})	
		book_points.focus();
		return false;
	};
	if(book_points.value < 0 || book_points.value > 999999999999) {
		Swal.fire({
			text: "포인트를 다시 확인 해주세요!",
			icon: "error"
		})	
		book_points.focus();
		return false;
	};
	if(author_seq.value == "") {
		Swal.fire({
			text: "작가번호를 입력하세요!",
			icon: "error"
		})	
		author_seq.focus();
		return false;
	};
	if(author_seq.value < 0 || author_seq.value > 999999999999) {
		Swal.fire({
			text: "작가번호를 다시 확인 해주세요!",
			icon: "error"
		})	
		author_seq.focus();
		return false;
	};
	if(book_author.value == "") {
		Swal.fire({
			text: "작가를 입력하세요!",
			icon: "error"
		})	
		book_author.focus();
		return false;
	};	
	if(book_remain.value < 0 || book_remain.value > 999999999999) {
		Swal.fire({
			text: "재고수를 다시 확인 해주세요!",
			icon: "error"
		})	
		book_remain.focus();
		return false;
	};
	if(book_publish.value == "") {
		Swal.fire({
			text: "출판사를 입력하세요!",
			icon: "error"
		})	
	book_publish.focus();
	return false;
	};
	if(category_num.value == "") {
		Swal.fire({
			text: "카테고리를 입력하세요!",
			icon: "error"
		})	
		category_num.focus();
		return false;
	};
	if(category_num.value < 0 || category_num.value > 999999999999) {
		Swal.fire({
			text: "카테고리를 다시 확인 해주세요!",
			icon: "error"
		})	
		category_num.focus();
		return false;
	};
	// isbn 체크해주기 시작
	
	console.log($("#book_isbn").val());
	$.ajax({
			url: "/check_isbn.mdo",
			type: 'POST',
			dataType: "JSON",
			data: {
				book_isbn: $("#book_isbn").val()
			},
			success: function(data) {
				console.log(data);
				if(data != 0){
					Swal.fire({
						text: "이미 존재하는 isbn 입니다! 다시 확인해주세요!",
						icon: "error"
					})
//					alert("이미 존재하는 isbn입니다! 다시 확인해주세요!");
				}else if(data == 0){
				
				//카테고리 체크해주기! 시작
					$.ajax({
						url: "/check_category.mdo",
						type: 'POST',
						dataType: "JSON",
						data: {
							category_num: Number($("#category_num").val())
						},
						success: function(data) {
							console.log(data);
							if(data == 0){
								Swal.fire({
									text: "존재하지 않는 카테고리입니다! 다시 확인해주세요!",
									icon: "error"
								})
//								alert("존재하지 않는 카테고리입니다! 다시 확인해주세요!");
							}else if(data != 0){
								console.log("왜??");
								document.upload.submit();
							}

						},
						error: function(jqXHR, textStatus, errorThrown) {
							console.log('error while post');
						}
					});
				//카테고리 체크해주기! 끝
				
				
				}
				
			},
			error: function(jqXHR, textStatus, errorThrown) {
				console.log('error while post');
			}
		});
		
	
};

// 날짜 더하기
$("#book_publish_date").val(new Date());
let date = new Date();
date.setMonth(date.getMonth() + 1);

$("#event_end_date").val(date);
datePickerSet($("#book_publish_date"), $("#event_end_date"), true); //다중은 시작하는 달력 먼저, 끝달력 2번째
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
    let st = new Date($("#book_publish_date").val());
    st.setDate(st.getDate() - 7);
    $("#book_publish_date").val(st);
    datePickerSet($("#book_publish_date"), $("#event_end_date"), true);
  });
  $(".month").click(function () {
    let st = new Date($("#book_publish_date").val());
    st.setMonth(st.getMonth() - 1);
    $("#book_publish_date").val(st);
    datePickerSet($("#book_publish_date"), $("#event_end_date"), true);
  });
  $(".threemonth").click(function () {
    let st = new Date($("#book_publish_date").val());
    st.setMonth(st.getMonth() - 3);
    $("#book_publish_date").val(st);
    datePickerSet($("#book_publish_date"), $("#event_end_date"), true);
  });
  $(".sixmonth").click(function () {
    let st = new Date($("#book_publish_date").val());
    st.setMonth(st.getMonth() - 6);
    $("#book_publish_date").val(st);
    datePickerSet($("#book_publish_date"), $("#event_end_date"), true);
  });
  $(".year").click(function () {
    let st = new Date($("#book_publish_date").val());
    st.setFullYear(st.getFullYear() - 1);
    $("#book_publish_date").val(st);
    datePickerSet($("#book_publish_date"), $("#event_end_date"), true);
  });
});
