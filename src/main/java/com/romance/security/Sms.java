package com.romance.security;

import java.io.IOException;
import java.io.Reader;
import java.util.HashMap;
import java.util.Properties;

import org.apache.ibatis.io.Resources;
import org.json.simple.JSONObject;

import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

public class Sms {
      public static void sendsms(String content,String num) throws IOException, CoolsmsException{
    	  
        String resource = "config/sms.properties";
        Properties properties = new Properties();    
        Reader reader = Resources.getResourceAsReader(resource);
        properties.load(reader);
          
    	    System.out.println(content+num);
        
            
             
               String api_key = properties.getProperty("api_key"); 
               String api_secret = properties.getProperty("api_secret");
               String from=properties.getProperty("from");
               System.out.println("api="+api_key);
               System.out.println("api_secret="+api_secret);
               System.out.println("from="+from);
               Message coolsms = new Message(api_key, api_secret);
                  
                 HashMap<String, String> params = new HashMap<String, String>();
                 
                 params.put("to", num);    
                
               
                 params.put("from",from);   
                 params.put("type", "SMS");
                 params.put("text", content);
                 System.out.println(content);
                 params.put("app_version", "test app 1.2"); 
                 // application name and version

                
                   JSONObject obj = (JSONObject) coolsms.send(params);
                   System.out.println(obj.toString());
                     
          } 
         
       }
      
      
