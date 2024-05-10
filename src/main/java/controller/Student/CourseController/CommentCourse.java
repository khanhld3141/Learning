package controller.Student.CourseController;

import java.io.*;

import dal.CourseCommentDAO;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.CourseComment;
import model.LessionComment;
import model.User;
@MultipartConfig
@WebServlet(name = "CommentCourseServlet", value = "/comment-course")
public class CommentCourse extends HttpServlet {
    private String message;
    private CourseCommentDAO courseCommentDAO;
    public void init() {
        message = "Hello World!";
        courseCommentDAO=new CourseCommentDAO();
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("text/html");

        // Hello
        PrintWriter out = response.getWriter();
        out.println("<html><body>");
        out.println("<h1>" + message + "</h1>");
        out.println("</body></html>");
    }
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String courseid=request.getParameter("courseid");
        String comment=request.getParameter("comment");
        HttpSession session=request.getSession();
        try{
            User user=(User) session.getAttribute("user");

            courseCommentDAO.create(new CourseComment(
                    Integer.parseInt(courseid),
                    user.getId(),
                    comment
            ));
            response.sendRedirect("/detail-course?id="+courseid);
        }catch (Exception e){
            e.printStackTrace();
        }
    }


    public void destroy() {
    }
}