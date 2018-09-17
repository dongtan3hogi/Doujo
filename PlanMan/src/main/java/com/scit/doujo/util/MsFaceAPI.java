package com.scit.doujo.util;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.net.URI;

import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.client.utils.URIBuilder;
import org.apache.http.entity.ByteArrayEntity;
import org.apache.http.entity.ContentType;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.util.EntityUtils;
import org.json.JSONArray;
import org.json.JSONObject;


public class MsFaceAPI {
	// **********************************************
    // *** Update or verify the following values. ***
    // **********************************************

    // Replace the subscriptionKey string value with your valid subscription key.
    public static final String subscriptionKey = "da7e986b48044aa3a8eecae02121df33";

    // Replace or verify the region.
    //
    // You must use the same region in your REST API call as you used to obtain your subscription keys.
    // For example, if you obtained your subscription keys from the westus region, replace
    // "westcentralus" in the URI below with "westus".
    //
    // NOTE: Free trial subscription keys are generated in the westcentralus region, so if you are using
    // a free trial subscription key, you should not need to change this region.
    public static final String uriBase = "https://westcentralus.api.cognitive.microsoft.com/face/v1.0/detect";
    
    public String getImgInfo(File path){
    @SuppressWarnings("deprecation")
	HttpClient httpclient = new DefaultHttpClient();
    FileInputStream fileInputStreamReader= null;
        try
        {
            URIBuilder builder = new URIBuilder(uriBase);

            // Request parameters. All of them are optional.
            builder.setParameter("returnFaceId", "true");
            builder.setParameter("returnFaceLandmarks", "false");
            builder.setParameter("returnFaceAttributes", "age,gender,headPose,smile,facialHair,glasses,emotion,hair,makeup,occlusion,accessories,blur,exposure,noise");

            // Prepare the URI for the REST API call.
            URI uri = builder.build();
            HttpPost request = new HttpPost(uri);

            // Request headers.
            request.setHeader("Content-Type", "application/octet-stream");
            request.setHeader("Ocp-Apim-Subscription-Key", subscriptionKey);
            // Request body.
            fileInputStreamReader= new FileInputStream(path);
            byte[] bytes = new byte[(int)path.length()];
            fileInputStreamReader.read(bytes);            
            ByteArrayEntity reqEntity = new ByteArrayEntity(bytes, ContentType.APPLICATION_OCTET_STREAM);
            request.setEntity(reqEntity);//사용 가능한 url 확인하기 
           
            // Execute the REST API call and get the response entity.
            HttpResponse response = httpclient.execute(request);
            HttpEntity entity = response.getEntity();

            if (entity != null)
            {
                // Format and display the JSON response.
                System.out.println("REST Response:\n");
                
                String jsonString = EntityUtils.toString(entity).trim();
                if (jsonString.charAt(0) == '[') {//0부터 시작하는데 [가 0이기에 0빼고 다음부터 시작
                    JSONArray jsonArray = new JSONArray(jsonString);
                    return jsonArray.toString(2);
                }
                else if (jsonString.charAt(0) == '{') {
                    JSONObject jsonObject = new JSONObject(jsonString);
                    return jsonObject.toString(2);
                } else {
                    return jsonString; // 여기가 콘솔 출력부분입니다. 바로 파라메터
                }
            }
        }
        catch (Exception e)
        {
            System.out.println(e.getMessage());
        }finally {
        	 try {
				fileInputStreamReader.close();
				
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
        }
		return null;
    }
}
