$(document).ready(function () {
  $("#pdf").click(function () {
    // pdf저장 button id

    html2canvas($("#table_box")[0]).then(function (canvas) {
      //저장 영역 div id

      // 캔버스를 이미지로 변환
      var imgData = canvas.toDataURL("image/png");

      var imgWidth = 190; // 이미지 가로 길이(mm) / A4 기준 210mm
      var pageHeight = imgWidth * 1.414; // 출력 페이지 세로 길이 계산 A4 기준
      var imgHeight = (canvas.height * imgWidth) / canvas.width;
      var heightLeft = imgHeight;
      var margin = 10; // 출력 페이지 여백설정
      var doc = new jsPDF("p", "mm");
      var position = 0;

      // 첫 페이지 출력
      doc.addImage(imgData, "PNG", margin, position, imgWidth, imgHeight);
      heightLeft -= pageHeight;

      // 한 페이지 이상일 경우 루프 돌면서 출력
      while (heightLeft >= 20) {
        position = heightLeft - imgHeight;
        doc.addPage();
        doc.addImage(imgData, "PNG", margin, position, imgWidth, imgHeight);
        heightLeft -= pageHeight;
      }

      // 파일 저장
      doc.save("file-name.pdf");
    });
  });
});
function s2ab(s) {
  var buf = new ArrayBuffer(s.length); //convert s to arrayBuffer
  var view = new Uint8Array(buf); //create uint8array as viewer
  for (var i = 0; i < s.length; i++) view[i] = s.charCodeAt(i) & 0xff; //convert to octet
  return buf;
}

function exportExcel() {
  // step 1. workbook 생성
  var wb = XLSX.utils.book_new();

  // step 2. 시트 만들기
  var newWorksheet = excelHandler.getWorksheet();

  // step 3. workbook에 새로만든 워크시트에 이름을 주고 붙인다.
  XLSX.utils.book_append_sheet(wb, newWorksheet, excelHandler.getSheetName());

  // step 4. 엑셀 파일 만들기
  var wbout = XLSX.write(wb, { bookType: "xlsx", type: "binary" });

  // step 5. 엑셀 파일 내보내기
  saveAs(
    new Blob([s2ab(wbout)], { type: "application/octet-stream" }),
    excelHandler.getExcelFileName()
  );
}
$(document).ready(function () {
  $("#excel").click(function () {
    exportExcel();
  });
});
var excelHandler = {
  getExcelFileName: function () {
    return "table-test.xlsx";
  },
  getSheetName: function () {
    return "Table Test Sheet";
  },
  getExcelData: function () {
    return document.getElementById("table");
  },
  getWorksheet: function () {
    return XLSX.utils.table_to_sheet(this.getExcelData());
  },
};
