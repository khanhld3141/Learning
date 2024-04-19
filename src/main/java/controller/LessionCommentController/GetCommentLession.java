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
import java.util.List;

@WebServlet(name = "GetCommentCourse", value = "/comments-lession")
public class GetCommentLession extends HttpServlet {
    private String message;
    private LessionCommentDAO lessionCommentDAO;

    public void init() {
        message = "Hello World!";
        lessionCommentDAO = new LessionCommentDAO();
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        List<LessionComment> lists = lessionCommentDAO.getAllLessionComments();
        request.setAttribute("lessioncomments", lists);
        request.getRequestDispatcher("Status/index.jsp").forward(request, response);
    }

    public void destroy() {
    }
}