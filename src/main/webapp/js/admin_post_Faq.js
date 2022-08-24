$(function() {
	$("#level").change(function() {
		if ($("#level").val() == "1") {
			$(".form-select1").removeClass("hide");
			$(".form-select2").addClass("hide");
			$(".form-select3").addClass("hide");
			$(".form-select4").addClass("hide");
		} else if ($("#level").val() == "2") {
			$(".form-select2").removeClass("hide");
			$(".form-select1").addClass("hide");
			$(".form-select3").addClass("hide");
			$(".form-select4").addClass("hide");
		} else if ($("#level").val() == "3") {
			$(".form-select3").removeClass("hide");
			$(".form-select1").addClass("hide");
			$(".form-select2").addClass("hide");
			$(".form-select4").addClass("hide");
		} else if ($("#level").val() == "4") {
			$(".form-select4").removeClass("hide");
			$(".form-select1").addClass("hide");
			$(".form-select2").addClass("hide");
			$(".form-select3").addClass("hide");
		}
		console.log($("#level").val());
	});
});

$(document).ready(function() {
	// 상단 탭 버튼
	$('#all').click(function() {

		$('#all').removeClass("unselect");
		$('#all').addClass("select");
		$('#category').removeClass("select");
		$('#category').addClass("unselect");

		$('#cate_box').hide();
		$('#all_box').show();
	});
	$('#category').click(function() {

		$('#category').removeClass("unselect");
		$('#category').addClass("select");
		$('#all').removeClass("select");
		$('#all').addClass("unselect");
		$('#all_box').hide();
		$('#cate_box').show();
	});
	// 상단 모든 카테고리 코드
	// 클릭해서 삭제
	$(".del").click(function(e) {

		$(this).parents('tr').remove();
	})
	// 선택 된 요소 삭제
	$(".seldel").click(function(e) {

		console.log($('.delche:checked'))
		$('.delche:checked').parents('tr').remove();
		$('.allche').removeAttr('checked');
	});
	// 해제시 전체 클릭 비활성화+모두 클릭되면 전체 클릭 활성화
	$('.delche:checked').click(function() {
		// 해제시 전체 클릭 비활성화
		$('.allche').prop("checked", false);
		//  모두 클릭되면 전체 클릭 활성화
		if ($('#all_box tbody>tr').length == $('.delche:checked').length) {
			$('.allche').prop("checked", true);
		}
	});
	//  전체 클릭 클릭시 전체온오프
	$('.allche').click(function() {
		if ($('.allche').is(':checked')) {
			$('.delche').prop("checked", true);
		} else {
			$('.delche').prop("checked", false);
		}
	})
	// checked 초기화
	$('.delche').prop("checked", false);
	$('.allche').prop("checked", false);
	// 하단에 있는 카테고리 홍보 코드
	// 리셋 버튼 코드 초기화
	$('.reset').click(function(e) {
		$(this).parents('tr').children('td:eq(3)').children().text('default');
		$(this).parents('tr').children('td:eq(3)').children().attr("data-default", "default");
	})
	// 코드 변화 감지에 따른 행동
	observer = new MutationObserver(function(mutations) {
		mutations.forEach(function(mutation) {
			console.log();
			$(mutation.target).parents('tr').children('td:eq(1)').children().text('default')
		});
	});
	const num = document.getElementsByClassName('num');
	for (let i = 0; i < num.length; i++) {
		observer.observe(document.getElementsByClassName('num')[i], { childList: true });
	}
})