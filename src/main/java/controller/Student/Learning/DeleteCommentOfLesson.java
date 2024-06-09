package controller.Student.Learning;

import java.io.*;

import dal.LessionCommentDAO;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.User;
@MultipartConfig
@WebServlet(name = "DeleteCommentOfLessonServlet", value = "/delete-comment-of-lesson")
public class DeleteCommentOfLesson extends HttpServlet {
    private String message;
    private LessionCommentDAO lessionCommentDAO;

    public void init() {
        message = "Hello World!";
        lessionCommentDAO=new LessionCommentDAO();
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String idStr = request.getParameter(("id"));
        String courseid = request.getParameter(("courseid"));
        HttpSession session=request.getSession();

        if (request.getParameter(("id")) != null) {
            try {
                int id = Integer.parseInt(idStr);
                lessionCommentDAO.delete(id);
                session.setAttribute("success","Delete Comment successfully");

            } catch (Exception e) {
                session.setAttribute("error","Delete Comment failed");
                e.printStackTrace();
            }
        } else {
            response.sendRedirect("/learning?courseid=" + courseid);
        }
    }

    public void destroy() {
    }
}