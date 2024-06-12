package controller.Student.Learning;

import java.io.*;

import dal.LessionCommentDAO;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.LessionComment;
import model.User;

@MultipartConfig
@WebServlet(name = "UpdateCommentOfLessonServlet", value = "/update-comment-of-lesson")
public class UpdateCommentOfLesson extends HttpServlet {
    private String message;
    private LessionCommentDAO lessionCommentDAO;
    public void init() {
        message = "Hello World!";
        lessionCommentDAO=new LessionCommentDAO();
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
        String content = request.getParameter("content");
        String id=request.getParameter("id");
        HttpSession session = request.getSession();
        try {
            LessionComment lessionComment=lessionCommentDAO.get(Integer.parseInt(id));
            if(lessionComment!=null){
               lessionComment.setContent(content);
               lessionCommentDAO.update(lessionComment);
            }


        } catch (Exception e) {

        }
    }

    public void destroy() {
    }
}