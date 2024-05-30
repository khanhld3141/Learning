package controller.Student.Personal;

import java.io.*;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.UUID;

import controller.Ulti.FileUploadUtil;
import dal.UserDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.Post;
import model.User;
@MultipartConfig
@WebServlet(name = "UploadUserImageServlet", value = "/upload-user-image")
public class UploadUserImage extends HttpServlet {
    private String message;
    private UserDAO userDAO;

    public void init() {
        message = "Hello World!";
        userDAO = new UserDAO();
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("text/html");

        // Hello
        PrintWriter out = response.getWriter();
        out.println("<html><body>");
        out.println("<h1>" + message + "</h1>");
        out.println("</body></html>");
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        try {
            //delete
            String realPath = request.getServletContext().getRealPath("/images");


            User us = (User) session.getAttribute("user");

            User user = userDAO.get(us.getId());
//            if (user.getAvatar() != null) {
//                FileUploadUtil.deleteFile(realPath, user.getAvatar());
//            }

            //create
            Part photo = request.getPart("image");
            String filename =
                    Path.of(UUID.randomUUID().toString()).getFileName().toString()+ "_" +photo.getSubmittedFileName()  ;
            if (!Files.exists(Path.of(realPath))) {
                Files.createDirectory(Path.of(realPath));
            }
            user.setAvatar(filename);
            userDAO.update(user);
            session.setAttribute("success","Change avatar successfully");
            photo.write(realPath + "/" + filename);
        } catch (Exception e) {
            session.setAttribute("error","Error while changing avatar");
            response.sendRedirect("/my-profile");
        }
    }
    public void destroy() {
    }
}