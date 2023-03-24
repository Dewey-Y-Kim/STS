package com.campus.clova;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLConnection;

import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;


@RestController
public class cfr_Recognition {
	String clientId = "qpstwad3s8";//애플리케이션 클라이언트 아이디값";
	String clientSecret = "a5MizXVZoGdlwmiAzdzKlEpE1FbKgfOsfVsWb8yB";//애플리케이션 클라이언트 시크릿값";
	
	//cfr_recognition_frm 이동
	@GetMapping("/cfr_recognition")
	public ModelAndView cfrRecognition() {
		ModelAndView mav= new ModelAndView();
		mav.setViewName("Clova/clova01_cfr_recognition");
		return mav;
	}
	
	@PostMapping("/cfr_recognitionOk")
	public String cfrRecognitionOk(@RequestParam("image") MultipartFile file,HttpSession session) {
		// path 설정
		String path= session.getServletContext().getRealPath("/resources");
		String OrgfileName=null;
		StringBuffer reqStr = new StringBuffer();
		StringBuffer response = null;
		try {
			OrgfileName=FileUpload.fileUpload(path, file);
			// ---- Naver API ----
			String paramName = "image"; // 파라미터명은 image로 지정
            String imgFile = path+"/"+OrgfileName; 
            File uploadFile = new File(imgFile);
            String apiURL = "https://naveropenapi.apigw.ntruss.com/vision/v1/face"; // 얼굴 감지
            URL url = new URL(apiURL);
            HttpURLConnection con = (HttpURLConnection)url.openConnection();
            con.setUseCaches(false);
            con.setDoOutput(true);
            con.setDoInput(true);
            // multipart request
            String boundary = "---" + System.currentTimeMillis() + "---";
            con.setRequestProperty("Content-Type", "multipart/form-data; boundary=" + boundary);
            con.setRequestProperty("X-NCP-APIGW-API-KEY-ID", clientId);
            con.setRequestProperty("X-NCP-APIGW-API-KEY", clientSecret);
            OutputStream outputStream = con.getOutputStream();
            PrintWriter writer = new PrintWriter(new OutputStreamWriter(outputStream, "UTF-8"), true);
            String LINE_FEED = "\r\n";
            // file 추가
            String fileName = uploadFile.getName();
            writer.append("--" + boundary).append(LINE_FEED);
            writer.append("Content-Disposition: form-data; name=\"" + paramName + "\"; filename=\"" + fileName + "\"").append(LINE_FEED);
            writer.append("Content-Type: "  + URLConnection.guessContentTypeFromName(fileName)).append(LINE_FEED);
            writer.append(LINE_FEED);
            writer.flush(); //전송
            FileInputStream inputStream = new FileInputStream(uploadFile);
            byte[] buffer = new byte[4096];
            int bytesRead = -1;
            while ((bytesRead = inputStream.read(buffer)) != -1) {
                outputStream.write(buffer, 0, bytesRead);
            }
            outputStream.flush();
            inputStream.close();
            writer.append(LINE_FEED).flush();
            writer.append("--" + boundary + "--").append(LINE_FEED);
            writer.close();
            //네이버 플랫폼으로 보내기 완료
            BufferedReader br = null;
            int responseCode = con.getResponseCode();
            if(responseCode==200) { // 정상 호출
                br = new BufferedReader(new InputStreamReader(con.getInputStream()));
            } else {  // 오류 발생
                System.out.println("error!!!!!!! responseCode= " + responseCode);
                br = new BufferedReader(new InputStreamReader(con.getInputStream()));
            }
            String inputLine;
            if(br != null) {
                response = new StringBuffer();
                while ((inputLine = br.readLine()) != null) {
                    response.append(inputLine);
                }
                br.close();
                System.out.println("[API Result]"+response.toString());
            } 
			// Naver API
		}catch(Exception e) {
			
		}
		return response.toString();
	}
}
