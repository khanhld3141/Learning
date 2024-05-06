package controller.Student.BlogController;

import java.io.*;
import java.util.List;

import dal.PostDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.Post;

@WebServlet(name = "GetAllBlogStudentServlet", value = "/blogs")
public class GetAllBlog extends HttpServlet {
    private String message;
    private PostDAO postDAO;
    public void init() {
        message = "Hello World!";
        postDAO=new PostDAO();
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        int page=1;
        if(request.getParameter("page") != null){
            try{
                page = Integer.parseInt(request.getParameter("page"));
            }catch (Exception e){
                e.printStackTrace();
            }
        }
        List<Post> posts=postDAO.getAllPosts(page,10);
        request.setAttribute("posts", posts);
        request.getRequestDispatcher("/blog/index.jsp").forward(request,response);
    }

    public void destroy() {
    }
}