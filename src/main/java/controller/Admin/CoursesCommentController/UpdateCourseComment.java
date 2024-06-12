package controller.Admin.CoursesCommentController;

import dal.CourseCommentDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.CourseComment;

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


        }else{
            request.getRequestDispatcher("/4040notfound/index.jsp").forward(request, response);
        }
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String id= request.getParameter("id");
        String courseId = request.getParameter("courseid");
        String authorId=request.getParameter("authorid");
        String content = request.getParameter("content");
        HttpSession session=request.getSession();
        try{

            courseCommentDAO.update(
                    new CourseComment(
                            Integer.parseInt(id),
                            Integer.parseInt(courseId),
                            Integer.parseInt(authorId),
                            content
                    )
            );

            session.setAttribute("success","Update Comment of Course successfully");

        }catch (Exception e){
            session.setAttribute("error", "Error while updating Comment of Course");
        }
        response.sendRedirect("/comments-course");

    }

    public void destroy() {
    }
}