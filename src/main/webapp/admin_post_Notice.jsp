<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="/admin_commonjsp/admin_common_head.jsp"></jsp:include>
<link href="/css/admin_post_Notice.css" rel="stylesheet" />
<link href="/datepicker/css/datepicker.min.css" rel="stylesheet"
	type="text/css" media="all">
</head>
<body>
	<jsp:include page="/admin_commonjsp/admin_common_header.jsp"></jsp:include>
	<!-- 여기서부터 화면 작성 시작 -->
	<div id="main_wrapper" class="m-2  w-100 row">
		<div class="mb-0 p-0">
			<button id="all" class="select p-2">전체 공지사항</button>
		</div>

		<div id="all_box" class="bg-white w-100">
			<div class="row d-flex align-items-center" id="input_line_top">
				<!-- 기간 조회 -->
				<div class="col-2"></div>
				<div class="col-10" id="day_select">
					<div id="day_calendar" class="col-5" style="margin-top: 1%;">
						<input class="col-4" placeholder="시작날짜" type="text"
							id="start_date" style="height: 50px; margin-top: 2%; text-align:center;" />
						<div class="notice_font">~</div>
						<input class="col-4" placeholder="마지막 날짜" type="text"
							id="end_date" style="height: 50px; margin-top: 2%; text-align:center;" />
						<div id="day_btn" class="col-7">
							<div id="dayAdd" class="btn-group me-2" role="group"
								aria-label="Second group">
								<button type="button" class="btn btn-secondary week">1주일</button>
								<button type="button" class="btn btn-secondary month">1개월</button>
								<button type="button" class="btn btn-secondary threemonth">3개월</button>
								<button type="button" class="btn btn-secondary sixmonth">6개월</button>
								<button type="button" class="btn btn-secondary year">1년</button>
							</div>
						</div>
					</div>
				</div>
				<div class="col-2"></div>
				<div class="col-1 me-2 mt-3" style="padding-left: 0px;">
					<div class="input-group mb-3 d-flex">
						<select class="row form-select w-100 fs-5" id="level" name="level"
							id="level" aria-label="Default select example"
							style="margin-left: 3%;">
							<option class="fs-5" value="1">번호</option>
							<option class="fs-5" value="2">제목</option>
							<option class="fs-5" value="3">내용</option>
						</select>
					</div>
				</div>
				<div class="col-3  me-2 mt-3">
					<div class="input-group mb-3 ">
						<input class="fs-5 w-100" type="text" placeholder="검색할 내용 입력">
					</div>
				</div>
				<div class="col-auto ">
					<div class="input-group p-0 mt-2  col">
						<button id="add_btn"
							class="btn bg-blue text-white rounded-pill col">검색</button>
						&nbsp;&nbsp;
						<button id="add_btn"
							class="btn bg-blue text-white rounded-pill col">추가</button>
					</div>

				</div>
				<div class="row d-flex m-1" id="table_box">
					<table class="table " id="table">
						<thead>
							<tr>
								<th><input
									class="form-check-input border-1 border-dark allche"
									type="checkbox" value="" id="flexCheckChecked" checked></th>
								<th>번호</th>
								<th>제목</th>
								<th>작성자</th>
								<th>등록일자</th>
								<th><button class="btn btn-warning rounded-pill seldel">선택
										삭제</button></th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td><input
									class="form-check-input border-1 border-dark delche"
									type="checkbox" value="" id="flexCheckChecked" checked>
								</td>
								<td>
									<p contenteditable="false" data-default="1">1</p>
								</td>
								<td>
									<p class="rowColumn" contenteditable="true"
										data-default="로그인 로딩 지연 안내">로그인 로딩 지연 안내</p>
								</td>
								<td>
									<p class="selectColumn" contenteditable="false"
										data-default="admin">admin</p>
								</td>
								<td>
									<p class="rowColumn" contenteditable="false"
										data-default="2022-11-15 11:15">2022-11-15 11:15</p>
								</td>
								<td>
									<button class="btn btn-danger rounded-pill del">삭제</button>
								</td>
							</tr>

							<tr>
								<td><input
									class="form-check-input border-1 border-dark delche"
									type="checkbox" value="" id="flexCheckChecked" checked>
								</td>
								<td>
									<p contenteditable="false" data-default="1">1</p>
								</td>
								<td>
									<p class="rowColumn" contenteditable="true"
										data-default="로그인 로딩 지연 안내">로그인 로딩 지연 안내</p>
								</td>
								<td>
									<p class="selectColumn" contenteditable="false"
										data-default="admin">admin</p>
								</td>
								<td>
									<p class="rowColumn" contenteditable="false"
										data-default="2022-11-15 11:15">2022-11-15 11:15</p>
								</td>
								<td>
									<button class="btn btn-danger rounded-pill del">삭제</button>
								</td>
							</tr>

							<tr>
								<td><input
									class="form-check-input border-1 border-dark delche"
									type="checkbox" value="" id="flexCheckChecked" checked>
								</td>
								<td>
									<p contenteditable="false" data-default="1">1</p>
								</td>
								<td>
									<p class="rowColumn" contenteditable="true"
										data-default="로그인 로딩 지연 안내">로그인 로딩 지연 안내</p>
								</td>
								<td>
									<p class="selectColumn" contenteditable="false"
										data-default="admin">admin</p>
								</td>
								<td>
									<p class="rowColumn" contenteditable="false"
										data-default="2022-11-15 11:15">2022-11-15 11:15</p>
								</td>
								<td>
									<button class="btn btn-danger rounded-pill del">삭제</button>
								</td>
							</tr>

							<tr>
								<td><input
									class="form-check-input border-1 border-dark delche"
									type="checkbox" value="" id="flexCheckChecked" checked>
								</td>
								<td>
									<p contenteditable="false" data-default="1">1</p>
								</td>
								<td>
									<p class="rowColumn" contenteditable="true"
										data-default="로그인 로딩 지연 안내">로그인 로딩 지연 안내</p>
								</td>
								<td>
									<p class="selectColumn" contenteditable="false"
										data-default="admin">admin</p>
								</td>
								<td>
									<p class="rowColumn" contenteditable="false"
										data-default="2022-11-15 11:15">2022-11-15 11:15</p>
								</td>
								<td>
									<button class="btn btn-danger rounded-pill del">삭제</button>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>

<jsp:include page="/admin_commonjsp/admin_common_footer.jsp"></jsp:include>
<!-- 여기서부터 JS 추가 -->
<script src="./datepicker/js/datepicker.js"></script>
<script src="./datepicker/js/datepicker.ko.js"></script>
<script>
        // 날짜 더하기
        $("#start_date").val(new Date());
        let date = new Date();
        date.setMonth(date.getMonth() + 1);

        $("#end_date").val(date);
        datePickerSet($("#start_date"), $("#end_date"), true); //다중은 시작하는 달력 먼저, 끝달력 2번째
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
            if (!isValidStr(sDate) && !isValidStr(eDate) && sDate.length > 0 && eDate.length > 0) {
                let sDay = sDate.val();
                let eDay = eDate.val();

                if (flag && !isValidStr(sDay) && !isValidStr(eDay)) { //처음 입력 날짜 설정, update...			
                    let sdp = sDate.datepicker().data("datepicker");
                    console.log("flag");
                    sdp.selectDate(new Date(sDay.replace(/-/g, "/")));  //익스에서는 그냥 new Date하면 -을 인식못함 replace필요

                    let edp = eDate.datepicker().data("datepicker");
                    edp.selectDate(new Date(eDay.replace(/-/g, "/")));  //익스에서는 그냥 new Date하면 -을 인식못함 replace필요
                }

                //시작일자 세팅하기 날짜가 없는경우엔 제한을 걸지 않음
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

                //종료일자 세팅하기 날짜가 없는경우엔 제한을 걸지 않음
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

                //한개짜리 달력 datepicker
            } else if (!isValidStr(sDate)) {
                let sDay = sDate.val();
                if (flag && !isValidStr(sDay)) { //처음 입력 날짜 설정, update...			
                    let sdp = sDate.datepicker().data("datepicker");
                    sdp.selectDate(new Date(sDay.replace(/-/g, "/"))); //익스에서는 그냥 new Date하면 -을 인식못함 replace필요
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
</script>
<script>
    $(document).ready(function () {
      // 상단 탭 버튼
      $('#all').click(function () {

        $('#all').removeClass("unselect");
        $('#all').addClass("select");
        $('#category').removeClass("select");
        $('#category').addClass("unselect");

        $('#cate_box').hide();
        $('#all_box').show();
      });
      $('#category').click(function () {

        $('#category').removeClass("unselect");
        $('#category').addClass("select");
        $('#all').removeClass("select");
        $('#all').addClass("unselect");
        $('#all_box').hide();
        $('#cate_box').show();
      });
      // 상단 모든 카테고리 코드
      // 클릭해서 삭제
      $(".del").click(function (e) {

        $(this).parents('tr').remove();
      })
      // 선택 된 요소 삭제
      $(".seldel").click(function (e) {

        console.log($('.delche:checked'))
        $('.delche:checked').parents('tr').remove();
        $('.allche').removeAttr('checked');
      });
      // 해제시 전체 클릭 비활성화+모두 클릭되면 전체 클릭 활성화
      $('.delche:checked').click(function () {
        // 해제시 전체 클릭 비활성화
        $('.allche').prop("checked", false);
        //  모두 클릭되면 전체 클릭 활성화
        if ($('#all_box tbody>tr').length == $('.delche:checked').length) {
          $('.allche').prop("checked", true);
        }
      });
      //  전체 클릭 클릭시 전체온오프
      $('.allche').click(function () {
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
      $('.reset').click(function (e) {
        $(this).parents('tr').children('td:eq(3)').children().text('default');
        $(this).parents('tr').children('td:eq(3)').children().attr("data-default", "default");
      })
      // 코드 변화 감지에 따른 행동
      observer = new MutationObserver(function (mutations) {
        mutations.forEach(function (mutation) {
          console.log();
          $(mutation.target).parents('tr').children('td:eq(1)').children().text('default')
        });
      });
      const num = document.getElementsByClassName('num');
      for (let i = 0; i < num.length; i++) {
        observer.observe(document.getElementsByClassName('num')[i], { childList: true });
      }
    })
</script>
<script type="text/javascript">
        $(function () {
            $(".week").click(function () {
                let st = new Date($("#start_date").val());
                st.setDate(st.getDate() - 7);
                $("#start_date").val(st);
                datePickerSet($("#start_date"), $("#end_date"), true);
            });
            $(".month").click(function () {
                let st = new Date($("#start_date").val());
                st.setMonth(st.getMonth() - 1);
                $("#start_date").val(st);
                datePickerSet($("#start_date"), $("#end_date"), true);
            });
            $(".threemonth").click(function () {
                let st = new Date($("#start_date").val());
                st.setMonth(st.getMonth() - 3);
                $("#start_date").val(st);
                datePickerSet($("#start_date"), $("#end_date"), true);
            });
            $(".sixmonth").click(function () {
                let st = new Date($("#start_date").val());
                st.setMonth(st.getMonth() - 6);
                $("#start_date").val(st);
                datePickerSet($("#start_date"), $("#end_date"), true);
            });
            $(".year").click(function () {
                let st = new Date($("#start_date").val());
                st.setFullYear(st.getFullYear() - 1);
                $("#start_date").val(st);
                datePickerSet($("#start_date"), $("#end_date"), true);
            });
        });
</script>
</body>
</html>