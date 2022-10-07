function ifRoulSub(e){
	let event_title = $(e).parents("#imgsize").children("div").children("div").children("small").text().trim();
	let roul = event_title.indexOf('룰렛');
	let sub = event_title.indexOf('구독');
	let seq = $(e).children("input").val();
	
	console.log(seq);
	console.log(event_title);
	console.log(roul);
	console.log(sub);
	
	if(roul != -1) {
	location.href = 'http://13.209.163.243/event_Roulette.do?event_seq='+seq;
	}else if(sub != -1){
	location.href = 'http://13.209.163.243/event_Sub_Info.do?event_seq='+seq;		
	}else{
	location.href = 'http://13.209.163.243/getEvent.do?event_seq='+seq;		
	};
	
};

function ifRoulSub2(t){
	let event_title = $(t).parents("div").next("#findT").children("div").children("strong").text().trim();
	let roul = event_title.indexOf('룰렛');
	let sub = event_title.indexOf('구독');
	let seq = $(t).children("input").val();
	
	console.log(seq);
	console.log(event_title);
	console.log(roul);
	console.log(sub);
	
	if(roul != -1) {
		location.href = 'http://13.209.163.243/event_Roulette.do?event_seq='+seq;
		}else if(sub != -1){
		location.href = 'http://13.209.163.243/event_Sub_Info.do?event_seq='+seq;		
		}else{
		location.href = 'http://13.209.163.243/getEvent.do?event_seq='+seq;		
		};
	
};