package controller.Student.CourseController;

import dal.CourseCommentDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.CourseComment;
import model.User;

import java.io.IOException;

@WebServlet(name = "UpdateCourseCommentOfServlet", value = "/update-comment-of-course")
public class UpdateComment extends HttpServlet {
    private String message;
    private CourseCommentDAO courseCommentDAO;

    public void init() {
        message = "Hello World!";
        courseCommentDAO = new CourseCommentDAO();
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        if(request.getParameter("id")!=null){
            String idStr=request.getParameter("id");
            HttpSession session=request.getSession();
            try{
                int id=Integer.parseInt(idStr);
                CourseComment courseComment = courseCommentDAO.get(id);

                request.setAttribute("coursecomments", courseComment);
                request.getRequestDispatcher("Status/update-status.jsp").forward(request, response);
            }catch (Exception e){

            }


        }else{
            request.getRequestDispatcher("/404notfound/index.jsp").forward(request, response);
        }
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String id= request.getParameter("id");
        String courseId = request.getParameter("courseid");
        String content = request.getParameter("comment");
        HttpSession session=request.getSession();
        User user=(User)session.getAttribute("user");
        try{
            courseCommentDAO.update(
                    new CourseComment(
                            Integer.parseInt(id),
                            Integer.parseInt(courseId),
                            user.getId(),
                            content
                    )
            );

            session.setAttribute("success","Update comment successfully");
        }catch(Exception e){
            session.setAttribute("error","Error while updating comment");
        }
        response.sendRedirect("/detail-course?id=" + courseId);

    }

    public void destroy() {
    }
}