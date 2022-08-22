<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html lang="en">

    <head>
        <!-- Common head include -->
        <jsp:include page="/commonjsp/common_head.jsp"></jsp:include>
        <link href="/css/my_AddReadCancel.css" rel="stylesheet">

    </head>

    <body>
        <!-- Common header include -->
        <jsp:include page="/commonjsp/common_header.jsp"></jsp:include>
        <!-- Common header include End -->

        <jsp:include page="/commonjsp/common_mypage_header.jsp"></jsp:include>

        <!-- 여기 삽입 -->

        <div id="main_wrapper" class="row">
            <div class="col">
                <div id="top_info" class="row">
                    <div id="img_box" class="col-2">
                        <img src="/서점로고.ico" width="100%" height="100%" alt="" id="item_img" />
                    </div>
                    <div class="col" id="text">
                        <div class="row" id="title">
                            <div id="item_title" class="col-4 ">구독상품 이름</div>

                        </div>
                        <div class="row" id="subtitle">월 결제 금액:20000원</div>
                        <div class="row" id="itemtText">
                            상품소개상품소개상품소개상품소개상품소개상품소개상품소개상품소개상품소개상품소개상품소개상품소개상품소개상품소개상품소개상품소개상품소개상품소개상품소개상품소개상품소개상품소개상품소개상품소개상품소개
                        </div>
                    </div>
                    <div class="col-2"></div>
                </div>
                <div id="personal_info" class="row">
                    <div class="align-items-center" id="months">
                        <div id="months_name">이승재님</div>
                        <div id="months_count">10</div>
                        <div id="months_etc">개월 째 이용 중 입니다.</div>
                    </div>
                    <div class="align-items-center" id="money">
                        <div id="money_title">지금 까지 결제 금액:</div>
                        <div  id="money_count">20000 원</div>

                    </div>
                    <div class="align-items-center" id="nowBook">
                        <div id="nowBook_title">현재 대여책:</div>
                        <div id="nowBook_content">오늘도 놀고 싶다</div>
                    </div>
                   
                    <div class="align-items-center" id="selectType">
                        <div id="selectType_title">선택된 장르:</div>
                        <div id="selectType_content">무협,소설,로맨스</div>
                    </div>
                </div>
                <div id="cancel_box" class="row gy-4">
                    <div id="cancelText" class="row">
                        이승재 님 정말 구독 취소 하시겠습니까?
                    </div>
                    <div id="canceInput">
                        <div id="inputText"> 비밀 번호:</div>
                        <div id="inputBox">
                            <div class="input-group mb-3">
                                <input type="text" class="form-control" placeholder="Recipient's username"
                                    aria-label="Recipient's username" aria-describedby="basic-addon2">
                                <span class="input-group-text" id="basic-addon2">취소 하기</span>
                            </div>
                        </div>
                    </div>
                </div>

            </div>

        </div>
        <jsp:include page="/commonjsp/common_mypage_bottom.jsp"></jsp:include>

        <!-- Footer Start -->
        <!-- Common Footer include -->
        <jsp:include page="/commonjsp/common_footer.jsp"></jsp:include>

        <!-- Footer End -->

    </body>

    </html>