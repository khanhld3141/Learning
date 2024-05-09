package controller.Student.Learning;

import java.io.*;

import dal.LessionCommentDAO;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.LessionComment;
import model.User;

@MultipartConfig
@WebServlet(name = "PostCommentLessonServlet", value = "/post-comment")
public class PostCommentLesson extends HttpServlet {
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
       String lessonid=request.getParameter("lessonid");
       String content=request.getParameter("content");
       HttpSession session=request.getSession();
       try{
           User user=(User) session.getAttribute("user");

           lessionCommentDAO.create(new LessionComment(
                   Integer.parseInt(lessonid),
                   user.getId(),
                   0,
                   content
           ));


       }catch (Exception e){
           e.printStackTrace();
       }
    }


    public void destroy() {
    }
}