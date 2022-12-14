package com.romance.server;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.Reader;
import java.util.Properties;

import org.apache.ibatis.io.Resources;

import com.amazonaws.AmazonServiceException;
import com.amazonaws.SdkClientException;
import com.amazonaws.auth.AWSCredentials;
import com.amazonaws.auth.AWSStaticCredentialsProvider;
import com.amazonaws.auth.BasicAWSCredentials;
import com.amazonaws.regions.Regions;
import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.AmazonS3ClientBuilder;
import com.amazonaws.services.s3.model.CopyObjectRequest;
import com.amazonaws.services.s3.model.DeleteObjectRequest;
import com.amazonaws.services.s3.model.ObjectMetadata;
import com.amazonaws.services.s3.model.PutObjectRequest;

public class AwsS3 {
  private AmazonS3 s3Client;
  private String accessKey;
  private String secretKey;
  
  private Regions clientRegion = Regions.AP_NORTHEAST_2;
  private String bucket;
  
  private AwsS3() throws FileNotFoundException, IOException {
    String resource = "config/AWS.properties";
    Properties properties = new Properties();    
    Reader reader = Resources.getResourceAsReader(resource);
    properties.load(reader);
    accessKey = properties.getProperty("accessKey");
    secretKey = properties.getProperty("secretKey");
    bucket = properties.getProperty("bucket");
    createS3Client();
  }
  
  static private AwsS3 instance = null;
  
  public static AwsS3 getInstance() throws FileNotFoundException, IOException {
    if (instance == null) {
      return new AwsS3();
    } else {
      return instance;
    }
  }
  
  private void createS3Client() {
    AWSCredentials credentials = new BasicAWSCredentials(accessKey, secretKey);
    this.s3Client = AmazonS3ClientBuilder.standard().withCredentials(new AWSStaticCredentialsProvider(credentials)).withRegion(clientRegion).build();
  }
  
  public void upload(File file, String key) {
    uploadToS3(new PutObjectRequest(this.bucket, key, file));
  }
  
  public void upload(InputStream is, String key, String contentType, long contentnLength) {
    ObjectMetadata objectMetadata = new ObjectMetadata();
    objectMetadata.setContentType(contentType);
    objectMetadata.setContentLength(contentnLength);
    uploadToS3(new PutObjectRequest(this.bucket, key, is, objectMetadata));
  }
  
  private void uploadToS3(PutObjectRequest putObjectRequest) {
    try {
      this.s3Client.putObject(putObjectRequest);
      System.out.println("putObjectRequest" + putObjectRequest.toString());
      System.out.println(String.format("[%s] upload complete", putObjectRequest.getKey()));
    } catch (AmazonServiceException e) {
      e.printStackTrace();
    } catch (SdkClientException e) {
      e.printStackTrace();
    } catch (Exception e) {
      e.printStackTrace();
    }
  }
  
  public void copy(String orgKey, String copyKey) {
    try {
      CopyObjectRequest copyObjeRequest = new CopyObjectRequest(this.bucket, orgKey, this.bucket, copyKey);
      this.s3Client.copyObject(copyObjeRequest);
      System.out.println(String.format("finish copying [%s] to [%s]", orgKey, copyKey));
    } catch (AmazonServiceException e) {
      e.printStackTrace();
    } catch (SdkClientException e) {
      e.printStackTrace();
    }
  }
  
  public void delete(String key) {
    try {
      DeleteObjectRequest deleteObjectRequest = new DeleteObjectRequest(this.bucket, key);
      this.s3Client.deleteObject(deleteObjectRequest);
      System.out.println(String.format("[%s] deletion complete", key));
    } catch (AmazonServiceException e) {
      e.printStackTrace();
    } catch (SdkClientException e) {
      e.printStackTrace();
    }
  }
  
  // ?????? ?????????
  // String upoladFolder = "https://doublejo.s3.ap-northeast-2.amazonaws.com/";
  // String filename=mainUploadFile.getOriginalFilename();
  // String expand=filename.substring(filename.indexOf("."));
  // String key=UUID.randomUUID().toString()+expand;
  // System.out.println(key+" :key"); // key="/?????????/"+key; ?????? ?????? ?????? ?????????
  // InputStream is = mainUploadFile.getInputStream();
  // String contentType = mainUploadFile.getContentType();
  // long contentLength = mainUploadFile.getSize();
  // AwsS3 awsS3 = AwsS3.getInstance();
  // awsS3.upload(is, key, contentType, contentLength);
  // ?????? ??????
  // awsS3.delete(key); //key??? ?????????
}
