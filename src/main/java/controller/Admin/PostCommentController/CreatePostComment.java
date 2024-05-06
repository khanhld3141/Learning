package controller.Admin.PostCommentController;

import java.io.*;

import dal.PostCommentDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.PostComment;

@WebServlet(name = "CreatePostCommentServlet", value = "/dashboard/create-post-comment")
public class CreatePostComment extends HttpServlet {
    private String message;
    private PostCommentDAO postCommentDAO;

    public void init() {
        message = "Hello World!";
        postCommentDAO = new PostCommentDAO();
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("text/html");

        // Hello
        PrintWriter out = response.getWriter();
        out.println("<html><body>");
        out.println("<h1>" + message + "</h1>");
        out.println("</body></html>");
    }
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String authorid=request.getParameter("authorid");
        String postid=request.getParameter("postid");
        String content=request.getParameter("content");
        String idParent=request.getParameter("idparent");

        try{
            postCommentDAO.create(new PostComment(
                    Integer.parseInt(authorid),
                    Integer.parseInt(postid),
                    0,
                    content
            ));
            response.sendRedirect("");
        }catch(Exception e){
            request.setAttribute("error","Error");
            request.getRequestDispatcher("").forward(request,response);
        }
    }

    public void destroy() {
    }
}