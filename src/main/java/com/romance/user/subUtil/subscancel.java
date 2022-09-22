package com.romance.user.subUtil;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.Reader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Properties;

import org.apache.ibatis.io.Resources;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

public class subscancel {
	public String getToken() throws Exception {

		// requestURL �������� 怨�����, ���щ┸ �� ��蹂대�� �ы�⑦���� url ��蹂�
		JSONObject json = new JSONObject();
	  String resource = "config/import.properties";
    Properties properties = new Properties();    
    Reader reader = Resources.getResourceAsReader(resource);
    properties.load(reader);
    String imp_key = properties.getProperty("impkey");
    String imp_secret = properties.getProperty("secretkey");
    json.put("imp_key",imp_key);//�����댁��� ���ㅻ�� resetapi
    json.put("imp_secret",imp_secret);//����爰� 諛�濡�諛������� secretkey

		String _token = "";
		String requestString = "";
		

			
			requestString = "";
			URL url = new URL("https://api.iamport.kr/users/getToken/");

			HttpURLConnection connection = (HttpURLConnection) url.openConnection();

			connection.setDoOutput(true);

			connection.setInstanceFollowRedirects(false);

			connection.setRequestMethod("POST");

			connection.setRequestProperty("Content-Type", "application/json");

			OutputStream os = connection.getOutputStream();

			os.write(json.toString().getBytes());

			connection.connect();

			StringBuilder sb = new StringBuilder();

			if (connection.getResponseCode() == HttpURLConnection.HTTP_OK) {

				BufferedReader br = new BufferedReader(new InputStreamReader(connection.getInputStream(), "utf-8"));

				String line = null;

				while ((line = br.readLine()) != null) {

					sb.append(line + "\n");

				}

				br.close();

				requestString = sb.toString();

			}

			os.flush();

			connection.disconnect();

			
			  JSONParser jsonParser = new JSONParser();
			 
			  JSONObject jsonObj = (JSONObject) jsonParser.parse(requestString);
			 
			
			 if ((Long) jsonObj.get("code") == 0) {
			  
			  JSONObject getToken = (JSONObject) jsonObj.get("response");
			  
			  System.out.println("getToken==>>" + getToken.get("access_token"));
			  
			  _token = (String) getToken.get("access_token");
			  
			  }
			 

		
		
		return _token;

	}
	public JSONObject subcancel(String cuid) throws Exception {
	  String acckey=getToken();
	  System.out.println("key"+acckey);
		System.out.println("cuid"+cuid);
		// requestURL 아임퐅크 고유키, 시크릿 키 정보를 포함하는 url 정보
		JSONObject json = new JSONObject();
	
		json.put("customer_uid",cuid);//결제 완료시 나오는 imp_uid
		

		JSONArray jarr=new JSONArray();
		JSONObject json1 = new JSONObject();
	
	
		jarr.add(json1); 
		
		json.put("schedules", jarr);//환불금액

		String _token = "";
String requestString=null;
		
			requestString = "";

			URL url = new URL("https://api.iamport.kr//subscribe/payments/unschedule");

			HttpURLConnection connection = (HttpURLConnection) url.openConnection();

			connection.setDoOutput(true);//바디에 파라미터 작성 하게 하는 코드

			connection.setInstanceFollowRedirects(false);

			connection.setRequestMethod("POST");

			connection.setRequestProperty("Content-Type", "application/json");
			connection.setRequestProperty("Authorization", acckey);//토근값
			connection.setDoOutput(true);
			try (OutputStream os = connection.getOutputStream()){
				byte request_data[] = json.toString().getBytes("utf-8");
				os.write(request_data);
				os.close();
			}
			catch(Exception e) {
				e.printStackTrace();
			}	
			

			

			connection.connect();

			StringBuilder sb = new StringBuilder();

			if (connection.getResponseCode() == HttpURLConnection.HTTP_OK) {

				BufferedReader br = new BufferedReader(new InputStreamReader(connection.getInputStream(), "utf-8"));

				String line = null;

				while ((line = br.readLine()) != null) {

					sb.append(line + "\n");

				}

				br.close();

				requestString = sb.toString();

			}

		

			connection.disconnect();

			JSONParser jsonParser = new JSONParser();

			JSONObject jsonObj = (JSONObject) jsonParser.parse(requestString);
			System.out.println(jsonObj);
			
		return jsonObj;

	}
}
