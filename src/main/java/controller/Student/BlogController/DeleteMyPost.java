package controller.Student.BlogController;

import java.io.*;
import java.util.List;

import dal.HashtagDAO;
import dal.PostDAO;
import dal.PostHashtagDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.PostHashtag;

@WebServlet(name = "DeleteMyPostServlet", value = "/delete-my-post")
public class DeleteMyPost extends HttpServlet {
    private String message;
    private PostDAO postDAO;
    private HashtagDAO hashtagDAO;
    private PostHashtagDAO postHashtagDAO;
    public void init() {
        message = "Hello World!";
        postDAO=new PostDAO();
        hashtagDAO=new HashtagDAO();
        postHashtagDAO=new PostHashtagDAO();
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        if(request.getParameter("id")!=null){
            HttpSession session=request.getSession();
           try{
               int id=Integer.parseInt(request.getParameter("id"));
               List<PostHashtag> postHashtags=postHashtagDAO.get(id);
               postHashtagDAO.deleteHashtagOfPost(id);
               for(PostHashtag postHashtag : postHashtags){
                   if(postHashtagDAO.getByTagId(postHashtag.getHashtagId()).size() == 0){
                       hashtagDAO.delete(postHashtag.getHashtagId());
                   }
               }
               postDAO.delete(id);
               session.setAttribute("success","Delete post successfully");

           }catch (Exception e){
               session.setAttribute("error","Error while deleting post");
           }
            response.sendRedirect("/my-posts");
        }else{
            request.getRequestDispatcher("/404notfound/index.jsp").forward(request, response);
        }
    }

    public void destroy() {
    }
}