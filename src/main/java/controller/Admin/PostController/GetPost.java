package controller.Admin.PostController;

import java.io.*;
import java.util.List;

import dal.ChapterDAO;
import dal.CourseDAO;
import dal.PostDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.Chapter;
import model.Post;

@WebServlet(name = "GetPostServlet", value = "/dashboard/posts")
public class GetPost extends HttpServlet {
    private String message;
    private PostDAO postDAO;

    public void init() {
        message = "Hello World!";
        postDAO=new PostDAO();
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        try {
            int page=1;
            if(request.getParameter("page") != null){
                try{
                    page=Integer.parseInt(request.getParameter("page"));
                }catch (Exception e){
                    e.printStackTrace();
                }
            }
            List<Post> posts = postDAO.getAllPosts(page,10);
            request.setAttribute("posts", posts);
            request.getRequestDispatcher("/dashboard_post/index.jsp").forward(request, response);
        } catch (Exception e) {
            request.setAttribute("error", "Please enter a valid id");
            request.getRequestDispatcher("/dashboard_post/index.jsp").forward(request, response);
        }
    }

    public void destroy() {
    }
}