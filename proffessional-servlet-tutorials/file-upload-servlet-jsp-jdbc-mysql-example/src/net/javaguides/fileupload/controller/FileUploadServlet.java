package net.javaguides.fileupload.controller;

import java.io.IOException;
import java.io.InputStream;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import net.javaguides.fileupload.dao.FileUploadDao;

@WebServlet("/uploadServlet")
@MultipartConfig(maxFileSize = 16177215) // upload file's size up to 16MB
public class FileUploadServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;
	
	private FileUploadDao fileUploadDao;

	@Override
	public void init() {
		fileUploadDao = new FileUploadDao();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// gets values of text fields
		String firstName = request.getParameter("firstName");
		String lastName = request.getParameter("lastName");

		InputStream inputStream = null; // input stream of the upload file

		String message = null;
		// obtains the upload file part in this multipart request
		Part filePart = request.getPart("photo");
		if (filePart != null) {
			// prints out some information for debugging
			System.out.println(filePart.getName());
			System.out.println(filePart.getSize());
			System.out.println(filePart.getContentType());

			// obtains input stream of the upload file
			inputStream = filePart.getInputStream();
		}

		// sends the statement to the database server
		int row = fileUploadDao.uploadFile(firstName, lastName, inputStream);
		if (row > 0) {
			message = "File uploaded and saved into database";
		}
		
		// sets the message in request scope
        request.setAttribute("Message", message);
         
        // forwards to the message page
        getServletContext().getRequestDispatcher("/message.jsp")
        .forward(request, response);
	}
}