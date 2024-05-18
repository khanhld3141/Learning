package controller.Student.CourseController;

import java.io.*;
import java.util.List;

import dal.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.*;

@WebServlet(name = "DetailCourseServlet", value = "/detail-course")
public class DetailCourse extends HttpServlet {
    private String message;
    private CourseDAO courseDAO;
    private CourseCommentDAO courseCommentDAO;
    private CategoryDAO categoryDAO;
    private ChapterDAO chapterDAO;
    private LessionDAO lessionDAO;
    private UserCourseDAO userCourseDAO;

    public void init() {
        message = "Hello World!";
        courseDAO = new CourseDAO();
        courseCommentDAO = new CourseCommentDAO();
        categoryDAO = new CategoryDAO();
        chapterDAO = new ChapterDAO();
        lessionDAO = new LessionDAO();
        userCourseDAO = new UserCourseDAO();
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        if (request.getParameter("id") != null) {
            try {
                int id = Integer.parseInt(request.getParameter("id"));
                Course course = courseDAO.get(id);

                List<Chapter> chapters = chapterDAO.getAllChapters(id);

                for (int i = 0; i < chapters.size(); i++) {
                    List<Lession> lessions = lessionDAO.getAllLessionsPreview(chapters.get(i).getId());
                    chapters.get(i).setLessions(lessions);
                }

                course.setChapters(chapters);
                request.setAttribute("course", course);

                List<CourseComment> comments = courseCommentDAO.getAllCourseComments(id);
                request.setAttribute("comments", comments);

                List<Course> recentcourse = courseDAO.getAllCourses(1, 3);
                request.setAttribute("coursesrecent", recentcourse);

                List<Category> categories = categoryDAO.getWithNumberOfCourses();
                request.setAttribute("categories", categories);
                List<Course> courses = courseDAO.getCourseByCate(1, 10, course.getCateId());
                request.setAttribute("courses", courses);

                HttpSession session = request.getSession();
                User user = (User) session.getAttribute("user");
                if (user != null) {
                    List<UserCourse> userCourses = userCourseDAO.getStudentCourse(user.getId());
                    request.setAttribute("usercourse", userCourses);
                }
                request.getRequestDispatcher("/Courses_details/index.jsp").forward(request, response);
            } catch (Exception e) {
                request.getRequestDispatcher("/404notfound/index.jsp").forward(request, response);
                e.printStackTrace();
            }


        }else{
            request.getRequestDispatcher("/404notfound/index.jsp").forward(request, response);
        }
    }

    public void destroy() {
    }
}