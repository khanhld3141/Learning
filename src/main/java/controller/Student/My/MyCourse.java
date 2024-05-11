package controller.Student.My;

import java.io.*;
import java.util.List;

import dal.CourseDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.Course;
import model.User;

@WebServlet(name = "MyCourseServlet", value = "/my-courses")
public class MyCourse extends HttpServlet {
    private String message;
    private CourseDAO courseDAO;

    public void init() {
        message = "Hello World!";
        courseDAO=new CourseDAO();
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        HttpSession session =request.getSession();
        User user =(User)session.getAttribute("user");
        try{
            List<Course> courses = courseDAO.getAllCourseOfUser(user.getId());
            request.setAttribute("courses", courses);

            request.getRequestDispatcher("/my/my-courses.jsp").forward(request, response);
        }catch (Exception e){
            request.getRequestDispatcher("/404notfound/index.jsp").forward(request, response);
        }



    }

    public void destroy() {
    }
}