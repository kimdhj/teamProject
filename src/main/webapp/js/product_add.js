$(document).ready(function(){
  // 상품 등록 유효성검사
  $("#addBtn").click(function(){
      var productName = $("#productName").val();
      var productPrice = $("#productPrice").val();
      var productDesc = $("#productDesc").val();
      var productPhoto = $("#productPhoto").val();

      if(productName == "") {
          alert("상품명을 입력해주세요");
          productName.foucs();
      } else if (productPrice == "") {
          alert("상품 가격을 입력해주세요");
          productPrice.focus();
      } else if (productDesc == "") {
          alert("상품 설명을 입력해주세요");
          productDesc.focus();
      } else if (productPhoto == "") {
          alert("상품 사진을 입력해주세요");
          productPhoto.focus();
      }
      // 상품 정보 전송
      document.form1.action = "${path}/shop/product/insert.do";
      document.form1.submit();
  });
  // 상품 목록이동
  $("#listBtn").click(function(){
      location.href='${path}/shop/product/list.do';
  });
});