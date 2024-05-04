package controller.PostController;

import java.io.*;
import java.util.List;

import controller.Ulti.FileUploadUtil;
import dal.PostDAO;
import dal.UserDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.Post;
import model.User;

@MultipartConfig
@WebServlet(name = "CreatePostServlet", value = "/dashboard/create-post")
public class CreatePost extends HttpServlet {
    private String message;
    private PostDAO postDAO;
    private UserDAO userDAO;
    public void init() {
        message = "Hello World!";
        postDAO=new PostDAO();
        userDAO=new UserDAO();
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        List<User> users=userDAO.getAllUser();
        request.setAttribute("users", users);
        request.getRequestDispatcher("/dashboard_post/add-post.jsp").forward(request,response);
    }
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String content=request.getParameter("Content");
        String comment=request.getParameter("comment");
        String title=request.getParameter("title");
        Part image=request.getPart("image");
        String author=request.getParameter("author");
        String authors[]=author.split("-");
        String realPath = request.getServletContext().getRealPath("/images");
        String filename = FileUploadUtil.uploadFile(image, realPath);

        try{
            postDAO.create(new Post(title,content,comment,filename,Integer.parseInt(authors[0])));
            response.sendRedirect("/dashboard/posts");
        }catch (Exception e){
            e.printStackTrace();
        }

    }
    public void destroy() {
    }
}