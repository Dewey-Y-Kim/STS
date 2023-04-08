package com.campus.clova;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

@RestController
public class SearchTrend {
	
	@GetMapping("/searchTrendFrm")
	public ModelAndView searchTrendFrm() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("Clova/clova11_searchTrend");
		return mav;
	}
	@PostMapping(value="/SearchTrend",produces = "application/text;charset=UTF-8;")
	public String searchTrend(String startDate, String endDate, String timeUnit, String groupName, String[] keywords) {
		String clientId = "";//애플리케이션 클라이언트 아이디값";
        String clientSecret = "";//애플리케이션 클라이언트 시크릿값";
        StringBuffer response = new StringBuffer();
        try {
            String apiURL = "https://naveropenapi.apigw.ntruss.com/datalab/v1/search";
            // data 생성
            // String body = "{\"startDate\":"+startDate+",\"endDate\":"+endDate+",\"timeUnit\":"+timeUnit+",\"keywordGroups\":[{\"groupName\":zz,\"keywords\":[\"한글\",\"korean\"]},{\"groupName\":\"영어\",\"keywords\":[\"영어\",\"english\"]}],\"device\":\"pc\",\"ages\":[\"1\",\"2\"],\"gender\":\"f\"}";
            JSONObject json=new JSONObject();
            json.put("startDate",startDate);
            json.put("endDate", endDate);
            json.put("timeUnit", timeUnit);
            JSONArray keyWords = new JSONArray();
            for (String key:keywords) {
            	keyWords.put(key);
            }
            JSONObject group = new JSONObject();
            group.put("groupName", groupName);
            group.put("keywords", keyWords);
            
            JSONArray keywordGroups= new JSONArray();
            keywordGroups.put(group);
            json.put("keywordGroups", keywordGroups);
            String body = json.toString();
            //
            System.out.println("[Json 생성]"+body);
            URL url = new URL(apiURL);
            HttpURLConnection con = (HttpURLConnection)url.openConnection();
            con.setRequestMethod("POST");
            con.setRequestProperty("X-NCP-APIGW-API-KEY-ID", clientId);
            con.setRequestProperty("X-NCP-APIGW-API-KEY", clientSecret);
            con.setRequestProperty("Content-Type", "application/json");

            con.setDoOutput(true);
            DataOutputStream wr = new DataOutputStream(con.getOutputStream());
            wr.write(body.getBytes());
            wr.flush();
            wr.close();

            int responseCode = con.getResponseCode();
            BufferedReader br;
            if(responseCode==200) { // 정상 호출
                br = new BufferedReader(new InputStreamReader(con.getInputStream()));
            } else {  // 오류 발생
                br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
            }

            String inputLine;
            
            while ((inputLine = br.readLine()) != null) {
                response.append(inputLine);
            }
            br.close();
            System.out.println(response.toString());

        } catch (Exception e) {
            System.out.println(e);
        }
        return response.toString();
	}
}
