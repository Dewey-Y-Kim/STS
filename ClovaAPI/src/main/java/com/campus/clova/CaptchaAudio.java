package com.campus.clova;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.http.HttpHeaders;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class CaptchaAudio {
	String clientId = "iqvlkhwldw";//애플리케이션 클라이언트 아이디값";
    String clientSecret = "";//애플리케이션 클라이언트 시크릿값";
    String key;
    @GetMapping("CaptchaAudioFrm")
    public ModelAndView CaptchaAudioFrm() {
    	ModelAndView mav = new ModelAndView();
    	mav.setViewName("Clova/clova10_captchaAudio");
    	return mav;
    }
    @GetMapping("captchAudio")
    public void captchaAudio(HttpSession session,HttpServletResponse res) {
    	try {
            //String key = "CAPTCHA_KEY"; // https://naveropenapi.apigw.ntruss.com/scaptcha/v1/skey 호출로 받은 키값
            getKey();
    		String apiURL = "https://naveropenapi.apigw.ntruss.com/scaptcha-bin/v1/scaptcha?key=" + key + "&X-NCP-APIGW-API-KEY-ID=" + clientId;
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
                String tempname = Long.valueOf(new Date().getTime()).toString();
                String path=session.getServletContext().getRealPath("/resources");
                File f = new File(path+"/"+tempname + ".wav");
                f.createNewFile();
                OutputStream outputStream = new FileOutputStream(f);
                OutputStream os = res.getOutputStream();
                while ((read =is.read(bytes)) != -1) {
                   outputStream.write(bytes, 0, read);
                    os.write(bytes,0,read);
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
    }
    
    public void getKey() { 
    	try {
    		String code = "0"; // 키 발급시 0,  캡차 음성 비교시 1로 세팅
    		String apiURL = "https://naveropenapi.apigw.ntruss.com/scaptcha/v1/skey?code=" + code;
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
    		// key 보관
    		JSONObject keyJson = new JSONObject(response.toString());
    		key=keyJson.getString("key");
    	} catch (Exception e) {
    		System.out.println(e);
    	}
    }
    //비교
    @PostMapping("/captcaAudioCheck")
    public ModelAndView CaptchaAudioChk(String userin){
    	StringBuffer response = new StringBuffer();
    	try {
            String code = "1"; // 키 발급시 0,  캡차 음성 비교시 1로 세팅
            String value = userin; // 사용자가 입력한 캡차 값
            String apiURL = "https://naveropenapi.apigw.ntruss.com/scaptcha/v1/skey?code=" + code +"&key="+ key + "&value="+ value;

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
    	ModelAndView mav = new ModelAndView();
    	JSONObject json = new JSONObject(response.toString());
    	boolean result = json.getBoolean("result");
    	if(result) {
    		mav.setViewName("redirect:/");
    	}else {
    		mav.setViewName("redirect:/CaptchaAudioFrm");
    	}
    	return mav;
    }
}
