package controller.Admin.CoursesCommentController;

import dal.CourseCommentDAO;
import dal.StatusDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.CourseComment;
import model.Status;

import java.io.IOException;

@WebServlet(name = "CreateCourseCommentServlet", value = "/create-course-comment")
public class CreateCourseComment extends HttpServlet {
    private String message;
    private CourseCommentDAO courseCommentDAO;
    public void init() {
        message = "Hello World!";
        courseCommentDAO=new CourseCommentDAO();
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        request.getRequestDispatcher("Banner/create-course-comment.jsp").forward(request, response);
    }
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String courseId = request.getParameter("courseid");
        String authorId=request.getParameter("authorid");
        String content = request.getParameter("content");
        HttpSession session=request.getSession();
        try{
            courseCommentDAO.create(new CourseComment(
                    Integer.parseInt(courseId),
                    Integer.parseInt(authorId),
                    content
            ));

           session.setAttribute("success","Create new Comment of Course successfully");

        }catch(Exception e){
            session.setAttribute("error","Error while creating new Comment of Course");

        }
        response.sendRedirect("/comments-course");

    }

    public void destroy() {
    }
}