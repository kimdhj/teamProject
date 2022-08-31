package com.romance.socket;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLEncoder;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

public class HttpUtil {
	public static String callApi(String search, String country, String category, int maxResults, int start)
			throws UnsupportedEncodingException {
		search = URLEncoder.encode(search, "UTF-8");

		URL url = null;
		String readLine = null;
		StringBuilder buffer = null;
		OutputStream outputStream = null;
		BufferedReader bufferedReader = null;
		BufferedWriter bufferedWriter = null;
		HttpURLConnection urlConnection = null;

		int connTimeout = 5000;
		int readTimeout = 3000;
		String apikey = "S2JyKGPNI18HDfxe7lTxEg==";
		String Inapikey = "51618F655CD09159A6844BD65A8B6F104E492CC6455C3F0DD667626EA7D32750";
		String sendData = "보낼 데이터"; // 대다수의 경우 JSON 데이터 사용
		// String apiUrl =
		// "https://www.dlibrary.go.kr/openapi/call.do?dist_key="+apikey+"&func_id=3&sw="+type+"&sf="+center+"&cntPerPage=10";
		// // 국가
		String apiUrl = "http://book.interpark.com/api/search.api?key=" + Inapikey + "&query=" + search + "&categoryId="
				+ category + "&output=json&searchTarget=" + country + "&maxResults=" + maxResults + "&start=" + start; // 인터파크
		// 상황에
		System.out.println(apiUrl); // 맞는
		// IP
		// &
		// url
		// 사용

		try {
			url = new URL(apiUrl);

			urlConnection = (HttpURLConnection) url.openConnection();
			urlConnection.setRequestMethod("POST");
			urlConnection.setConnectTimeout(connTimeout);
			urlConnection.setReadTimeout(readTimeout);
			urlConnection.setRequestProperty("Content-Type", "application/json;");
			urlConnection.setDoOutput(true);
			urlConnection.setInstanceFollowRedirects(true);

			outputStream = urlConnection.getOutputStream();

			bufferedWriter = new BufferedWriter(new OutputStreamWriter(outputStream, "UTF-8"));
			bufferedWriter.write(sendData);
			bufferedWriter.flush();

			buffer = new StringBuilder();
			if (urlConnection.getResponseCode() == HttpURLConnection.HTTP_OK) {
				bufferedReader = new BufferedReader(new InputStreamReader(urlConnection.getInputStream(), "UTF-8"));
				while ((readLine = bufferedReader.readLine()) != null) {
					buffer.append(readLine).append("\n");
				}
			} else {
				buffer.append("\"code\" : \"" + urlConnection.getResponseCode() + "\"");
				buffer.append(", \"message\" : \"" + urlConnection.getResponseMessage() + "\"");
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			try {
				if (bufferedWriter != null) {
					bufferedWriter.close();
				}
				if (outputStream != null) {
					outputStream.close();
				}
				if (bufferedReader != null) {
					bufferedReader.close();
				}
			} catch (Exception ex) {
				ex.printStackTrace();
			}
		}

		System.out.println("결과 : " + buffer.toString());
		return buffer.toString();
	}
}
