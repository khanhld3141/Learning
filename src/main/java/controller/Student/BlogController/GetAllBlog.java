package controller.Student.BlogController;

import java.io.*;
import java.util.List;

import dal.CategoryDAO;
import dal.PostDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.Category;
import model.Post;

@WebServlet(name = "GetAllBlogStudentServlet", value = "/blogs")
public class GetAllBlog extends HttpServlet {
    private String message;
    private PostDAO postDAO;
    private CategoryDAO categoryDAO;
    public void init() {
        message = "Hello World!";
        postDAO=new PostDAO();
        categoryDAO=new CategoryDAO();
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
        List<Category> categories=categoryDAO.getWithNumberOfCourses();
        request.setAttribute("categories", categories);

        List<Post> posts=postDAO.getAllPosts(page,10);
        request.setAttribute("allposts", posts);

        List<Post> postList=postDAO.getAllPosts(1,3);
        request.setAttribute("posts", postList);
        request.getRequestDispatcher("/blog/index.jsp").forward(request,response);
    }

    public void destroy() {
    }
}