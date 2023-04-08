package com.campus.clova;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.Date;

import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

@RestController
public class TTS {
	
	@GetMapping("ttsFrm")
	public ModelAndView ttsFrm() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("Clova/clova07_voice");
		return mav;
	}
	@PostMapping("voiceOk")
	public void tts(@RequestParam("speaker")String speaker,
			@RequestParam("volume") int volume, 
			@RequestParam("speed")int speed, 
			@RequestParam("pitch")int pitch,
			@RequestParam("emotion") int emotion,
			@RequestParam("text") String text,
			HttpServletResponse response) {
		String clientId = "";//애플리케이션 클라이언트 아이디값";
		String clientSecret = "";//애플리케이션 클라이언트 시크릿값";
		StringBuffer responsedata = new StringBuffer();
		System.out.println(speaker);
			try {
	            text = URLEncoder.encode(text, "UTF-8"); // 13자
	            String apiURL = "https://naveropenapi.apigw.ntruss.com/tts-premium/v1/tts";
	            URL url = new URL(apiURL);
	            HttpURLConnection con = (HttpURLConnection)url.openConnection();
	            con.setRequestMethod("POST");
	            con.setRequestProperty("X-NCP-APIGW-API-KEY-ID", clientId);
	            con.setRequestProperty("X-NCP-APIGW-API-KEY", clientSecret);
	            // post request
	            String postParams = "speaker="+speaker+"&volume="+volume+"&speed="+speed+"&pitch="+pitch+"&format=mp3&text=" + text;
	            System.out.println("[TTS@PostParams]"+postParams);
	            con.setDoOutput(true);
	            DataOutputStream wr = new DataOutputStream(con.getOutputStream());
	            wr.writeBytes(postParams);
	            wr.flush();
	            wr.close();
	            int responseCode = con.getResponseCode();
	            System.out.println(responseCode);
	            BufferedReader br;
	            if(responseCode==200) { // 정상 호출
	                InputStream is = con.getInputStream();
	                int read = 0;
	                byte[] bytes = new byte[1024];
	                // 랜덤한 이름으로 mp3 파일 생성
	                //String tempname = Long.valueOf(new Date().getTime()).toString();
	                //File f = new File(tempname + ".mp3");
	                //f.createNewFile();
	                //reponse내장객체에 클라우드에서 받은정보 쓰기
	                //OutputStream outputStream = new FileOutputStream(f);
	                //OutputStream에 넣기
	                OutputStream os = response.getOutputStream();
	                
	                while ((read =is.read(bytes)) != -1) {
	                    os.write(bytes, 0, read);
	                }
	                is.close();
	            } else {  // 오류 발생
	                br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
	                String inputLine;
	                
	                while ((inputLine = br.readLine()) != null) {
	                    responsedata.append(inputLine);
	                }
	                br.close();
	                System.out.println(response.toString());
	            }
	        } catch (Exception e) {
	            System.out.println(e);
	        }
	}
}
