<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Foody - Organic Food Website Template</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">

    <!-- Favicon -->
    <link href="img/favicon.ico" rel="icon">

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;500&family=Lora:wght@600;700&display=swap"
        rel="stylesheet">

    <!-- Icon Font Stylesheet -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="lib/animate/animate.min.css" rel="stylesheet">
    <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

    <!-- Customized Bootstrap Stylesheet -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="css/style.css" rel="stylesheet">
    <link href="./css/test.css" rel="stylesheet">

    <!-- Making Stylesheet-->
    <link href="css/product_list.css" rel="stylesheet">
</head>

<body>
    <!-- Common header include -->
    <jsp:include page="commonjsp/common_header.jsp"></jsp:include>
    <!-- Common header include End -->

    <!-- Page Header Start -->
    <!-- 아래 텍스트는 수정가능 My page, Home, Pages, Contact Us 는 각 페이지마다 다를 수 있으므로-->
    <div class="container-fluid page-header wow fadeIn" data-wow-delay="0.1s">
        <div class="container">
            <h1 class="display-3 mb-3 animated slideInDown">상품 추가 페이지</h1>

        </div>
    </div>
    <!-- Page Header End -->

    <!-- 여기서부터 바디 작업 하면됨 -->

    <!-- 수정가능 테이블 -->
      <div id="product_add">
        <form id="form1" name="form1" enctype="multipart/form-data" method="post">
            <table border="1">
                <tr>
                    <td>상품ID</td>
                    <td><input type="text" name="product_Id" id="product_Id"></td>
                </tr>
                <tr>
                    <td>장르</td>
                    <td><select>
                        <option>시/에세이</option>
                        <option>국내 소설</option>
                        <option>해외 소설</option>
                        <option>무협</option>
                    </td>
                </tr>
                <tr>
                    <td>상품명</td>
                    <td><input type="text" name="product_Name" id="product_Name"></td>
                </tr>
                <tr>
                    <td>가격</td>
                    <td><input type="number" name="product_Price" id="product_Price"></td>
                </tr>
                <tr>
                      <td>작가</td>
                      <td><input type="text" name="product_Publisher" id="product_Publisher"></td>
                </tr>
                <tr>
                    <td>작가ID</td>
                    <td><input type="text" name="product_PubId" id="product_PubId"></td>
                </tr>
                <tr>
                      <td>출판사</td>
                      <td><input type="text" name="product_Com" id="product_Com"></td>
                </tr>
                <tr>
                    <td>상품이미지</td>
                    <td><input type="file" name="product_Img" id="product_Img"></td>
                </tr>
                <tr>
                    <td>상품설명</td>
                    <td><textarea rows="5" cols="60" name="product_Desc" id="product_Desc"></textarea></td>
                </tr>
                <tr>
                    <td>출판일자</td>
                    <td><input type="date" name="product_PubDate" id="product_PubDate"></td>
                </tr>
                <tr>
                  <td>재고</td>
                  <td>
                    <button type ="button" onclick="fnCalCount('m',this);">-</button>
                    <input type="number" name="product_Num" value="0" readonly="readonly" style="text-align:center;"/>
                    <button type="button" onclick="fnCalCount('p', this);">+</button>
                </td>
                </tr>
                <tr>
                    <td>ISBN</td>
                       <td><input name="product_Isbn" type="text" size="40" /></td></td>
                <tr>
                    <td colspan="2" align="center">
                        <input type="button" value="등록" id="addBtn">
                        <input type="button" value="목록" id="listBtn" onclick="location.href='product_list.html'">
                    </td>
                </tr>
            </table>
        </form>
    </div>
    <!-- 수정가능 테이블 끝 -->

    <!-- Footer Start -->
    <!-- Common Footer include -->


    <!-- Footer End -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="lib/wow/wow.min.js"></script>
    <!-- Template Javascript -->
    <script src="js/main.js"></script>
    <script src="js/product_add.js"></script>
    <!-- 동적테이블 js -->
    <script>
        function tableCreate() {
            var html = '';

            var name = $("#inName").val();
            var job = $("#inJob").val();
            var birth = $("#inBirth").val();
            var remove = $("remove").val();

            html += '<tr>';
            html += '<td>' + name + '</td>';
            html += '<td>' + job + '</td>';
            html += '<td>' + birth + '</td>'
            html += '<td>' + birth + '</td>';
            html += '<td>' + birth + '</td>';

            html += '<td><button onclick="tableDelete(this)" id="remove">remove</button></td>';
            html += '</tr>';

            $("#dynamicTable").append(html);

            $("#inName").val('');
            $("#inJob").val('');
            $("#inBirth").val('');
        }

        function tableDelete(obj) {
            var tr = $(obj).parent().parent();

            tr.remove();
        }
    </script>
    <!-- 동적테이블 js 끝 -->

    <!-- 테이블 내부 값 수정 input타입 -->
    <script>
        // @breif contenteditable 속성을 가진경우
        contents = document.getElementsByClassName("rowColumn");
        document.addEventListener("DOMContentLoaded", function () {

            // @breif rowColumn 클래스의 갯수 만큼 반복문을 실행한다.
            Array.from(contents).forEach(function (content) {

                // @breif 마우스로 해당영역을 더블클릭 한경우
                content.addEventListener("dblclick", function (event) {

                    // @breif 전체 테이블 컬럼( td > p )에서 현재 사용중인 값의 존재여부를 확인한다.
                    Array.from(contents).forEach(function (defaultVal) {

                        // @details 빈값( null )이 존재하는지 체크한다.
                        /* if(
                               defaultVal.textContent == ""
                            || defaultVal.textContent == null
                            || defaultVal.textContent == undefined
                            || (defaultVal.textContent != null
                            && typeof defaultVal.textContent == "object"
                            && !Object.keys(defaultVal.textContent).length == ""))
                        {
    
                            // @details 내용이 존재하지 않다면 data 태그의 기본값으로 되돌린다.
                            defaultVal.textContent = defaultVal.dataset.default;
                        }
                         */

                        // @details 저장하지 않은 내용이라고 판단하여 data 태그의 기본값으로 되돌린다.
                        defaultVal.textContent = defaultVal.dataset.default;

                        // @breif 수정 불가 상태로 되돌린다.
                        defaultVal.contentEditable = false;
                        defaultVal.style.border = "0px";
                    });

                    if (content.isContentEditable == false) {

                        // @details 편집 가능 상태로 변경
                        content.contentEditable = true;

                        // @details 텍스트 문구 변경
                        // content.textContent = "";

                        // @details CSS 효과 추가
                        content.style.border = "1px solid #FFB6C1";

                        // @details 포커스 지정
                        content.focus();

                    }

                });



                // @breif 키보드 입력이 방생한 경우 실행
                content.addEventListener("keypress", function (event) {

                    // @breif Enter키 입력시 실행
                    if (event.key === "Enter") {

                        // @details 입력된 값이 빈값( null )인지 체크한다.
                        if (content.textContent == "" || content.textContent == null || content.textContent == undefined || (content.textContent != null && typeof content.textContent == "object" && !Object.keys(content.textContent).length == "")) {

                            // @details 내용이 존재하지 않다면 data 태그의 기본값으로 되돌린다.
                            content.textContent = content.dataset.default;

                        } else {
                            // @details 내용의 수정이 완료되었다면 data 태그의 기본값도 바꿔준다.
                            content.dataset.default = content.textContent;

                        }
                        // @breif 수정 불가 상태로 되돌린다.
                        content.contentEditable = false;
                        content.style.border = "0px";
                    }

                });

            });

        });

    </script>
</body>

</html>
</body>

</html>