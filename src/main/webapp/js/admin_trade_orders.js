$("#orders_cache_tool").val($("#tool").val()).prop("selected", true);
$("#orders_status").val($("#state").val()).prop("selected", true);
$("#add_addr").click(function() {
	console.log("hi");
	new daum.Postcode({
		oncomplete: function(data) {
			// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

			// 각 주소의 노출 규칙에 따라 주소를 조합한다.
			// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
			var addr = ""; // 주소 변수
			var extraAddr = ""; // 참고항목 변수

			//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
			if (data.userSelectedType === "R") {
				// 사용자가 도로명 주소를 선택했을 경우
				addr = data.roadAddress;
			} else {
				// 사용자가 지번 주소를 선택했을 경우(J)
				addr = data.jibunAddress;
			}

			// 우편번호와 주소 정보를 해당 필드에 넣는다.
			document.getElementById("orders_zipcode").value = data.zonecode;
			document.getElementById("orders_address").value = addr;
			// 커서를 상세주소 필드로 이동한다.
			document.getElementById("orders_remainaddress").focus();
		},
	}).open();
});
 $("#orders_order_day").datepicker({
    language: "ko",
  });
  $("#add_book").on("click",function(){
  let str=`      <div id="book" class="row d-flex align-items-center justify-content-around">
          <div class="col-3">
            <div class="mb-3">
              <label for="book_seq" class="form-label border-1 border-dark">책 번호</label> 
              <input required type="number"  class="form-control book_seq  border-1 border-dark" name="book_seq"  id="book_seq" />
            </div>
          </div>
          <div class="col-3">
            <div class="mb-3">
              <label for="order_bookList_count" class="form-label border-1 border-dark">책 수량</label> 
              <input required type="number" name="book_count"  class="form-control book_count  border-1 border-dark"  id="order_bookList_count" />
            </div>
          </div>
            <div class="col-3">
              <div class="mb-3">
              <button type="button" id="del" class="btn bg-primary text-white rounded-pill col">한줄 제거</button>
            </div>
        
        </div>
          </div>
        
        </div>`;
  $("#bookbox").append(str);
  document.documentElement.scrollTop = document.documentElement.scrollHeight;
  })
  $(document).on("click","#del",function(e){
  console.log($(e.target).parents("#book"))
  $(e.target).parents("#book").remove();
  })
  $(document).on("propertychange change paste input keyUp keyDown",".book_seq,.book_count",function(e){
  
	$(e.target).val($(e.target).val().replace(/[^0-9]/g,'')) ;
	if($(e.target).val()[0]=="0"){
	$(e.target).val(null);
	}
	

});
$(document).on("propertychange change paste input keyUp keyDown",".book_seq",function(e){
  

	$.ajax ({
 
  url	: "chebookseq.mdo", // 요청이 전송될 URL 주소
  type	: "GET", // http 요청 방식 (default: ‘GET’)

  data  : {book_seq : $(e.target).val()}, // 요청 시 포함되어질 데이터
 
  dataType    : "json", // 응답 데이터 형식 (명시하지 않을 경우 자동으로 추측)
  
  success : function(data) {
  console.log( $("#mod_btn"));
    if(data<=0){
    $("#mod_btn").attr("disabled","true");
    }else{
    $("#mod_btn").removeAttr("disabled");
    }
  }
  });

});
	
	
	
	
	
 
  
  

  