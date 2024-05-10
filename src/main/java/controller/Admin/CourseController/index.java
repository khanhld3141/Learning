package controller.Admin.CourseController;

import java.io.*;
import java.util.List;

import dal.CourseDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.Course;

@WebServlet(name = "courseIndexServler", value = "/dashboard/courses")
public class index extends HttpServlet {
    private String message;
    private CourseDAO courseDAO;

    public void init() {
        message = "Hello World!";
        courseDAO = new CourseDAO();
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        int currentPage = 1;
        if (request.getParameter("page") != null) {
            currentPage = Integer.parseInt(request.getParameter("page"));
        }
        String query = "";
        if(request.getParameter("query") != null){
            query=request.getParameter("query");
        }
        List<Course> courses = courseDAO.searchByName(currentPage,10,query);
        request.setAttribute("courses", courses);
        request.getRequestDispatcher("/dashboard_courses/index.jsp").forward(request, response);
    }

    public void destroy() {
    }
}