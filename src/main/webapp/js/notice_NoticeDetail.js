$(function() {
	$("#endPoint").click(function() {
		$("html").scrollTop("0");
	});
});

$(function() {
	$("#chat_button").click(function() {
		$("#real_chat").toggleClass("hide");
	});
	$("#search_btn").click(function() {
		$("#main_search").toggleClass("hide");
	});
})