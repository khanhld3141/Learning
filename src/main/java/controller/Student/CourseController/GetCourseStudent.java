package controller.Student.CourseController;

import java.io.*;
import java.util.ArrayList;
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
        userCourseDAO = new UserCourseDAO();
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        int currentPage = 1;
        List<Course> courses = new ArrayList<>();
        if (request.getParameter("category") != null) {
            int cateid =Integer.parseInt(request.getParameter("category"));
            courses = courseDAO.getCourseByCate(currentPage, 10,cateid);
            for (int i = 0; i < courses.size(); i++) {
                List<User> users = userCourseDAO.getCountStudent(courses.get(i).getId());
                courses.get(i).setStudents(users);
            }
        } else {

            if (request.getParameter("page") != null) {
                currentPage = Integer.parseInt(request.getParameter("page"));
            }
            String query = "";
            if (request.getParameter("query") != null) {
                query = request.getParameter("query");
            }
            courses = courseDAO.searchByName(currentPage, 10, query);
            for (int i = 0; i < courses.size(); i++) {
                List<User> users = userCourseDAO.getCountStudent(courses.get(i).getId());
                courses.get(i).setStudents(users);
            }
        }
        request.setAttribute("courses", courses);
        request.getRequestDispatcher("/Courses/index.jsp").forward(request, response);

    }

    public void destroy() {
    }
}