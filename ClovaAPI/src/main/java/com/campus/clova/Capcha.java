package com.campus.clova;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Date;

import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

@RestController
public class Capcha {
	
	String clientId = "iqvlkhwldw";//애플리케이션 클라이언트 아이디값";
    String clientSecret = "";//애플리케이션 클라이언트 시크릿값";
    String key;
    
    @GetMapping("Captchafrm")
    public ModelAndView toCaptcha() {
    	ModelAndView mav = new ModelAndView();
    	mav.setViewName("Clova/clova09_captcha");
    	return mav;
    }
    //이미지 수
    @GetMapping("Captcha")
    public String captchaImageCreate(HttpServletResponse res) {
    	try {
    		getKeyCode();
    		String apiURL = "https://naveropenapi.apigw.ntruss.com/captcha-bin/v1/ncaptcha?key=" + key + "&X-NCP-APIGW-API-KEY-ID=" + clientId;
            URL url = new URL(apiURL);
            HttpURLConnection con = (HttpURLConnection)url.openConnection();
            con.setRequestMethod("GET");
            int responseCode = con.getResponseCode();
            BufferedReader br;
            if(responseCode==200) { // 정상 호출
                InputStream is = con.getInputStream();
                int read = 0;
                byte[] bytes = new byte[1024];
                
                // 랜덤한 이름으로 파일 생성
                /*
                String tempname = Long.valueOf(new Date().getTime()).toString();
                File f = new File(tempname + ".jpg");
                f.createNewFile();
                OutputStream outputStream = new FileOutputStream(f);
                */
                OutputStream outputStream = res.getOutputStream();
                // 의심부분
                while ((read =is.read(bytes)) != -1) {
                    outputStream.write(bytes, 0, read);
                }
                is.close();
                
            } else {  // 오류 발생
                br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
                String inputLine;
                StringBuffer response = new StringBuffer();
                while ((inputLine = br.readLine()) != null) {
                    response.append(inputLine);
                }
                br.close();
                System.out.println(response.toString());
            }
        } catch (Exception e) {
            System.out.println(e);
        }
    	return "";
    }
   
    public void getKeyCode() {
		StringBuffer response = new StringBuffer();
        
		try {
            String code = "0"; // 키 발급시 0,  캡차 이미지 비교시 1로 세팅
            String apiURL = "https://naveropenapi.apigw.ntruss.com/captcha/v1/nkey?code=" + code;
            URL url = new URL(apiURL);
            HttpURLConnection con = (HttpURLConnection)url.openConnection();
            con.setRequestMethod("GET");
            con.setRequestProperty("X-NCP-APIGW-API-KEY-ID", clientId);
            con.setRequestProperty("X-NCP-APIGW-API-KEY", clientSecret);
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
        JSONObject json = new JSONObject("response");
        
        key = (String)json.get("key");
	}
	
	// key 확인
    @PostMapping("/captcaImageCheck")
    public ResponseEntity capchaImgCheck(@RequestParam("userin")String userin) {
    	ResponseEntity<String> entity;
    	HttpHeaders headers = new HttpHeaders();
    	headers.add("Content-Type","text/html;charset=UTF-8");
    	String body="";
    	try {
            String code = "1"; // 키 발급시 0,  캡차 이미지 비교시 1로 세팅
            // String key = "CAPTCHA_KEY"; // 캡차 키 발급시 받은 키값
            String value = userin; // 사용자가 입력한 캡차 이미지 글자값
            String apiURL = "https://naveropenapi.apigw.ntruss.com/captcha/v1/nkey?code=" + code +"&key="+ key + "&value="+ value;

            URL url = new URL(apiURL);
            HttpURLConnection con = (HttpURLConnection)url.openConnection();
            con.setRequestMethod("GET");
            con.setRequestProperty("X-NCP-APIGW-API-KEY-ID", clientId);
            con.setRequestProperty("X-NCP-APIGW-API-KEY", clientSecret);
            int responseCode = con.getResponseCode();
            BufferedReader br;
            if(responseCode==200) { // 정상 호출
                br = new BufferedReader(new InputStreamReader(con.getInputStream()));
            } else {  // 오류 발생
                br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
            }
            String inputLine;
            StringBuffer response = new StringBuffer();
            while ((inputLine = br.readLine()) != null) {
                response.append(inputLine);
            }
            br.close();
            System.out.println(response.toString());
            JSONObject json = new JSONObject(response.toString());
            boolean result = json.getBoolean("result");
            body = "<script>";
            if(result) {
            	//승인성공
            	
            	body +="location.href='/clova/';";
            	
            }else {
            	//승인실패
            	body += "alert('입력이 잘못되었습니다.');";
            	body += "location.href='Captchafrm';";
            }
            body +="</script>";
            entity = new ResponseEntity<String>(body,headers,HttpStatus.OK);
    	} catch (Exception e) {
            System.out.println(e);
        }
    	entity = new ResponseEntity<String>(body,headers,HttpStatus.OK);
    	return entity;
    }
}
