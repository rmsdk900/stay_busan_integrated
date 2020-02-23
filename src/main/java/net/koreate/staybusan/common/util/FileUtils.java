package net.koreate.staybusan.common.util;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.imageio.ImageIO;
import javax.servlet.ServletContext;

import org.apache.commons.io.IOUtils;
import org.eclipse.osgi.framework.util.Headers;
import org.imgscalr.Scalr;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;

public class FileUtils {

	ServletContext context;
	
	String uploadPath;
	
	private static FileUtils utils;
	
	private FileUtils() {}
	
	private FileUtils(ServletContext context) {
		this.context = context;
		createUploadPath();
	}
	
	public static FileUtils getInstance(ServletContext context) {
		if(utils == null) {
			utils = new FileUtils(context);
		}
		return utils;
	}
	
	private void createUploadPath() {
		uploadPath = context.getRealPath(File.separator+"upload");
		System.out.println("uploadPath : "+uploadPath);
		File file = new File(uploadPath);
		if(!file.exists()) {
			System.out.println("경로생성");
			file.mkdirs();
		}
	}
	
	public String uploadProfile(int u_no, String upload_u_profile) throws FileNotFoundException, IOException {
		
		String fakePath = "fake";
		String fakeRealPath = uploadPath+File.separator+fakePath;
		
		String path = Integer.toString(u_no);
		String realPath = uploadPath+File.separator+path;
		System.out.println("realPath : "+realPath);
		
		String realFilename = "";

		File realFolder = new File(uploadPath,path);
		if(!realFolder.exists()) {
			realFolder.mkdirs();
		}
		
		File file = new File(fakeRealPath);
		List<File> fakeFiles = Arrays.asList(file.listFiles());
		
		System.out.println("프로필 파일 이름 : "+upload_u_profile);
		
		for(File f : fakeFiles) {
			System.out.println("페이크 파일 이름 : "+f.getName());
			if(upload_u_profile.equals(f.getName())) {
				System.out.println("같음!");
				File copyFile = new File(realPath+File.separator+f.getName());
				FileCopyUtils.copy(IOUtils.toByteArray(new FileInputStream(f)), copyFile);
				realFilename = (realPath+File.separator+f.getName()).substring(uploadPath.length()).replace(File.separatorChar, '/');
				System.out.println("진짜 이름 : "+realFilename);
			}
		}
		
		return realFilename;
	}
	
	// 등록 클릭시 fake폴더 파일 비교 후 파일 복사 후 파일 name 반환
	public List<String> uploadFile(List<String> files,int u_no, int r_no) throws IOException{
		
		List<String> images = new ArrayList<String>();
		for(String imageName : files) {
			String image = imageName.replace('/', File.separatorChar);
			images.add(image);
		}
		
		String fakePath = Integer.toString(u_no)+File.separator+"fake";
		String fakeRealPath = uploadPath+File.separator+fakePath;
		
		String path = Integer.toString(u_no)+File.separator+r_no;
		String realPath = uploadPath+File.separator+path;
		
		List<String> fileList = new ArrayList<String>();

		File realFolder = new File(uploadPath,path);
		if(!realFolder.exists()) {
			realFolder.mkdirs();
		}
		
		File file = new File(fakeRealPath);
		List<File> fakeFiles = Arrays.asList(file.listFiles());
		
		for(File f : fakeFiles) {
			System.out.println(f.getName());
			String removeFilePath = File.separator+fakePath+File.separator+f.getName();
			if(images.contains(removeFilePath)) {
				File copyFile = new File(realPath+File.separator+f.getName());
				FileCopyUtils.copy(IOUtils.toByteArray(new FileInputStream(f)), copyFile);
				String realFilename = (realPath+File.separator+f.getName()).substring(uploadPath.length()).replace(File.separatorChar, '/');
				fileList.add(realFilename);
			}
		}
		
		return fileList;
	}
	
	// 디테일 수정용 파일 올리기
	// 전체 파일 올리기(controller랑 연결)
		public List<String> uploadFileMod(MultipartFile[] files, int u_no, int r_no) throws Exception{
			List<String> fileList = new ArrayList<>();
			System.out.println("넣을 파일들 : "+files);
			for(MultipartFile file : files) {
				System.out.println("넣을 파일 : "+file);
				try {
					String fileName = uploadFile(file, u_no, r_no);
					System.out.println("fileList에 넣은 파일 이름 : "+fileName);
					fileList.add(fileName);
				} catch (Exception e) {
					e.printStackTrace();
					throw new IOException("업로드 할 수 없는 파일이 포함되어 있습니다.");
				}
			}
			
			return fileList;
		}
		
		// 디테일 용 각각의 파일 올리기
		public String uploadFile(MultipartFile file, int u_no, int r_no) throws Exception{
			String uploadFolder = getFolder(u_no, r_no);
			System.out.println("upload 안의  Folder : "+uploadFolder);
			String originalName = file.getOriginalFilename();
			
			UUID uid = UUID.randomUUID();
			String savedName = uid.toString().replace("-", "")+"_"+originalName;
			System.out.println("저장될 파일 이름 : "+savedName);
			
			File uploadFolderFile = new File(uploadPath, uploadFolder);
			if(!uploadFolderFile.exists()) {
				uploadFolderFile.mkdirs();
				System.out.println("/유저 번호/방 번호 폴더 생성");
			}
			File upload = new File(uploadPath+File.separator+uploadFolder, savedName);
			
			System.out.println("upload file absolute path : "+upload.getAbsolutePath());
			
			byte[] fileData = file.getBytes();
			
			FileCopyUtils.copy(fileData, upload);
			
			System.out.println("파일 생성 완료");
			
			return makeFileUploadName(uploadFolder, savedName);
		}
		
		
	
	public List<String> fakeUploadProfile(MultipartFile[] files) throws IOException {
		List<String> fileList = new ArrayList<String>();
		
		for(MultipartFile file : files) {
			
			try {
				String fileName = fakeUploadProfile(file);
				fileList.add(fileName);
			} catch (Exception e) {
				e.printStackTrace();
				throw new IOException("업로드 할 수 없는 파일이 포함되어 있습니다.");
				}
		}
		
		return fileList;
	}
	


	// fake 파일 업로드 후 파일 name 반환
	public List<String> fakeUploadFile(MultipartFile[] files, int u_no) throws IOException{
		List<String> fileList = new ArrayList<String>();
		
		for(MultipartFile file : files) {
			
			try {
				String fileName = fakeUploadFile(file, u_no);
				fileList.add(fileName);
			} catch (Exception e) {
				e.printStackTrace();
				throw new IOException("업로드 할 수 없는 파일이 포함되어 있습니다.");
				}
		}
		
		return fileList;
	}
	
	private String fakeUploadProfile(MultipartFile file) throws Exception{
		String uploadFolder = "fake";
		
		String originalName = file.getOriginalFilename();
		
		UUID uid = UUID.randomUUID();
		String savedName = uid.toString().replace("-", "")+"_"+originalName;
		System.out.println("uploadFile savedName : "+savedName);
		
		File uploadFolderFile = new File(uploadPath,uploadFolder);
		if(!uploadFolderFile.exists()) {
			uploadFolderFile.mkdirs();
		}
		
		File upload = new File(uploadPath+File.separator+uploadFolder,savedName);
		
		System.out.println("파일 업로드 절대 경로 : "+upload.getAbsolutePath());
		
		byte[] fileData = file.getBytes();
		
		FileCopyUtils.copy(fileData, upload);
		
		return makeFileUploadName(uploadFolder, savedName);
	}
	
	// fake 파일 업로드 폴더 생성, 파일 업로드
	public String fakeUploadFile(MultipartFile file, int u_no)throws IOException{
		String uploadFolder = Integer.toString(u_no)+File.separator+"fake";
		
		String originalName = file.getOriginalFilename();
		
		UUID uid = UUID.randomUUID();
		String savedName = uid.toString().replace("-", "")+"_"+originalName;
		System.out.println("uploadFile savedName : "+savedName);
		
		File uploadFolderFile = new File(uploadPath,uploadFolder);
		if(!uploadFolderFile.exists()) {
			uploadFolderFile.mkdirs();
		}
		
		File upload = new File(uploadPath+File.separator+uploadFolder,savedName);
		
		System.out.println("파일 업로드 절대 경로 : "+upload.getAbsolutePath());
		
		byte[] fileData = file.getBytes();
		
		FileCopyUtils.copy(fileData, upload);
		
		return makeFileUploadName(uploadFolder, savedName);
	}
	
	private String makeFileUploadName(String uploadFolder, String savedName) throws IOException{
		
		String thumnail = uploadPath+File.separator+uploadFolder+File.separator+savedName;
		
		System.out.println("썸네일 : "+thumnail);
		
		return thumnail.substring(uploadPath.length()).replace(File.separatorChar, '/');
	}
	
	public byte[] displayFile(String fileName) throws IOException{
//		System.out.println("fileName : "+fileName);
		
		InputStream in = null;
		String path = uploadPath + (fileName).replace("/", File.separator);
		
		byte[] bytes = null;
		
		try {
			in = new FileInputStream(path);
			bytes = IOUtils.toByteArray(in);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("File이 없음 : "+e.getMessage());
		} finally {
			in.close();
		}
		return bytes;
	}
	
	public HttpHeaders getHeader(String fileName) throws Exception{
		HttpHeaders header = null;
		
		header = new HttpHeaders();
		String formatName = fileName.substring(fileName.lastIndexOf(".")+1);
		
		MediaType mType = MediaUtils.getMediaType(formatName);
		if(mType != null) {
//			System.out.println("IMAGE");
			header.setContentType(mType);
		}else {
			System.out.println("IMAGE 파일 아님");
			fileName = fileName.substring(fileName.indexOf("_")+1);
			header.setContentType(MediaType.APPLICATION_OCTET_STREAM);
			header.add("content-disposition", "attachment;fileName=\""+new String(fileName.getBytes("utf-8"),"ISO-8859-1")+"\"");
		}
		
		return header;
	}
	
	public String getFolder(int u_no, int r_no) {
		String folder = u_no+File.separator+r_no;
		System.out.println(u_no+"번째 회원의 "+r_no+"번 방 폴더 : "+folder);
		return folder;
	}

	public String deleteAllFiles(List<String> removeList) {
		for(String file : removeList) {
			new File(uploadPath+File.separator+(file).replace('/', File.separatorChar)).delete();
		}
		
		return "SELECTED FILES IS DELETED";
	}
	
	public void removeList(List<String> list, String path) throws Exception{
		if(!list.isEmpty()) {
			System.out.println("list 확인");
			String realPath = path.replace('/', File.separatorChar);
			System.out.println(realPath);
			
			List<String> removeList = new ArrayList<String>();
			File file = new File(uploadPath,realPath);
			
			List<File> files = Arrays.asList(file.listFiles()); 
			
			for(File f : files) {
				System.out.println(f.getName());
				String removeFilePath = path+f.getName();
				String thumNail = path+"s_"+f.getName();
				if(!list.contains(removeFilePath) && !list.contains(thumNail)) {
					removeList.add(removeFilePath);
				}
			}
			
			for(String s : removeList) {
				System.out.println("removeFile : "+s);
			}
			
			if(!removeList.isEmpty()) {
				System.out.println(deleteAllFiles(removeList));
			}
			
		}
	}
	// ----------------공사 중-----------------------------------
	public String deleteFile(String fileName) {
		String ex = fileName.substring(fileName.lastIndexOf(".")+1);
		if(MediaUtils.getMediaType(ex) != null) {
			// 원본도 삭제
			String name = fileName.replace("s_", "");
			System.out.println(name);
			new File(uploadPath+(name).replace('/', File.separatorChar)).delete();
		}
		new File(uploadPath+(fileName).replace('/', File.separatorChar)).delete();
		
		return "DELETE";
	}



}
