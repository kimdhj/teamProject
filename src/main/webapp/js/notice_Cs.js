// 주문/결제
$(function () {
    $("#img_payment").click(function () {
        $("#form-select1").removeClass("hide");
        
        $("#all_box #bigsortche").val('주문/결제');
//        console.log("값 바꿔", $("#all_box #bigsortche").val());
        
        $("#all_box #faqname1").text($("#all_box #bigsortche").val()); // div 태그에서는 text 로
//        console.log("값 바꿔",  $("#all_box #faqname1").text()); 
        
        let con = "";
    con +=    `
        <option value="" selected>전체</option>
          <option value="주문">주문</option>
          <option value="결제">결제</option>
          <option value="포인트">포인트</option>
          <option value="쿠폰">쿠폰</option>
          <option value="기타">기타</option>
        `;
    	$("#all_box #level2").html(con); 
    
        $("#smallsortche").val(null); // smallsortche 에서 전체값 
        
        console.log("smallsort 값 = ", $("#smallsortche").val());
        
        $("#all_box #pageche").val("1");
        
        make();
        console.log("1여기니???");
    });
});

$(document).on('change', '#level2', function(){
	$("#smallsortche").val($("#level2").val());
	console.log("smallsortche 값 = " ,$("#smallsortche").val());
	$("#all_box #pageche").val("1");
	make();
})

$(document).on('click', '#faqtitle', function(e){
//	$("#faqanswer").text($("#contentche").val());
	
	console.log($(e.target).parents('div').next('div'));
	
	let valSeq = $(this).parents('div').children('div:eq(0)').children('input').val();
	let seq = Number($(this).parents('div').children('div:eq(0)').text().trim());
	
	console.log($("#faqanswer").text());
	$("#contentche").val($("#faqanswer").text()); // 답변 내용에 저장
	
	$(".faqalt").addClass("hide"); // 답변에 hide 클래스 줬을 때 
	$(e.target).parents('div').next('div').removeClass("hide"); // 답변을 찾아서 띄워주는 코드
	
	console.log($("#contentche").val());
	console.log("답변이 나오는 구간입니다아");
})

$(function () {
    $("#img_delivery").click(function () {
    	$("#form-select1").removeClass("hide");
    	
        $("#all_box #bigsortche").val('배송/수령일 안내'); // bigsort 값을 해당 큰 분류로 값 넣어줄 때
        console.log("값 바꿔", $("#all_box #bigsortche").val());
        
        $("#all_box #faqname1").text($("#all_box #bigsortche").val());
        
        let con = "";
        con +=    `
            <option value="" selected>전체</option>
              <option value="배송료">배송료</option>
              <option value="배송안내">배송안내</option>
              <option value="기타">기타</option>
            `;
        $("#all_box #level2").html(con); 
        
        $("#smallsortche").val(null); // smallsort 값 전체일 때
        
        console.log($("#level2"));
    	
        $("#all_box #pageche").val("1");
    	make();
        console.log("2여기니???");
    });
});

$(function () {
    $("#img_exchange").click(function () {
    	$("#form-select1").removeClass("hide");
    	
    	$("#all_box #bigsortche").val('반품/교환/환불');
        console.log("값 바꿔", $("#all_box #bigsortche").val());
        
        $("#all_box #faqname1").text($("#all_box #bigsortche").val());
        
        let con = "";
        con +=    `
            <option value="" selected>전체</option>
              <option value="주문취소/변경">주문취소/변경</option>
              <option value="반품/교환/환불">반품/교환/환불</option>
              <option value="주의사항">주의사항</option>
        	<option value="기타">기타</option>
            `;
        $("#all_box #level2").html(con); 
        
        $("#smallsortche").val(null);
    	
        $("#all_box #pageche").val("1");
    	make();
        console.log("3여기니???");
    });
});

$(function () {
    $("#img_user").click(function () {
    	$("#form-select1").removeClass("hide");
    	
    	$("#all_box #bigsortche").val('회원');
        console.log("값 바꿔", $("#all_box #bigsortche").val());
        
        $("#all_box #faqname1").text($("#all_box #bigsortche").val());
        
        let con = "";
        con +=    `
            <option value="" selected>전체</option>
              <option value="회원가입/탈퇴">회원가입/탈퇴</option>
              <option value="회원정보 확인/변경">회원정보 확인/변경</option>
        	<option value="개인정보 유효기간제">개인정보 유효기간제</option>
              <option value="기타">기타</option>
            `;
        $("#all_box #level2").html(con); 
        
        $("#smallsortche").val(null);
    	
        $("#all_box #pageche").val("1");
    	make();
        console.log("4여기니???");
    });
});

//페이지 네이션 화면 이동
$(document).on('click', '#page1 a', makeDisplay);
$(document).on('click', '#page a', QmakeDisplay);

// 검색
$("#qna_box .search_btn").click(function(e){
	$("#qna_box #qnaseq").val(0);
	$("#qna_box #qnapage").val(1);
	$("#qna_box #qnatitle").val(null);
	$("#qna_box #qnauser").val(null);
	
	// 전체, 제목, 작성자
	if($("#qna_box #level3").val() == ""){
		$("#qnatitle").val($("#search").val());
		
	}else if($("#qna_box #level3").val() == "제목"){
		$("#qnatitle").val($("#search").val());
		
	}else if($("#qna_box #level3").val() == "작성자"){
		$("#qnauser").val($("#search").val());
	}
	
	Qmake();
});

//화면 구성
function makeDisplay(e) {
	if ($(e.target).text().trim() == "<") {
		$("#all_box #pageche").val(Number($("#all_box #pageche").val()) - 1);
	} else if ($(e.target).text() == ">") {
		$("#all_box #pageche").val(Number($("#all_box #pageche").val()) + 1);
	} else {
		$("#all_box #pageche").val($(e.target).text());
	}
	make();
}

//화면 구성
function QmakeDisplay(e) {
	if ($(e.target).text().trim() == "<") {
		$("#qna_box #qnapage").val(Number($("#qna_box #qnapage").val()) - 1);
	} else if ($(e.target).text() == ">") {
		$("#qna_box #qnapage").val(Number($("#qna_box #qnapage").val()) + 1);
	} else {
		$("#qna_box #qnapage").val($(e.target).text());
	}
	Qmake();
}

//내용 변경
function make(){
	let count = 0;
	$.ajax({
		url: "/faqCount.do",
		method: "GET",
		dataType: "JSON",
		async: false,
		data:{
			page: Number($("#all_box #pageche").val()),
			bigsort: $("#all_box #bigsortche").val(),
			smallsort: $("#all_box #smallsortche").val(),
		},
		success: function(re){
			console.log("countRE", re);
			count = re;
			
//			count =  count - ($("#all_box #pageche").val()); 
			count = 1 + ($("#all_box #pageche").val() - 1) * 5;
//			console.log(($("#all_box #pageche").val()));
			console.log("count" + count);
			
			let pa = "";
			if(Number($("#all_box #pageche").val()) > 1){
				pa += `<li class="page-item"> <a class="page-link">< </a></li>`;
			}
			
			if(re % 5 == 0){
				re--;
			}
			console.log(Number($("#all_box #pageche").val()), re / 5 + 1);
			
			if(Number($("#all_box #pageche").val()) > re / 5 + 1){
				$("#all_box #pageche").val(Number($("#all_box #pageche").val()) - 1);
			}
			
			let page = Number($("#all_box #pageche").val());
			let startpage = 0;
			let endpage = 0;
			
			if(page < 3){
				startpage = 1;
			}else{
				startpage = page - 2;
			}
			
			if(page + 2 > re / 5 + 1){
				endpage = re / 5 + 1;
			}else{
				endpage = page + 2;
			}
			
			for(let i = startpage; i <= endpage; i++){
				if (Number($("#all_box #pageche").val()) != i){
					pa += `<li class="page-item"><a class="page-link" href="#">${i} </a></li>`;
				}
				if(Number($("#all_box #pageche").val()) == i){
					pa += `<li class="page-item active" aria-current="page"><a href="#" class="page-link">${i}</a></li>`;
				}
			}
			if(Number($("#all_box #pageche").val()) < re / 5){
				pa += `<li class="page-item"><a class="page-link" href="#">></a></li>`;
			}
			$("#all_box .pagination").html(pa);
		}
	});
	$.ajax({
		url: "/faqList.do",
		method: "GET",
		dataType: "JSON",
		async: false,
		data:{
			page: Number($("#all_box #pageche").val()),
			bigsort: $("#all_box #bigsortche").val(),
			smallsort: $("#all_box #smallsortche").val(),
		},
		success: function(re){
			console.log("listRE", re);
			let con="";
			re.map((faq) => {
				console.log("파일나와" , faq.faq_fileName);
				console.log("파일나와124" , faq.faq_file);
		//		console.log("번호" , faq);
		//		console.log("번호12345" , faq.faq_seq);
				con += 
					`
						<div class="row" id="table_payment_content">
				            <div class="col-4" >${count }
				            <input type="hidden" id="seqche" value="${faq.faq_seq}"/>
				            </div>
				                        
				            <div class="col-8 switch1">
				              <a href="#" id="faqtitle">${faq.faq_ask }</a>
				            </div>
				          </div>
				          
				          <div class="row hide faqalt" id="table_payment_content">
				          <div class="content">
				            <div class="col" id="faqanswer">`
					
					if(faq.faq_fileName){
						con += `<img src="${faq.faq_fileName}" id="img" />`
					}
					con += `
				            	${faq.faq_answer }
				            </div>
				          </div>
				          </div>				
					`;
				count++;
			});
//			console.log($("#all_box tbody").html(con));
			$("#all_box #FAAQ").html(con);
		}
	});
}

//내용 변경
function Qmake(){
	let count = 0;
	$.ajax({
		url: "/qnaCount.do",
		method: "GET",
		dataType: "JSON",
		async: false,
		data:{
			page: Number($("#qna_box #qnapage").val()),
			title: $("#qna_box #qnatitle").val(),
			user: $("#qna_box #qnauser").val(),
		},
		success: function(re){
			console.log("countRE", re);
			count = re;
			
//			count =  count - ($("#all_box #pageche").val()); 
			count = 1 + ($("#qna_box #qnapage").val() - 1) * 5;
//			console.log(($("#all_box #pageche").val()));
			console.log("count" + count);
			
			let pa = "";
			if(Number($("#qna_box #qnapage").val()) > 1){
				pa += `<li class="page-item"> <a class="page-link">< </a></li>`;
			}
			
			if(re % 5 == 0){
				re--;
			}
			console.log(Number($("#qna_box #qnapage").val()), re / 5 + 1);
			
			if(Number($("#qna_box #qnapage").val()) > re / 5 + 1){
				$("#qna_box #qnapage").val(Number($("#qna_box #qnapage").val()) - 1);
			}
			
			let page = Number($("#qna_box #qnapage").val());
			let startpage = 0;
			let endpage = 0;
			
			if(page < 3){
				startpage = 1;
			}else{
				startpage = page - 2;
			}
			
			if(page + 2 > re / 5 + 1){
				endpage = re / 5 + 1;
			}else{
				endpage = page + 2;
			}
			
			for(let i = startpage; i <= endpage; i++){
				if (Number($("#qna_box #qnapage").val()) != i){
					pa += `<li class="page-item"><a class="page-link">${i} </a></li>`;
				}
				if(Number($("#qna_box #qnapage").val()) == i){
					pa += `<li class="page-item active" aria-current="page"><a class="page-link">${i}</a></li>`;
				}
			}
			if(Number($("#qna_box #qnapage").val()) < re / 5){
				pa += `<li class="page-item"><a class="page-link">></a></li>`;
			}
			$("#qna_box .pagination").html(pa);
		}
	});
	$.ajax({
		url: "/qnaList.do",
		method: "GET",
		dataType: "JSON",
		async: false,
		data:{
			page: Number($("#qna_box #qnapage").val()),
			title: $("#qna_box #qnatitle").val(),
			user: $("#qna_box #qnauser").val()
		},
		success: function(re){
			console.log("listRE", re);
			let con="";
			re.map((ask) => {
				con += 
					`
						<div class="row" id="table_content2">
          
				          <div class="col-2" id="seq">
				            ${count }
				          </div>
				          
				          <div class="col-3" id="title">`
							
							if(ask.ask_status == "답변 완료" ){
						con += 
							`<a href="/csDetail.do?ask_seq=${ask.ask_seq }&seq=${count}">`
								if(ask.ask_title.length > 14){
									title = ask.ask_title.substring(0, 14); 
									con += `${title }...`
								}else{
									con += `${ask.ask_title }`
								}
							}else{
						con += 
							`
							<a href="/csDetail.do?ask_seq=${ask.ask_seq }&seq=${count}">`
							if(ask.ask_title.length > 14){
								title = ask.ask_title.substring(0, 14); 
								con += `${title }...`
							}else{
								con += `${ask.ask_title }`
							} 
							
							}
				        con +=  `
				          </a>
				          </div>
				          
				          <div class="col-2" id="user">${ask.user_id }</div>
				          <div class="col-3">
				          	${ask.ask_date }
				          </div>
				          
				          <div class="col-2">`
				        	if(ask.ask_status == "답변 완료"){
				        con += 
				        	`
				        		  <b>답변 완료</b>
				        	`
				        	}else{
				        		con += `답변 대기`
				        	}
				 con +=   `  </div>
				        </div>				
					`;
				count++;
			});
//			console.log($("#all_box tbody").html(con));
			$("#qna_box .QNNA").html(con);
		}
	});
}
