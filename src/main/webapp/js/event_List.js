function ifRoulSub(e){
	var event_title = $(e).parents("#imgsize").children("div").children("div").children("small").text().trim();
	var roul = event_title.indexOf('룰렛');
	var sub = event_title.indexOf('구독');
	var seq = $(e).children("input").val();
	
	console.log(seq);
	console.log(event_title);
	console.log(roul);
	console.log(sub);
	
	if(roul != -1) {
	location.href = 'http://localhost:8080/event_Roulette.do?event_seq='+seq;
	}else if(sub != -1){
	location.href = 'http://localhost:8080/event_Sub.do?event_seq='+seq;		
	}else{
	location.href = 'http://localhost:8080/getEvent.do?event_seq='+seq;		
	};
	
};

function ifRoulSub2(t){
	var event_title = $(t).parents("#findT").children();
//	var roul = event_title.indexOf('룰렛');
//	var sub = event_title.indexOf('구독');
//	var seq = $(e).children("input").val();
	
//	console.log(seq);
	console.log(event_title);
//	console.log(roul);
//	console.log(sub);
	
	
	
};