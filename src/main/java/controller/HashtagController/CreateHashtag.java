package controller.HashtagController;

import java.io.*;

import dal.HashtagDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.Hashtag;

@WebServlet(name = "CreateHashtagServlet", value = "/dashboard/create-hashtag")
public class CreateHashtag extends HttpServlet {
    private String message;
    private HashtagDAO hashtagDAO;
    public void init() {
        message = "Hello World!";
        hashtagDAO=new HashtagDAO();
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        request.getRequestDispatcher("").forward(request, response);
    }
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String postId=request.getParameter("postid");
        String tag=request.getParameter("tag");
        try{
            hashtagDAO.create(new Hashtag(
                    Integer.parseInt(postId),
                    tag
            ));
        }catch(Exception e){
            request.setAttribute("error","Please enter a post id");
            request.getRequestDispatcher("").forward(request,response);
        }
    }

    public void destroy() {
    }
}