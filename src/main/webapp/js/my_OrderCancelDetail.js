//배송조회 버튼
function checkArrival() {
	let orders_delivery = $("#orders_delivery").val();
	let orders_delivery_company = $("#orders_delivery_company").val();
	deliveryTracking(orders_delivery, orders_delivery_company);
	console.log(orders_delivery, orders_delivery_company);
}

//운송장번호로 배송 조회
function deliveryTracking(orders_delivery, orders_delivery_company) {
	console.log(orders_delivery) //운송장번호
	console.log(orders_delivery_company)//택배사 우체국(0), 대한통운(1), 로젠(2)
	let link = "https://tracker.delivery/#/";

	//팝업창 크기
	const _width = '800';
	const _height = '350';
	//화면 중단점에 띄우기 위한 top, left 여백 구하기
	const _left = Math.ceil((window.screen.width - _width) / 2);
	const _top = Math.ceil((window.screen.height - _height) / 2);
	
	//조회하기위한 url 작성
	if (orders_delivery_company == 0) {
		alert("우체국택배");
		link += "kr.epost/"
		console.log(link);
	} else if (orders_delivery_company == 1) {
		alert("CJ대한통운");
		link += "kr.cjlogistics/"
	} else if (orders_delivery_company == 2) {
		alert("로젠택배");
		link += "kr.logen/"
	}
	link += orders_delivery;
	console.log(link);
	window.open(link, '_blank', 'width=' + _width + ', height='
			+ _height + ', left=' + _left + ', top=' + _top);
	//window.location.href = link;
}