$(function () {
  $("#coupon_add").click(function () {
    $("#coupon_popUp").removeClass("hide");
  });
  $("#popup_close").click(function () {
    $("#coupon_popUp").addClass("hide");
  });
  $("#coupon_insert").click(function () {
    $("#coupon_popUp").addClass("hide");
  });
});
