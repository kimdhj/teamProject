// 구독 가격
let subPrice = $("#subPrice").text();
// 쿠폰 할인가격
let new_user_coupon = $("#new_user_coupon").val();
let my_friend_coupon = $("#my_friend_coupon").val();
let roulette_coupon = $("#roulette_coupon").val();
doSumsum();

// 구독 개월 수 버튼
/*
$('#plus').on('click',function() {
      let countVal = $('#howmuchsub').val();
      let count = parseInt(countVal);
      count += 1;
      $('#howmuchsub').val(count);
      let resuuult = count * subPrice;
        $( '#subPriceResult').number(resuuult);
    })

    $('#minus').on('click',function() {
      let countVall = $('#howmuchsub').val();
      let countt = parseInt(countVall);
      if(countVall > 1)
      countt -= 1;
      $('#howmuchsub').val(countt);
      let resuult = countt * subPrice;
      $('#subPriceResult').number(resuult);
    })
*/

//구독 개월 수 변경 시작
let plusEle = document.querySelector("#plus");
let minusEle = document.querySelector("#minus");
let isPressed = false;
let iisPressed = false;

plusEle.addEventListener("mouseup", function (event) {
  isPressed = false;
});

plusEle.addEventListener("mousedown", function (event) {
  isPressed = true;
  doInterval("1");
});

function doInterval(action) {
  if (isPressed) {
    howmuchsub.value = parseInt(howmuchsub.value) + parseInt(action);

    setTimeout(function () {
      doInterval(action);
    }, 200);
    $("#subPriceResult").number(howmuchsub.value * subPrice);
    doSumsum();
  }
}

minusEle.addEventListener("mouseup", function (event) {
  iisPressed = false;
});

minusEle.addEventListener("mousedown", function (event) {
  iisPressed = true;

  doInterval1("-1");
});

function doInterval1(action) {
  if (!iisPressed) {
    return;
  }

  if (
    parseInt($("#subPriceResult").text().replace(/,/gi, "")) -
      parseInt($("#usePointResult").text().replace(/,/gi, "")) -
      parseInt($("#coupon_result").text().replace(/,/gi, "")) -
      subPrice <
    0
  ) {
    let lose_point = $("#usePoint").val();
    if (
      Number(lose_point) +
        parseInt($("#subPriceResult").text().replace(/,/gi, "")) -
        parseInt($("#usePointResult").text().replace(/,/gi, "")) -
        parseInt($("#coupon_result").text().replace(/,/gi, "")) -
        subPrice >
      0
    ) {
      lose_point =
        Number(lose_point) +
        (parseInt($("#subPriceResult").text().replace(/,/gi, "")) -
          parseInt($("#usePointResult").text().replace(/,/gi, "")) -
          parseInt($("#coupon_result").text().replace(/,/gi, "")) -
          subPrice);
      console.log(lose_point);
      $.number(lose_point);
      $("#usePoint").val(lose_point);
      let ayaaac = $("#usePoint").val();
      $("#usePointResult").number(ayaaac);
      doSumsum();
    } else {
      lose_point = 0;
      $.number(lose_point);
      $("#usePoint").val(lose_point);
      let ayaaac = $("#usePoint").val();
      $("#usePointResult").number(ayaaac);
      doSumsum();
    }
  }
  // if(parseInt($('#sumsumsum').text().replace(",",""))<subPrice){
  //     iisPressed = false;
  // }

  if (iisPressed) {
    let countEle = document.querySelector("#howmuchsub");
    if (countEle.value > 1) {
      howmuchsub.value = parseInt(howmuchsub.value) + parseInt(action);

      setTimeout(function () {
        doInterval1(action);
      }, 200);
    }
    $("#subPriceResult").number(howmuchsub.value * subPrice);
    doSumsum();
  }
}
//구독 개월 수 변경 끝

//구독 가격 변화 시작
$("#howmuchsub").on("propertychange change paste input", function () {
  let aaaaa = $("#howmuchsub").val();
  let abbbbb = aaaaa * subPrice;
  $("#subPriceResult").number(abbbbb);
  doSumsum();
});

$("#usePoint").on("propertychange change paste input", function () {
  let ccccc = $("#usePoint").val();
  $("#usePointResult").number(ccccc);
  doSumsum();
});
//구독 가격 변화 끝

//보유 포인트 포맷 시작
let mymypoint = $("#myPoint").text();
$("#myPoint").number(mymypoint);

//보유 포인트 포맷 끝

//포인트 숫자만 입력하게 합시다 시작
$("#usePoint").on(
  "propertychange change paste input keyUp keyDown",
  function () {
    $("#usePoint").val(
      $("#usePoint")
        .val()
        .replace(/[^0-9]/gi, "")
    );
  }
);
//포인트 숫자만 입력하게 합시다 끝

//보유 포인트 안넘게 합시다 시작
$("#usePoint").on("propertychange change paste input keyUp", function () {
  let noover = $("#usePoint").val();
  if (Number(noover) > Number(mymypoint)) {
    noover = mymypoint;
    $.number(noover);
    $("#usePoint").val(noover);
    let ayaaa = $("#usePoint").val();
    $("#usePointResult").number(ayaaa);
  }
});
//보유 포인트 안넘게 합시다 끝

// 합계 마이너스 안되게 합시다 시작
$("#usePoint").on("propertychange change paste input keyUp", function () {
  let nnoover = parseInt($("#usePoint").val());
  let nonoover = parseInt($("#subPriceResult").text().replace(/,/gi, ""));
  let nooover = parseInt($("#coupon_result").text().replace(/,/gi, ""));
  let notover = nonoover - nooover;

  if (nnoover > notover) {
    nnoover = notover;
    console.log(nnoover);
    $("#usePoint").val(nnoover);
    let aya = $("#usePoint").val();
    $("#usePointResult").number(aya);
  }
});
// 합계 마이너스 안되게 합시다 끝

//쿠폰 선택 합시다 시작
$("#input_text_size").on("change", function () {
  let selectVal = $("#input_text_size option:selected").text();
  if (selectVal == "신규 유저 쿠폰") {
    $("#coupon_result").number(new_user_coupon);
  } else if (selectVal == "추천인 특별 쿠폰") {
    $("#coupon_result").number(my_friend_coupon);
  } else if (selectVal == "룰렛 5등 당첨 쿠폰") {
    $("#coupon_result").number(roulette_coupon);
  } else {
    $("#coupon_result").number(0);
  }
  doSumsum();
});
//쿠폰 선택 합시다 끝

// 합계 구합시다 시작
function doSumsum() {
  let itsSum =
    parseInt($("#subPriceResult").text().replace(/,/gi, "")) -
    parseInt($("#usePointResult").text().replace(/,/gi, "")) -
    parseInt($("#coupon_result").text().replace(/,/gi, ""));
  if (itsSum < 1) itsSum = 0;
  $("#sumsumsum").number(itsSum);
}
// 합계 구합시다 끝
