package controller.CourseController;

import java.io.*;
import java.util.List;

import dal.CourseDAO;
import dal.UserCourseDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.Course;
import model.User;

@WebServlet(name = "GetCourseStudentServlet", value = "/courses")
public class GetCourseStudent extends HttpServlet {
    private String message;
    private CourseDAO courseDAO;
    private UserCourseDAO userCourseDAO;

    public void init() {
        message = "Hello World!";
        courseDAO = new CourseDAO();
        userCourseDAO=new UserCourseDAO();
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        if(request.getParameter("id")!=null){
            Course course=courseDAO.get(Integer.parseInt(request.getParameter("id")));
            request.setAttribute("course",course);
            request.getRequestDispatcher("/Courses_details/index.jsp").forward(request,response);
        }else{
            int currentPage = 1;
            if (request.getParameter("page") != null) {
                currentPage = Integer.parseInt(request.getParameter("page"));
            }
            List<Course> courses = courseDAO.getAllCourses(1, 10);
            for (int i = 0; i < courses.size(); i++) {
                List<User> users=userCourseDAO.getCountStudent(courses.get(i).getId());
                courses.get(i).setStudents(users);
            }
            request.setAttribute("courses", courses);
            request.getRequestDispatcher("/Courses/index.jsp").forward(request, response);
        }
    }

    public void destroy() {
    }
}