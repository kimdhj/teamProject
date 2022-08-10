//구독 가격 읽어오기
let subPrice = $("#subPrice").text();

//구독 버튼 가격 출력
dobutton();

function dobutton() {
  $("#subscribe_Price_oneMonth").number(subPrice);
  $("#subscribe_Price_oneYear").number(subPrice * 12);
}
