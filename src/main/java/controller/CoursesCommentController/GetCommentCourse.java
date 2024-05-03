package controller.CoursesCommentController;

import dal.CourseCommentDAO;
import dal.StatusDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.CourseComment;
import model.Status;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "GetCommentCourse", value = "/comments-course")
public class GetCommentCourse extends HttpServlet {
    private String message;
    private CourseCommentDAO courseCommentDAO;

    public void init() {
        message = "Hello World!";
        courseCommentDAO = new CourseCommentDAO();
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        if(request.getParameter("id")!=null){
            String id = request.getParameter("id");
            List<CourseComment> lists = courseCommentDAO.getAllCourseComments(Integer.parseInt(id));
            request.setAttribute("coursecomments", lists);
            request.getRequestDispatcher("Status/index.jsp").forward(request, response);
        }
    }

    public void destroy() {
    }
}