package controller.LessionCommentController;

import dal.CourseCommentDAO;
import dal.LessionCommentDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.CourseComment;
import model.LessionComment;

import java.io.IOException;

@WebServlet(name = "CreateCourseCommentServlet", value = "/create-lession-comment")
public class CreateLessionComment extends HttpServlet {
    private String message;
    private LessionCommentDAO lessionCommentDAO;

    public void init() {
        message = "Hello World!";
        lessionCommentDAO = new LessionCommentDAO();
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        request.getRequestDispatcher("Banner/create-course-comment.jsp").forward(request, response);
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String lessionId = request.getParameter("lessionid");
        String authorId = request.getParameter("authorid");
        String parentId=request.getParameter("parentid");
        String content = request.getParameter("content");

        lessionCommentDAO.create(new LessionComment(
                Integer.parseInt(lessionId),
                Integer.parseInt(authorId),
                Integer.parseInt(parentId),
                content
        ));

        request.setAttribute("message", "Add new status successfully");
        response.sendRedirect("/comments-course");

    }

    public void destroy() {
    }
}