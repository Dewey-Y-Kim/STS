package com.naver.dcancer;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.net.URL;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FileUtils;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

@RestController
@RequestMapping("down")
public class Downloader {
	@GetMapping("Frm")
	public ModelAndView Intro(HttpServletRequest request) {
		ModelAndView mav= new ModelAndView();
		mav.setViewName("Down/InputFrm");
		return mav;
	}
	@PostMapping("startDown")
	public ModelAndView inputData(String model,String color, String ImgUrl,HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		
		String zipfile="";
		if(model!=null && ImgUrl!=null) {
		//기본주소와 파일명 분리
		int slash= ImgUrl.lastIndexOf("/");
		
		String path = ImgUrl.substring(0, slash+1);
		String filename=ImgUrl.substring(slash+1);
		int point= filename.lastIndexOf(".");
		String ext=filename.substring(point+1);
		filename=filename.substring(0,point);
		filename=filename.substring(0,filename.length()-3);
		String realpath=Downloader(color, path,filename,ext, model,request);
		String zippath=request.getSession().getServletContext().getRealPath("/resources");
		zipfile=zipper(model,color,realpath,zippath);
		System.out.println("Path="+path);
		System.out.println("filename:"+filename);
		System.out.println("Ext:"+ext);
		}
		
		zipfile="/Users/dewey/git_Mac/STS/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/webDown/resource/asgga/asgga(ag).zip";
		mav.setViewName("Down/result");
		mav.addObject("path",zipfile);
		return mav;
	}
	public String Downloader(String color, String path, String filename,String ext,String model,HttpServletRequest request) {
		String realpath="";
		try {
			URL url;
			int t=3;
			if(path.contains("kia.com")) {
				t=2;
			}
			String dest="/"+model;
			System.out.println("Downloader:file");
				for(int i=1;i<100;i++) {
					String f= "0".repeat(t-String.valueOf(i).length())+String.valueOf(i);
					System.out.println("result:"+f);
					File file;
					try {
							url= new URL(path+"/"+f+"."+ext);
							file=new File(request.getSession().getServletContext().getRealPath("/resource")+"/"+model+"/"+color+"/"+f+"."+ext);
							FileUtils.copyURLToFile(url,file);
					}catch(Exception e) {
						break;
					}
				}
			realpath=request.getSession().getServletContext().getRealPath("/resource")+"/"+model+"/"+color+"/";
			System.out.println("[Downloader]:"+realpath);
		}catch(Exception e) {e.printStackTrace();};
		return realpath;
	}
	public String zipper(String model,String color,String path,String zippath) {
		String realpath=path.substring(0,path.indexOf(color));
		
		System.out.println("[zipper]"+realpath);
		File zip;
		if(color!=null) {
			zip=new File(zippath,model+"("+color+").zip");
		}else {
			zip=new File(zippath,model+".zip");
			
		}
		byte[] buf= new byte[1024];
		try {
			ZipOutputStream out = new ZipOutputStream(new FileOutputStream(zip));
			File folder= new File(path);
			File[] filelist= folder.listFiles();
			for(File file :filelist){
				try (FileInputStream in = new FileInputStream(file) ){
						ZipEntry ze = new ZipEntry(file.getName());
						out.putNextEntry(ze);
						int len;
						while((len=in.read(buf,0,1024))>0) {
							out.write(buf, 0, len);
						}
				in.close();
				
				}catch(Exception e) {e.printStackTrace();}
			}
			out.flush();
			out.closeEntry();
			out.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
		if(color!=null) {
			realpath+=model+"("+color+").zip";
		}else {
			realpath+=model+".zip";
		}
		System.out.println("[zipPath]"+realpath);
		return realpath;
	}
}
