package controller.Admin.OverviewController;

import java.io.*;
import java.util.List;

import dal.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.Category;
import model.Char;
import model.Revenue;
import model.User;

@WebServlet(name = "GetOverviewServlet", value = "/dashboard")
public class GetOverview extends HttpServlet {
    private String message;
    private CategoryDAO categoryDAO;
    private UserCourseDAO userCourseDAO;
    private UserDAO userDAO;
    private CourseDAO courseDAO;
    private PostDAO postDAO;
    public void init() {
        message = "Hello World!";
        categoryDAO=new CategoryDAO();
        userCourseDAO=new UserCourseDAO();
        userDAO=new UserDAO();
        courseDAO=new CourseDAO();
        postDAO=new PostDAO();
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {


        List<Category> categories=categoryDAO.getWithNumberOfCourses();
        List<Revenue> revenues=userCourseDAO.getRevenue();
        List<User> students=userDAO.getAllStudent();
        List<Char> coursesChar=courseDAO.getCourseChar();
        List<Char> postChar=postDAO.getPostChar();
        int countCourses=courseDAO.getCount();
        int countPosts=postDAO.getCount();

        request.setAttribute("countCourses",countCourses);
        request.setAttribute("countPosts",countPosts);
        request.setAttribute("courseChar",coursesChar);
        request.setAttribute("postChar",postChar);
        request.setAttribute("students",students);
        request.setAttribute("revenues",revenues);
        request.setAttribute("categories",categories);

        request.getRequestDispatcher("/dashboard/index.jsp").forward(request,response);
    }

    public void destroy() {
    }
}