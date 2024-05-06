package controller.Admin.HashtagController;

import java.io.*;
import java.util.List;

import dal.HashtagDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.Hashtag;

@WebServlet(name = "GetHashtagServlet", value = "/dashboard/hashtags")
public class GetHashtag extends HttpServlet {
    private String message;
    private HashtagDAO hashtagDAO  ;
    public void init() {
        message = "Hello World!";
        hashtagDAO=new HashtagDAO();
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        List<Hashtag> hashtags=hashtagDAO.getAllHashtags();
        request.setAttribute("hashtags", hashtags);
        request.getRequestDispatcher("").forward(request,response);
    }

    public void destroy() {
    }
}