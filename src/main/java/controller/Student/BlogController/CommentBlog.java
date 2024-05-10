package controller.Student.BlogController;

import java.io.*;

import dal.PostCommentDAO;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.CourseComment;
import model.PostComment;
import model.User;

@WebServlet(name = "CommentBlogServlet", value = "/comment-blog")
public class CommentBlog extends HttpServlet {
    private String message;
    private PostCommentDAO postCommentDAO;
    public void init() {
        message = "Hello World!";
        postCommentDAO=new PostCommentDAO();
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
        String postid=request.getParameter("postid");
        String comment=request.getParameter("comment");
        HttpSession session=request.getSession();
        try{
            User user=(User) session.getAttribute("user");

            postCommentDAO.create(new PostComment(
                    user.getId(),
                    Integer.parseInt(postid),
                    0,
                    comment
            ));
            response.sendRedirect("/detail-blog?id="+postid);
        }catch (Exception e){
            e.printStackTrace();
        }
    }
    public void destroy() {
    }
}