package controller.Admin.UserCourseController;

import java.io.*;

import dal.UserCourseDAO;
import dal.UserDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.User;
import model.UserCourse;

@WebServlet(name = "CreateUserCourseServlet", value = "/create-user-course")
public class CreateUserCourse extends HttpServlet {
    private String message;
    private UserCourseDAO userCourseDAO;
    private UserDAO userDAO;
    public void init() {
        message = "Hello World!";
        userCourseDAO=new UserCourseDAO();
        userDAO=new UserDAO();
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("text/html");

        // Hello
        PrintWriter out = response.getWriter();
        out.println("<html><body>");
        out.println("<h1>" + message + "</h1>");
        out.println("</body></html>");
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String email=request.getParameter("email");
        String courseid=request.getParameter("courseid");
        HttpSession session=request.getSession();
        if(userDAO.getByEmail(email)!=null){
            User user=userDAO.getByEmail(email);
            if(userCourseDAO.findByUserAndCourse(user.getId(),Integer.parseInt(courseid))!=null){
                session.setAttribute("error","User is exist in course");
            }else{
                try{

                    userCourseDAO.create(new UserCourse(
                            user.getId(),
                            Integer.parseInt(courseid)
                    ));
                    session.setAttribute("success","Add new user to courses successfully");
                }catch(Exception e){
                    session.setAttribute("error","Error while add new user to courses");
                }
            }

            response.sendRedirect("/dashboard/courses");
        }else{
            session.setAttribute("error","Email is invalid");
            response.sendRedirect("/dashboard/courses");
        }

    }

    public void destroy() {
    }
}