package controller.Student.BlogController;

import java.io.*;
import java.util.ArrayList;
import java.util.List;

import dal.CategoryDAO;
import dal.PostCommentDAO;
import dal.PostDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.Category;
import model.Post;
import model.PostComment;

@WebServlet(name = "DetailBlogServlet", value = "/detail-blog")
public class DetailBlog extends HttpServlet {
    private String message;
    private PostDAO postDAO;
    private PostCommentDAO postCommentDAO;
    private CategoryDAO categoryDAO;

    public void init() {
        message = "Hello World!";
        postDAO=new PostDAO();
        postCommentDAO=new PostCommentDAO();
        categoryDAO=new CategoryDAO();
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        if(request.getParameter("id")!=null){
          try{
              int id=Integer.parseInt(request.getParameter("id"));
              Post post=postDAO.get(id);
              List<PostComment> comments=postCommentDAO.getAllPostCommentOfPost(id);
              post.setComments(comments);
              List<Category> categories=categoryDAO.getWithNumberOfCourses();
              List<Post> posts=postDAO.getAllPosts(1,3);
              request.setAttribute("post",post);
              request.setAttribute("posts",posts);
              request.setAttribute("categories",categories);

              request.getRequestDispatcher("/blog-details/index.jsp").forward(request, response);
          }catch(Exception e){
              e.printStackTrace();
          }

        }
    }

    public void destroy() {
    }
}