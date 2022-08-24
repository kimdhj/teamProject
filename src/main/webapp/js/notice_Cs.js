$(function () {
    $("#img_payment").click(function () {
        $("#form-select1").removeClass("hide");
        $("#form-select2").addClass("hide");
        $("#form-select3").addClass("hide");
        $("#form-select4").addClass("hide");
    });
});

$(function () {
    $("#img_delivery").click(function () {
        $("#form-select2").removeClass("hide");
        $("#form-select1").addClass("hide");
        $("#form-select3").addClass("hide");
        $("#form-select4").addClass("hide");
    });
});

$(function () {
    $("#img_exchange").click(function () {
        $("#form-select3").removeClass("hide");
        $("#form-select1").addClass("hide");
        $("#form-select2").addClass("hide");
        $("#form-select4").addClass("hide");
    });
});

$(function () {
    $("#img_user").click(function () {
        $("#form-select4").removeClass("hide");
        $("#form-select1").addClass("hide");
        $("#form-select2").addClass("hide");
        $("#form-select3").addClass("hide");
    });
});

$(".switch1").click(function(){
	console.log($(this).parents("#table_payment_content").next().hasClass('hide'));
	let ch = $(this).parents("#table_payment_content").next().hasClass('hide');
    $(".fold").addClass("hide");
    $(this).parents("#table_payment_content").next().toggleClass("hide");
    
    if(!ch){
    	$(this).parents("#table_payment_content").next().addClass("hide");
    }
});

$(".switch2").click(function(){
	console.log($(this).parents("#table_delivery_content").next().hasClass('hide'));
	let ch = $(this).parents("#table_delivery_content").next().hasClass('hide');
    $(".fold").addClass("hide");
    $(this).parents("#table_delivery_content").next().toggleClass("hide");
    
    if(!ch){
    	$(this).parents("#table_delivery_content").next().addClass("hide");
    }
});

$(".switch3").click(function(){
	console.log($(this).parents("#table_change_content").next().hasClass('hide'));
	let ch = $(this).parents("#table_change_content").next().hasClass('hide');
    $(".fold").addClass("hide");
    $(this).parents("#table_change_content").next().toggleClass("hide");
    
    if(!ch){
    	$(this).parents("#table_change_content").next().addClass("hide");
    }
});

$(".switch4").click(function(){
	console.log($(this).parents("#table_user_content").next().hasClass('hide'));
	let ch = $(this).parents("#table_user_content").next().hasClass('hide');
    $(".fold").addClass("hide");
    $(this).parents("#table_user_content").next().toggleClass("hide");
    
    if(!ch){
    	$(this).parents("#table_user_content").next().addClass("hide");
    }
});