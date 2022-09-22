/*subscribePay에서 복사 시작*/

// 쿠폰 할인가격


doAddPoint();
let final=Number($("#sumsumsum").text().trim().replaceAll(",", ""));
let mymypoint = $("#myPoint").text();
//쿠폰 선택
$("#coupon").on("change",function(){
//console.log($("#coupon").html().data("seq"));
$("#orders_coupon_effect").val(Number($("#coupon").val()));
$("#couponselcode").val(Number($("#coupon").find("option:selected").data("seq")));
console.log($("#couponselcode").val());
})
//주소지 선택
$("#home").on("change",function(){
console.log($("#home").val());
$.ajax({
  type: "GET",
  url: "seldeli.do",  
  data: {
  seq:$("#home").val()
  },  
  success: function(re){
  console.log(re);
  $("#orders_name").val(re.my_delivery_name);
  $("#phone").val(re.my_delivery_phone);
  $("#zipcode").val(re.my_delivery_zipcode);
  $("#orders_address").val(re.my_delivery_address);
  $("#orders_remainaddress").val(re.my_delivery_remain_address);

  },  
  dataType: "json"  
});  

})

//보유 포인트 포맷 시작

$("#myPoint").number($("#myPoint").text());

//보유 포인트 포맷 끝

//포인트 숫자만 입력하게 합시다 시작
$("#usePoint").on(
	"propertychange change paste input keyUp keyDown",
	function() {
		$("#usePoint").val(
			Number($("#usePoint")
				.val()
				.replace(/[^0-9]/gi, ""))
		);
	}
);
$("#phone").on(
	"propertychange change paste input keyUp keyDown",
	function() {
		$("#phone").val(
			$("#phone")
				.val()
				.replace(/[^0-9]/gi, "")
		);
		var regPhone = /^01([0|1|6|7|8|9])-?([0-9]{3,4})-?([0-9]{4})$/;
      if (regPhone.test($("#phone").val()) === true) {
         $("#phalert").text('사용 가능');
      }else{
        $("#phalert").text('사용 불가');
      }
		
	}
);
$("#refund_num").on(
	"propertychange change paste input keyUp keyDown",
	function() {
		$("#refund_num").val(
			$("#refund_num")
				.val()
				.replace(/[^0-9]/gi, "")
		);
	
     
		
	}
);
//포인트 숫자만 입력하게 합시다 끝
let beforepo=0;
//보유 포인트 안넘게 합시다 시작
$("#usePoint").on("propertychange change paste input keyUp", function() {

	beforepo=Number($("#usePointResult").text().trim().replaceAll(",", ""));
	let final=beforepo+Number($("#sumsumsum").text().trim().replaceAll(",", ""));
	let noover = $("#usePoint").val();
	if (Number(noover) > Number(mymypoint)) {
		noover = mymypoint;
		$.number(noover);
		$("#usePoint").val(noover);
		let ayaaa = $("#usePoint").val();
		$("#usePointResult").number(ayaaa);
	}
	if (Number(noover) >Number(final)) {
		
	
		$("#usePoint").val(final);
		let ayaaa = final;
		$("#usePointResult").number(final);
	}
	$("#usePointResult").number($("#usePoint").val());
	beforepo=Number($("#usePointResult").text().trim().replaceAll(",", ""));
	init2();
});
//보유 포인트 안넘게 합시다 끝


// 합계 마이너스 안되게 합시다 끝

//쿠폰 선택 합시다 시작
$("#coupon").on("change", function() {
	let selectVal = $("#coupon").val();
	console.log(selectVal);
	$("#coupon_result").number(selectVal);
	init2();


});
//쿠폰 선택 합시다 끝


/*subscribePay에서 복사 끝*/

/*bookPay용 따로 작성*/

//적립금 시작
function doAddPoint() {
	let iitsSum =
		parseInt($("#sumsumsum").text().replace(/,/gi, "")) +
		parseInt($("#usePointResult").text().replace(/,/gi, "")) +
		parseInt($("#deliveryPrice2").text().replace(/,/gi, "")) +
		parseInt($("#coupon_result").text().replace(/,/gi, ""));
	$("#addPoint").number(iitsSum / 200);
}
//
$("#adbtn").click(function() {
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
			document.getElementById("zipcode").value = data.zonecode;
			document.getElementById("orders_address").value = addr;
			// 커서를 상세주소 필드로 이동한다.
			document.getElementById("orders_remainaddress").focus();
		},
	}).open();
});

//시작
init2();
function init2() {

	let count = $(".book_count");
	let price = $(".bookPrices");
	let booksum = 0;
	count.map((ind, el) => {
		booksum += Number($(price[ind]).text().trim().replaceAll(",", "")) * $(el).val();
	});
	if(booksum>=50000){
	$("#deliveryPrice2").number(0);
	}else{
	$("#deliveryPrice2").number(2500);
	}
booksum -= booksum*Number($("#coupon_result").text().trim().replaceAll(",", ""))/100;
	booksum -= Number($("#usePointResult").text().trim().replaceAll(",", ""));
	
	
	$("#sumsumsum").number(Number(booksum));

	$("#addPoint").number(Number(booksum/100*1));
	
	$("#orders_add_point").val(Number($("#addPoint").text().replaceAll(",","")));
		console.log($("#orders_add_point").val());
	$("#delivery").text($("#deliveryPrice2").text().trim());
}
