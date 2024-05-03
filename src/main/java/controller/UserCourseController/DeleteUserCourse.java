package controller.UserCourseController;

import java.io.*;

import dal.UserCourseDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

@WebServlet(name = "DeleteUserCourseServlet", value = "/delete-user-course")
public class DeleteUserCourse extends HttpServlet {
    private String message;
    private UserCourseDAO userCourseDAO;
    public void init() {
        message = "Hello World!";
        userCourseDAO = new UserCourseDAO();
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
       if(request.getParameter("id") != null){
           String id = request.getParameter("id");
           try{
               userCourseDAO.delete(Integer.parseInt(id));
               response.sendRedirect("");
           }catch(Exception e){
               request.setAttribute("error","");
               request.getRequestDispatcher("").forward(request, response);
           }
       }else{
           request.setAttribute("error","");
           request.getRequestDispatcher("").forward(request, response);
       }
    }

    public void destroy() {
    }
}