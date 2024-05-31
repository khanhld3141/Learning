package controller.Admin.HashtagController;

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
        HttpSession session=request.getSession();
        if(request.getParameter("id")!=null){
            String id=request.getParameter("id");
           try{
               hashtagDAO.delete(Integer.parseInt(id));
               session.setAttribute("success","Delete hashtag successfully");
           }catch (Exception e){
               session.setAttribute("error","Error while deleting hashtag");
           }
           response.sendRedirect("/dashboard/hashtags");
        }else{
           request.getRequestDispatcher("/404notfound/index.jsp").forward(request,response);
        }
    }

    public void destroy() {
    }
}