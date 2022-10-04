package com.romance.admin.log;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class LoginLogExcel {
	
	@Autowired
	private LogService logService;
	
	@GetMapping("/loginLogExcelDownload.mdo")
	public void loginLogExcelDownload(HttpServletResponse response, Criteria criteria) throws Exception {
		
		
		//엑셀에 들어갈 데이터 DB와 연동해서 가져온다.
		List<LoginLogVO> loginLogList = new ArrayList<>();
		loginLogList = logService.getLoginLogExcel(criteria);
				
		//Workbook 생성
		Workbook workbook = new XSSFWorkbook();
		//Sheet 생성
		Sheet sheet = workbook.createSheet("로그인 로그");
		
		//셀 스타일 지정
		CellStyle styleDate = workbook.createCellStyle(); //셀 스타일 생성
		styleDate.setDataFormat(workbook.createDataFormat().getFormat("yyyy-mm-dd HH:mm:ss"));
		
		//데이터 저장
		int rowNum = 0;
		Row headerRow = sheet.createRow(rowNum);
		headerRow.createCell(0).setCellValue("번호");
		headerRow.createCell(1).setCellValue("ID");
		headerRow.createCell(2).setCellValue("결과");
		headerRow.createCell(3).setCellValue("접속주소");
		headerRow.createCell(4).setCellValue("접속IP");
		headerRow.createCell(5).setCellValue("Browser");
		headerRow.createCell(6).setCellValue("접속일");
		rowNum++;
		
		for(LoginLogVO list : loginLogList) {
			Row row = sheet.createRow(rowNum);
			row.createCell(0).setCellValue(list.getLogin_log_seq());
			row.createCell(1).setCellValue(list.getLogin_log_id());
			row.createCell(2).setCellValue(list.getLogin_log_success());
			row.createCell(3).setCellValue(list.getLogin_log_url());
			row.createCell(4).setCellValue(list.getLogin_log_ip());
			row.createCell(5).setCellValue(list.getLogin_log_browser());
			row.createCell(6).setCellValue(list.getLogin_log_day());
			row.getCell(6).setCellStyle(styleDate);//날짜형식으로 변경
			System.out.println(row);
			rowNum++;
			
		}
		
		//엑셀을 파일로 생성한다
		response.setContentType("ms-vnd/excel");
		response.setHeader("Content-Disposition", "attachment;filename=loginLog.xls");
		
		workbook.write(response.getOutputStream());
		workbook.close();
	}
}
