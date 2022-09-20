$("#myCartTab").on("click", function(){
	$.ajax({
		url:"/myRecentCart.do",
		type:"post",
		data:{},
		success:function(myRecentCartList){
			console.log(myRecentCartList);
			
			//실행할때마다 중복값이 중첩되어서 출력되는것을 방지하기위해 초기화 해준다.
			$("#tbodyCartTab").empty();
			
			for(let i = 0; i < myRecentCartList.length; i++) {
				console.log(myRecentCartList[i]);
				//받아온 객체배열을 하나씩 꺼내서 변수로 저장한다.
				let book_imgURL = myRecentCartList[i].book_imgURL;
				let book_title = myRecentCartList[i].book_title;
				let book_author = myRecentCartList[i].book_author;
				let book_publish = myRecentCartList[i].book_publish;
				let book_publish_date = myRecentCartList[i].book_publish_date;
				let book_price = myRecentCartList[i].book_price;
				
				//id값이 tbody인 <table id="tbody"></table> 안에 넣어줄 html
				$("#tbodyCartTab").append("<tr><td><img src='" + book_imgURL + "' alt='책 표지'/></td><td>" + book_title + "</td><td>" + book_author + "</td><td>" 
						+ book_publish + "</td><td>" + book_publish_date + "</td><td>" + book_price + "<td></tr>");
			}
			
		},
		error:function(){
			alert("에러다이자시가");
		}		
	});
});

$("#myRecentRequestTab").on("click", function(){
	
	$.ajax({
		url:"/myRecentRequest.do",
		type:"post",
		data:{},
		success:function(myRecentRequest){
			console.log(myRecentRequest);
			
			//실행할때마다 중복값이 중첩되어서 출력되는것을 방지하기위해 초기화 해준다.
			$("#tbodyRequestTab").empty();
			let myRequestHtml = "";
			
			for(let i = 0; i < myRecentRequest.length; i++) {
				console.log(myRecentRequest[i]);
				//받아온 객체배열을 하나씩 꺼내서 변수로 저장한다.
				let ask_seq = myRecentRequest[i].ask_seq;
				let ask_title = myRecentRequest[i].ask_title;
				let ask_status = myRecentRequest[i].ask_status;
				let ask_dateToString = myRecentRequest[i].ask_dateToString;
				
				//Backtick 기호를 활용하여 ${}를 사용하여 변수를 받고 <a>태그로 링크걸기
				myRequestHtml += `<tr><td>${ask_seq}</td>
				<td><a href="/myRequestDetail.do?ask_seq=${ask_seq}">${ask_title}</a></td>
				<td>${ask_status}</td><td>${ask_dateToString}</td></tr>`;
				$("#tbodyRequestTab").html(myRequestHtml);
				
				//링크걸기 실패
//				//id값이 tbody인 <table id="tbody"></table> 안에 넣어줄 html
//				$("#tbodyRequestTab").append("<tr><td>" + ask_seq 
//						+ "</td><td>" + ask_title + "</td><td>" + ask_status 
//						+ "</td><td>" + ask_dateToString + "</td></tr>");
			}
			
		},
		error:function(){
			alert("에러다이자시가");
		}		
	});
});