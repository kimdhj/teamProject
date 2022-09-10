package com.romance.security;

import java.util.HashMap;

import org.json.simple.JSONObject;

import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

public class Sms {
      public static void sendsms(String content,String num){
    	  
          
          
    	    System.out.println(content+num);
        
             System.out.println("�Գ�?");
             
               String api_key = "NCSOWAP57H9Z853F"; 
               String api_secret = "HSUEM8HZEFMZXTF3JCVFLMUREJNJFNRV"; 
               Message coolsms = new Message(api_key, api_secret);
                  
                 HashMap<String, String> params = new HashMap<String, String>();
                 
                 params.put("to", num);    
                
                 params.put("from", "01035739617");   
                 params.put("type", "SMS");
                 params.put("text", content);
                 System.out.println(content);
                 params.put("app_version", "test app 1.2"); 
                 // application name and version

                 try {
                   JSONObject obj = (JSONObject) coolsms.send(params);
                   System.out.println(obj.toString());
                 } catch (CoolsmsException e) {
                   System.out.println(e.getMessage());
                   System.out.println(e.getCode());
                 }      
          } 
         
       }
      
      
