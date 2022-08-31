/**
 * 
 */
 $(document).ready(function () {
      $('#cre_btn').click(function () {
        const arr = ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z', '1', '2', '3', '4', '5', '6', '7', '8', '9', '0'];
        let count = Number($('#Coupon_count').val());
        if (count == 0) {
          count = 1;
        }
        for (let j = 0; j < count; j++) {
          let sum = "";
          for (let i = 1; i <= 16; i++) {
            sum += arr[parseInt(Math.random() * 35 + 1)];
            if (i % 4 == 0 && i != 16) {
              sum += '-';
            }
          }
          // 데이터베이스 등록 코드 시작
          console.log(sum);
        }
      });
    })