package controller.HashtagController;

import java.io.*;

import dal.HashtagDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.Hashtag;

@WebServlet(name = "UpdateHashtagServlet", value = "/dashboard/update-hashtag")
public class UpdateHashtag extends HttpServlet {
    private String message;
    private HashtagDAO hashtagDAO;
    public void init() {
        message = "Hello World!";
        hashtagDAO=new HashtagDAO();
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        if(request.getParameter("id")!=null){
            String id=request.getParameter("id");
            Hashtag hashtag=hashtagDAO.get(Integer.parseInt(id));
            request.setAttribute("hashtag", hashtag);
            request.getRequestDispatcher("").forward(request,response);
        }else{
            request.setAttribute("error","Please enter a post id");
            request.getRequestDispatcher("").forward(request,response);
        }
    }
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String id=request.getParameter("id");
        String postId=request.getParameter("postid");
        String tag=request.getParameter("tag");
        try{
            hashtagDAO.update(new Hashtag(
                    Integer.parseInt(id),
                    Integer.parseInt(postId),
                    tag
            ));
            response.sendRedirect("");
        }catch(Exception e){
            request.setAttribute("error","Please enter a post id");
            request.getRequestDispatcher("").forward(request,response);
        }
    }
    public void destroy() {
    }
}