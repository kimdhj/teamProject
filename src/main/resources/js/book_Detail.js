$(function () {
  $("#review_btnBox").click(function () {
    $("#bottom_detail").css("box-shadow", "");
    $("#item_detail").addClass("hide");
    $("#reviews").removeClass("hide");
  });
  $("#item_btnBox").click(function () {
    $("#bottom_detail").css("box-shadow", "0px 0px 20px gray");
    $("#reviews").addClass("hide");
    $("#item_detail").removeClass("hide");
  });
  $("#add_cartCheck").click(function () {
    $("#add_cartCheck").addClass("hide");
    $("#add_cart").removeClass("hide");
    console.log("check");
  });
  $("#add_cart").click(function () {
    $("#add_cart").addClass("hide");
    $("#add_cartCheck").removeClass("hide");

    console.log("check");
  });
});
