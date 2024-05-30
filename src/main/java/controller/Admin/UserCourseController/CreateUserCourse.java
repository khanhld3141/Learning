package controller.Admin.UserCourseController;

import java.io.*;

import dal.UserCourseDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.UserCourse;

@WebServlet(name = "CreateUserCourseServlet", value = "/create-user-course")
public class CreateUserCourse extends HttpServlet {
    private String message;
    private UserCourseDAO userCourseDAO;
    public void init() {
        message = "Hello World!";
        userCourseDAO=new UserCourseDAO();
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
        String userid=request.getParameter("userid");
        String courseid=request.getParameter("courseid");
        HttpSession session=request.getSession();
        try{
            userCourseDAO.create(new UserCourse(
                    Integer.parseInt(userid),
                    Integer.parseInt(courseid)
            ));
            session.setAttribute("success","Add new user to courses successfully");
        }catch(Exception e){
            session.setAttribute("error","Error while add new user to courses");
        }
        response.sendRedirect("/dashboard/courses");
    }

    public void destroy() {
    }
}