package controller.HashtagController;

import java.io.*;

import dal.HashtagDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

@WebServlet(name = "DeleteHashtagServlet", value = "/dashboard/delete-hashtag")
public class DeleteHashtag extends HttpServlet {
    private String message;
    private HashtagDAO hashtagDAO;
    public void init() {
        message = "Hello World!";
        hashtagDAO=new HashtagDAO();
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        if(request.getParameter("id")!=null){
            String id=request.getParameter("id");
            hashtagDAO.delete(Integer.parseInt(id));
            response.sendRedirect("");
        }else{
            request.setAttribute("error","Please enter a post id");
            request.getRequestDispatcher("").forward(request,response);
        }
    }

    public void destroy() {
    }
}