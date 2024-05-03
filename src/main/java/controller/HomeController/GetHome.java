package controller.HomeController;

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

    public void init() {
        message = "Hello World!";
        categoryDAO = new CategoryDAO();
        courseDAO = new CourseDAO();
        bannerDAO = new BannerDAO();
        postDAO = new PostDAO();
        userCourseDAO = new UserCourseDAO();
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        List<Category> categories = categoryDAO.getAllCategorys();
        request.setAttribute("categories", categories);
        List<Course> courses = courseDAO.getAllCourses(1, 10);
        for (int i = 0; i < courses.size(); i++) {
            List<User> users=userCourseDAO.getCountStudent(courses.get(i).getId());
            courses.get(i).setStudents(users);
        }
        request.setAttribute("courses", courses);
        List<Banner> banners = bannerDAO.getAllBanners();
        request.setAttribute("banners", banners);
        List<Post> posts = postDAO.getAllPosts();
        request.setAttribute("posts", posts);
        request.getRequestDispatcher("/Home/index.jsp").forward(request, response);
    }

    public void destroy() {
    }
}