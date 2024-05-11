package controller.Student.BlogController;

import java.io.*;

import controller.Ulti.FileUploadUtil;
import dal.PostDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.Post;

@WebServlet(name = "UpdateMyPostServlet", value = "/update-my-post")
public class UpdateMyPost extends HttpServlet {
    private String message;
    private PostDAO postDAO;

    public void init() {
        message = "Hello World!";
        postDAO=new PostDAO();
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        if(request.getParameter("id")!=null){
            try{
                int id=Integer.parseInt(request.getParameter("id"));
                Post post=postDAO.get(id);
                request.setAttribute("post", post);
                request.getRequestDispatcher("/Manage-users-blog/update-post.jsp").forward(request,response);
            }catch (Exception e){
                request.getRequestDispatcher("/404notfound/index.jsp").forward(request, response);
                e.printStackTrace();
            }
        }else{
            request.getRequestDispatcher("/404notfound/index.jsp").forward(request, response);
        }
    }
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String content = request.getParameter("content");
        String comment = request.getParameter("comment");
        String title = request.getParameter("title");
        String id = request.getParameter("id");
        Post post = postDAO.get(Integer.parseInt(id));
        try {
            post.setComment(comment);
            post.setTitle(title);
            post.setContent(content);
            postDAO.update(post);
            response.sendRedirect("/my-posts");
        } catch (Exception e) {
            request.getRequestDispatcher("/404notfound/index.jsp").forward(request, response);
            e.printStackTrace();
        }
    }

    public void destroy() {
    }
}