package controller.Admin.UserCourseController;

import java.io.*;

import dal.UserCourseDAO;
import dal.UserDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.User;
import model.UserCourse;

@WebServlet(name = "DeleteUserCourseServlet", value = "/delete-user-course")
public class DeleteUserCourse extends HttpServlet {
    private String message;
    private UserCourseDAO userCourseDAO;
    private UserDAO userDAO;
    public void init() {
        message = "Hello World!";
        userCourseDAO = new UserCourseDAO();
        userDAO=new UserDAO();
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
       if(request.getParameter("email") != null){
           String email = request.getParameter("email");
           String courseid=request.getParameter("courseid");

           HttpSession session=request.getSession();
           User user=userDAO.getByEmail(email);
           if(user==null){
               session.setAttribute("error","Email is invalid");
           }else{
               if(userCourseDAO.findByUserAndCourse(user.getId(),Integer.parseInt(courseid))==null){
                   session.setAttribute("error","User is not exist in course");
               }else {
                   UserCourse userCourse=userCourseDAO.findByUserAndCourse(user.getId(),Integer.parseInt(courseid));
                   try {
                       userCourseDAO.delete(userCourse.getId());
                       session.setAttribute("success", "Delete user in course successfully");
                   } catch (Exception e) {
                       session.setAttribute("error", "Error while deleting user in course");
                   }
               }
           }
           response.sendRedirect("/dashboard/courses");
       }else{
           request.getRequestDispatcher("/404notfound/index.jsp").forward(request, response);
       }
    }

    public void destroy() {
    }
}