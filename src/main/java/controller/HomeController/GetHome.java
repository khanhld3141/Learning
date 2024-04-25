package controller.HomeController;

import java.io.*;
import java.util.List;

import dal.BannerDAO;
import dal.CategoryDAO;
import dal.CourseDAO;
import dal.PostDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.Banner;
import model.Category;
import model.Course;
import model.Post;

@WebServlet(name = "GetHomeServlet", value = "/home")
public class GetHome extends HttpServlet {
    private String message;
    private CategoryDAO categoryDAO;
    private CourseDAO courseDAO;
    private BannerDAO bannerDAO;
    private PostDAO postDAO;
    public void init() {
        message = "Hello World!";
        categoryDAO = new CategoryDAO();
        courseDAO = new CourseDAO();
        bannerDAO=new BannerDAO();
        postDAO = new PostDAO();
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        List<Category> categories = categoryDAO.getAllCategorys();
        request.setAttribute("categories", categories);
        List<Course> courses = courseDAO.getAllCourses(1, 10);
        request.setAttribute("courses", courses);
        List<Banner> banners=bannerDAO.getAllBanners();
        request.setAttribute("banners", banners);
        List<Post> posts=postDAO.getAllPosts();
        request.setAttribute("posts", posts);
        request.getRequestDispatcher("/Home/index.jsp").forward(request, response);
    }

    public void destroy() {
    }
}