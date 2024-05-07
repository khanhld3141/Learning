package controller.Student.BlogController;

import java.io.*;

import controller.Ulti.FileUploadUtil;
import dal.PostDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.Post;
import model.User;

@MultipartConfig
@WebServlet(name = "CreateMyPostServlet", value = "/create-my-post")
public class CreateMyPost extends HttpServlet {
    private String message;
    private PostDAO postDAO;

    public void init() {
        message = "Hello World!";
        postDAO = new PostDAO();
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        request.getRequestDispatcher("/Manage-users-blog/add-post.jsp").forward(request, response);
    }
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String content=request.getParameter("content");
        String comment=request.getParameter("comment");
        String title=request.getParameter("title");
        Part image=request.getPart("image");
        String realPath = request.getServletContext().getRealPath("/images");
        String filename = FileUploadUtil.uploadFile(image, realPath);
        HttpSession session = request.getSession();
        User user =(User) session.getAttribute("user");

        try{
            postDAO.create(new Post(title,content,comment,filename,user.getId()));
            response.sendRedirect("/my-posts");
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    public void destroy() {
    }
}