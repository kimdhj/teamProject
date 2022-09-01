

// ajax 수정버튼
$(document).on("click","#listChange, #remove",function(){
	var i = $(".listNum");
	console.log($(numnum).val());
	let liist = [];
	
	for(var r=0; r<i.length; r++ ){
	var numnum = $(".listNum")[r];
		
		
		if(r<3){
		console.log($(numnum).val());
		liist.push($(numnum).val());
		}
		console.log(liist);
	}

$.ajax({
    url : "/ajax_list.mdo",
    type : 'POST',
	async : false,
    data : {
       event_seq : liist
    },
	success: function(data) {
		console.log(data);
			$.ajax({
    				url : "/ajax_ref1.mdo",
    				type : 'POST',
					async : false,
					success: function(data) {
						let str="";
						data.map((top,ind)=>{
						console.log(Date(top.event_end_date));
						str+=`<tr class="toptop">
                <td>
                  <div class="rowColumn" contenteditable="false" data-default="${top.event_title }">${top.event_title }</div>
                </td>
                <td>
                  <div class="rowColumn" contenteditable="false" data-default="${top.event_end_date }">${top.event_end_date }</div>
                </td>
                <td>
                  <div class="rowColumn" contenteditable="false" data-default="${top.event_target }">${top.event_target }</div>
                </td>
                <td>
                  <a href="/getEvent.mdo?event_seq=${top.event_seq }">
                 <button onclick="detailUpdate()">수정</button>
                  </a>
                </td>
                <td>
                  <button onclick="tableDelete(this)" id="remove">삭제</button>
                  <input type="hidden" class="listNum" value="${top.event_seq }" />
                </td>
                <td>
                  <button type="button" onclick="moveUp(this)">위로</button>
                  <button type="button" onclick="moveDown(this)">아래로</button>
                </td>
              </tr>`;
						});
						console.log(str);
						$("tbody").html("");
						$("tbody").append(str);
					},
					error: function(jqXHR, textStatus, errorThrown) {
						console.log('error while post');
						}
					});
					$.ajax({
    				url : "/ajax_ref2.mdo",
    				type : 'POST',
					async : false,
					success: function(data) {
						let str="";
						data.map((bottom,ind)=>{
						str+=`<tr class="botbot">
                <td>
                  <div class="rowColumn" contenteditable="false" data-default="${bottom.event_title }">${bottom.event_title }</div>
                </td>
                <td>
                  <div class="rowColumn" contenteditable="false" data-default="${bottom.event_end_date }">${bottom.event_end_date }</div>
                </td>
                <td>
                  <div class="rowColumn" contenteditable="false" data-default="${bottom.event_target }">${bottom.event_target }</div>
                </td>
                <td>
                  <a href="/getEvent.mdo?event_seq=${bottom.event_seq }">
                 <button onclick="detailUpdate()">수정</button>
                  </a>
                </td>
                <td>
                  <button onclick="tableDelete(this)" id="remove">삭제</button>
                  <input type="hidden" class="listNum" value="${bottom.event_seq }" />
                </td>
                <td>
                  <button type="button" onclick="moveUp(this)">위로</button>
                  <button type="button" onclick="moveDown(this)">아래로</button>
                </td>
              </tr>`;
						});
						console.log(str);
						$("tbody").append(str);
					},
					error: function(jqXHR, textStatus, errorThrown) {
						console.log('error while post');
						}
					});
	},
	error: function(jqXHR, textStatus, errorThrown) {
		console.log('error while post');
		}
	});
	
});

function detailUpdate() {
	 location.href="/getEvent.mdo"
}

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
 	var del = $(obj).next().val();
 	console.log(del);

$.ajax({
    url : "/ajax_del.mdo",
    type : 'POST',
    data : {
       del : del
    },
	success: function(data) {
		console.log(data);
	},
	error: function(jqXHR, textStatus, errorThrown) {
		console.log('error while post');
		}
	});
 	
 	
  	var tr = $(obj).parent().parent();
  	tr.remove();
}
