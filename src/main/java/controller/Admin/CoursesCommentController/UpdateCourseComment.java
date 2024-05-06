package controller.Admin.CoursesCommentController;

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

@WebServlet(name = "UpdateCourseCommentServlet", value = "/update-course-comment")
public class UpdateCourseComment extends HttpServlet {
    private String message;
    private CourseCommentDAO courseCommentDAO;

    public void init() {
        message = "Hello World!";
        courseCommentDAO = new CourseCommentDAO();
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        if(request.getParameter("id")!=null){
            String idStr=request.getParameter("id");
            try{
                int id=Integer.parseInt(idStr);
                CourseComment courseComment = courseCommentDAO.get(id);

                request.setAttribute("coursecomments", courseComment);
                request.getRequestDispatcher("Status/update-status.jsp").forward(request, response);
            }catch (Exception e){
                e.printStackTrace();
            }


        }
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String id= request.getParameter("id");
        String courseId = request.getParameter("courseid");
        String authorId=request.getParameter("authorid");
        String content = request.getParameter("content");

        courseCommentDAO.update(
                new CourseComment(
                        Integer.parseInt(id),
                        Integer.parseInt(courseId),
                        Integer.parseInt(authorId),
                        content
                )
        );

        request.setAttribute("message", "Update category successfully");
        response.sendRedirect("/comments-course");

    }

    public void destroy() {
    }
}