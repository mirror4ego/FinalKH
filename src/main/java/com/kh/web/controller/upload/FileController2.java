package com.kh.web.controller.upload;

import java.io.IOException;
import java.io.InputStream;

import javax.annotation.Resource;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kh.web.model.upload.FileCommand;
import com.kh.web.util.FileManager;

/**
 * Servlet implementation class FileController2
 */
@Controller("file.fileController")
public class FileController2 extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FileController2() {
        super();
        
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		RequestDispatcher dispatcher = request.getRequestDispatcher("upload/FileSend.jsp");
		dispatcher.forward(request, response);
	}
	@Resource(name="fileManager")
	private FileManager fileManager;
	
	@RequestMapping(value="/upload.file", method={RequestMethod.GET})
	public String upload(FileCommand command, HttpServletResponse response,HttpServletRequest request) throws Exception{
			return "upload/FileSend";
		
	}
	@RequestMapping(value="/upload.file", method={RequestMethod.POST})
	public String upload1(FileCommand command, HttpServletResponse response,HttpServletRequest request) throws Exception{
		FileCommand dto = command;
		request.setAttribute("content", "업로드된 파일이 없습니다.");
		if(!dto.getUpload().isEmpty()){
			HttpSession session = request.getSession();
			String root = session.getServletContext().getRealPath("/");
			//String SavePath = "upload";
			//ServletContext context = getServletContext();
			//String uploadFilePath = context.getRealPath(SavePath);
			String path = root + "upload";
			System.out.println("path:"+path);
			
			
			
			dto.setFileSize(dto.getUpload().getSize());
			dto.setOriginalFileName(dto.getUpload().getOriginalFilename());
			
			InputStream is = dto.getUpload().getInputStream();
			String newFileName = fileManager.doFileUpload(is, dto.getOriginalFileName(), path);
			dto.setSaveFileName(newFileName);
			
			dto.getSaveFileName();
			
			request.setAttribute("saveFileName", dto.getSaveFileName());
			request.setAttribute("originalFileName", dto.getOriginalFileName());
			request.setAttribute("content", dto.getContent());
			
			request.setAttribute("fileSize", dto.getFileSize());
			request.setAttribute("contentType", dto.getUpload().getContentType());
			request.setAttribute("path", path);
			request.setAttribute("root", root);
			//데이터베이스에 업로드된 파일 정보 젖아 프로세스 추가
		}
		return "upload/FileReceive";
		
	}
	
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
	}

}
