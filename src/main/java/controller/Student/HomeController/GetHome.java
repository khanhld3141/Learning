package controller.Student.HomeController;

import java.io.*;
import java.util.List;

import dal.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.*;

@WebServlet(name = "GetHomeServlet", value = "/home")
public class GetHome extends HttpServlet {
    private String message;
    private CategoryDAO categoryDAO;
    private CourseDAO courseDAO;
    private BannerDAO bannerDAO;
    private PostDAO postDAO;
    private UserCourseDAO userCourseDAO;
    private UserDAO userDAO;

    public void init() {
        message = "Hello World!";
        categoryDAO = new CategoryDAO();
        courseDAO = new CourseDAO();
        bannerDAO = new BannerDAO();
        postDAO = new PostDAO();
        userCourseDAO = new UserCourseDAO();
        userDAO=new UserDAO();
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        List<Category> categories = categoryDAO.getAllCategorys();
        request.setAttribute("categories", categories);
        List<Course> courses = courseDAO.getAllCoursesHome();
        for (int i = 0; i < courses.size(); i++) {
            List<User> users=userCourseDAO.getCountStudent(courses.get(i).getId());
            courses.get(i).setStudents(users);
        }
        int count=userCourseDAO.Count();
        List<User> teachers=userDAO.getAllTeacher();
        request.setAttribute("teachers", teachers);
        request.setAttribute("countStudent", count);
        request.setAttribute("courses", courses);
        List<Banner> banners = bannerDAO.getAllBanners();
        request.setAttribute("banners", banners);
        List<Post> posts = postDAO.getAllPosts(1,10);
        request.setAttribute("posts", posts);
        request.getRequestDispatcher("/Home/index.jsp").forward(request, response);
    }

    public void destroy() {
    }
}