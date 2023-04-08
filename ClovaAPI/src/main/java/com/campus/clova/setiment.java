package com.campus.clova;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.FileInputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.JsonObject;

@RestController
public class setiment {
	String clientId = "";//애플리케이션 클라이언트 아이디값";
	String clientSecret = "";//애플리케이션 클라이언트 시크릿값";
	
	@GetMapping("setimentFrm")
	public ModelAndView sentimentFrm() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("Clova/clova05_sentimentFrm");
		return mav;
	}
	@PostMapping(value="sentiment")
	public Map setiment(@RequestParam("content")String content) {
		StringBuffer response = new StringBuffer();
		List<SentimentVO> senArray = new ArrayList<SentimentVO>();
		Map map = new HashMap();
		try {
			//content를 json으로 변환
			/*
			JsonObject obj = new JsonObject();
			obj.addProperty("content",content);
			String contJson = obj.toString();
			System.out.println(contJson);
			*/
			//<!-- https://mvnrepository.com/artifact/org.json/json -->
			JSONObject jobj= new JSONObject();
			jobj.put("content",content);
			String contentJson = jobj.toString();
			// System.out.println(contentJson);
			///////////////api/////////
			String apiURL = "https://naveropenapi.apigw.ntruss.com/sentiment-analysis/v1/analyze";
            URL url = new URL(apiURL);

            HttpURLConnection conn = (HttpURLConnection)url.openConnection();
            
            conn.setRequestProperty("Content-Type", "application/json");
            conn.setRequestProperty("X-NCP-APIGW-API-KEY-ID", clientId);
            conn.setRequestProperty("X-NCP-APIGW-API-KEY", clientSecret);
            conn.setRequestMethod("POST");
            conn.setUseCaches(false);
            conn.setDoOutput(true);
            conn.setDoInput(true);
            
            DataOutputStream outputStream = new DataOutputStream(conn.getOutputStream());
            //naver로 쓰기
            outputStream.write(contentJson.getBytes());
            outputStream.flush();
            // FileInputStream inputStream = new FileInputStream(voiceFile);
            
            BufferedReader br = null;
            int responseCode = conn.getResponseCode();
            if(responseCode == 200) { // 정상 호출
                br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
            } else {  // 오류 발생
                System.out.println("error!!!!!!! responseCode= " + responseCode);
                br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
            }
            String inputLine;
            if(br != null) {
                
                while ((inputLine = br.readLine()) != null) {
                    response.append(inputLine);
                }
                br.close();
                System.out.println(response.toString());
            }
            //문자열 데이터를 Json객체로 생성
            JSONObject jsonResult = new JSONObject(response.toString());
            // document 키의 값은 vo
            JSONObject document = jsonResult.getJSONObject("document");
            SentimentVO vo = new SentimentVO();
            vo.setSentiment(document.getString("sentiment"));
            JSONObject confidence = document.getJSONObject("confidence");
            vo.setNegative(confidence.getDouble("negative"));
            vo.setPositive(confidence.getDouble("positive"));
            vo.setNeutral(confidence.getDouble("neutral"));
            //sentences 키의 값은 vo -> list
            //sentences 키의값은 배열 - jsonResult
            JSONArray sentenceArray=jsonResult.getJSONArray("sentences");
            
            for (int i=0; i<sentenceArray.length();i++ ) {
            	JSONObject object= sentenceArray.getJSONObject(i);
            	SentimentVO svo= new SentimentVO();
            	svo.setContent(object.getString("content"));
            	svo.setOffset(object.getInt("offset"));
            	svo.setLength(object.getInt("length"));
            	svo.setSentiment(object.getString("sentiment"));
            	JSONObject confObj = object.getJSONObject("confidence");
            	vo.setNegative(confObj.getDouble("negative"));
            	vo.setPositive(confObj.getDouble("positive"));
            	vo.setNeutral(confObj.getDouble("neutral"));
            	senArray.add(svo);
            }
            //
            map.put("docVO", vo);
            map.put("list", sentenceArray);
        } catch (Exception e) {
            e.printStackTrace();
        }
		System.out.println( "docVO : "+map.get("docVO").toString());
		System.out.println( "list : "+map.get("list").toString());
		return map;
	}
}
