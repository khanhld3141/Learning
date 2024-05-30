package controller.Admin.UserCourseController;

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
           HttpSession session=request.getSession();
           try{
               userCourseDAO.delete(Integer.parseInt(id));
               session.setAttribute("success","Delete user in course successfully");
           }catch(Exception e){
               session.setAttribute("error","Error while deleting user in course");
           }
           response.sendRedirect("/dashboard/courses");
       }else{
           request.getRequestDispatcher("/404notfound/index.jsp").forward(request, response);
       }
    }

    public void destroy() {
    }
}