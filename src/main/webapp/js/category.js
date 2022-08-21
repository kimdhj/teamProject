$(document).ready(function () {
  // 상단 탭 버튼
  $("#all").click(function () {
    $("#all").removeClass("unselect");
    $("#all").addClass("select");
    $("#category").removeClass("select");
    $("#category").addClass("unselect");

    $("#cate_box").hide();
    $("#all_box").show();
  });
  $("#category").click(function () {
    $("#category").removeClass("unselect");
    $("#category").addClass("select");
    $("#all").removeClass("select");
    $("#all").addClass("unselect");
    $("#all_box").hide();
    $("#cate_box").show();
  });
  // 상단 모든 카테고리 코드
  // 클릭해서 삭제
  $(".del").click(function (e) {
    $(this).parents("tr").remove();
  });
  // 선택 된 요소 삭제
  $(".seldel").click(function (e) {
    console.log($(".delche:checked"));
    $(".delche:checked").parents("tr").remove();
    $(".allche").removeAttr("checked");
  });
  // 해제시 전체 클릭 비활성화+모두 클릭되면 전체 클릭 활성화
  $(".delche:checked").click(function () {
    // 해제시 전체 클릭 비활성화
    $(".allche").prop("checked", false);
    //  모두 클릭되면 전체 클릭 활성화
    if ($("#all_box tbody>tr").length == $(".delche:checked").length) {
      $(".allche").prop("checked", true);
    }
  });
  //  전체 클릭 클릭시 전체온오프
  $(".allche").click(function () {
    if ($(".allche").is(":checked")) {
      $(".delche").prop("checked", true);
    } else {
      $(".delche").prop("checked", false);
    }
  });
  // checked 초기화
  $(".delche").prop("checked", false);
  $(".allche").prop("checked", false);
  // 하단에 있는 카테고리 홍보 코드
  // 리셋 버튼 코드 초기화
  $(".reset").click(function (e) {
    $(this).parents("tr").children("td:eq(3)").children().text("default");
    $(this)
      .parents("tr")
      .children("td:eq(3)")
      .children()
      .attr("data-default", "default");
  });
  // 코드 변화 감지에 따른 행동
  observer = new MutationObserver(function (mutations) {
    mutations.forEach(function (mutation) {
      console.log();
      $(mutation.target)
        .parents("tr")
        .children("td:eq(1)")
        .children()
        .text("default");
    });
  });
  const num = document.getElementsByClassName("num");
  for (let i = 0; i < num.length; i++) {
    observer.observe(document.getElementsByClassName("num")[i], {
      childList: true,
    });
  }
  // 테이블 내가 만든거 select 박스 넣기
  select = $(".selectColumn");
  selectfun();
  function selectfun() {
    // 더블 클릭시 원하는 요소로 변경
    $(".selectColumn").dblclick(function (e) {
      let text = $(this).text();
      $(
        this
      ).html(`<select class="row form-select" id="td select" aria-label="Default select example">
              <option value="선택">옵션 선택</option>  
              <option value="상위">상위</option>
              <option value="중위">중위</option>
              <option value="하위">하위</option>
              </select>`);
      let outthis = $(this);
      // 값 변경시 글자로 변셩
      $(this)
        .children("select")
        .change(function (e) {
          console.log($(this));
          text = e.target.value;
          outthis.html(text);
        });
    });
  }
  // 테이블 기본꺼
  // @breif contenteditable 속성을 가진경우
  contents = document.getElementsByClassName("rowColumn");
  document.addEventListener("DOMContentLoaded", function () {
    // @breif rowColumn 클래스의 갯수 만큼 반복문을 실행한다.
    Array.from(contents).forEach(function (content) {
      // @breif 마우스로 해당영역을 더블클릭 한경우
      content.addEventListener("dblclick", function (event) {
        // @breif 전체 테이블 컬럼( td > p )에서 현재 사용중인 값의 존재여부를 확인한다.
        Array.from(contents).forEach(function (defaultVal) {
          // @details 빈값( null )이 존재하는지 체크한다.
          /* if(
                   defaultVal.textContent == ""
                || defaultVal.textContent == null
                || defaultVal.textContent == undefined
                || (defaultVal.textContent != null
                && typeof defaultVal.textContent == "object"
                && !Object.keys(defaultVal.textContent).length == ""))
            {
 
                // @details 내용이 존재하지 않다면 data 태그의 기본값으로 되돌린다.
                defaultVal.textContent = defaultVal.dataset.default;
            }
             */

          // @details 저장하지 않은 내용이라고 판단하여 data 태그의 기본값으로 되돌린다.
          defaultVal.textContent = defaultVal.dataset.default;

          // @breif 수정 불가 상태로 되돌린다.
          defaultVal.contentEditable = false;
          defaultVal.style.border = "0px";
        });

        if (content.isContentEditable == false) {
          // @details 편집 가능 상태로 변경
          content.contentEditable = true;

          // @details 텍스트 문구 변경
          // content.textContent = "";

          // @details CSS 효과 추가
          content.style.border = "1px solid #FFB6C1";

          // @details 포커스 지정
          content.focus();
        }
      });

      // @breif 키보드 입력이 방생한 경우 실행
      content.addEventListener("keypress", function (event) {
        // @breif Enter키 입력시 실행
        if (event.key === "Enter") {
          // @details 입력된 값이 빈값( null )인지 체크한다.
          if (
            content.textContent == "" ||
            content.textContent == null ||
            content.textContent == undefined ||
            (content.textContent != null &&
              typeof content.textContent == "object" &&
              !Object.keys(content.textContent).length == "")
          ) {
            // @details 내용이 존재하지 않다면 data 태그의 기본값으로 되돌린다.
            content.textContent = content.dataset.default;
          } else {
            // @details 내용의 수정이 완료되었다면 data 태그의 기본값도 바꿔준다.
            content.dataset.default = content.textContent;
          }
          // @breif 수정 불가 상태로 되돌린다.
          content.contentEditable = false;
          content.style.border = "0px";
        }
      });
    });
  });
});
