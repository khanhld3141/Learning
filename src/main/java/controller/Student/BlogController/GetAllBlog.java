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
        if(request.getParameter("hashtag")!=null){
            String hashtag = request.getParameter("hashtag");

            List<Post> posts=postDAO.searchByHashTag(page,8,hashtag);
            request.setAttribute("allposts", posts);

            List<Post> postList=postDAO.getAllPosts(1,3);
            request.setAttribute("posts", postList);
        }else{

            String query="";
            if(request.getParameter("query") != null) {
                query=request.getParameter("query");
            }

            List<Post> posts=postDAO.searchByName(page,8,query);
            request.setAttribute("allposts", posts);

            List<Post> postList=postDAO.getAllPosts(1,3);
            request.setAttribute("posts", postList);
        }
        request.getRequestDispatcher("/blog/index.jsp").forward(request,response);
    }

    public void destroy() {
    }
}