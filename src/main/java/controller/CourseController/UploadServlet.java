package controller.CourseController;

import java.io.*;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.UUID;

import controller.Ulti.FileUploadUtil;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@MultipartConfig()
@WebServlet({"/upload"})
public class UploadServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/Home/add-user.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            //delete
           String realPath = request.getServletContext().getRealPath("/images");
            FileUploadUtil.deleteFile(realPath,"60936a5d-4a92-4c68-9680-7f3122e93ec1_banner-11.png");
//           // Xác định đường dẫn tệp tin cần xóa
//           Path filePath = Paths.get(realPath, "/banner-1.png");
//            Files.delete(filePath);


            //create
//            Part photo = request.getPart("image");
//
//            String realPath = request.getServletContext().getRealPath("/images");
//            String filename= FileUploadUtil.uploadFile(photo,realPath);
//            System.out.println("/images/"+filename);
//            String filename =
//                    Path.of(photo.getSubmittedFileName() + "_" + UUID.randomUUID().toString()).getFileName().toString();
//            if (!Files.exists(Path.of(realPath))) {
//                Files.createDirectory(Path.of(realPath));
//            }
//            photo.write(realPath + "/" + filename);
//            request.setAttribute("image", "/images/" + filename);

            request.getRequestDispatcher("/Home/add-user.jsp").forward(request, response);
        } catch (Exception e) {

        }
    }
}
