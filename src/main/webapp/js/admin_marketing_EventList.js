//동적테이블 js
function tableCreate() {
  var html = "";

  var name = $("#inName").val();
  var job = $("#inJob").val();
  var birth = $("#inBirth").val();
  var remove = $("remove").val();

  html += "<tr>";
  html += "<td>" + name + "</td>";
  html += "<td>" + job + "</td>";
  html += "<td>" + birth + "</td>";
  html += "<td>" + birth + "</td>";
  html += "<td>" + birth + "</td>";

  html +=
    '<td><button onclick="tableDelete(this)" id="remove">remove</button></td>';
  html += "</tr>";

  $("#dynamicTable").append(html);

  $("#inName").val("");
  $("#inJob").val("");
  $("#inBirth").val("");
}

function tableDelete(obj) {
  var tr = $(obj).parent().parent();

  tr.remove();
}
//<!-- 동적테이블 js 끝 -->

// <!-- 테이블 내부 값 수정 input타입 -->
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

// 위로 아래로 버튼
function moveUp(el) {
  var $tr = $(el).closest("tr");
  $tr.prev().before($tr);
}
function moveDown(el) {
  var $tr = $(el).closest("tr");
  $tr.next().after($tr);
}

//체크박스 비활성화
$(".main_event").on("click", function () {
  let chks = document.querySelectorAll(".main_event:checked"); //네임 선택
  let unchks = document.querySelectorAll(".main_event:not(:checked)");

  console.log(chks.length); //체크된 박스의 개수
  console.log(unchks.length); //체크된 박스의 개수
  if (chks.length >= 4) {
    $(".main_event:not(:checked)").prop("disabled", true);
  } else {
    $(".main_event:not(:checked)").prop("disabled", false);
  }
});

//TR 삭제
function tableDelete(obj) {
  var tr = $(obj).parent().parent();

  tr.remove();
}
