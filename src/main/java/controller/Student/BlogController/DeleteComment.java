package controller.Student.BlogController;

import dal.CourseCommentDAO;
import dal.PostCommentDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "DeleteCommentOfPostServlet", value = "/delete-comment-of-post")
public class DeleteComment extends HttpServlet {
    private String message;
    private PostCommentDAO postCommentDAO;

    public void init() {
        message = "Hello World!";
        postCommentDAO = new PostCommentDAO();
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String idStr = request.getParameter(("id"));
        String blogid = request.getParameter(("blogid"));
        if (request.getParameter(("id")) != null) {
            try {
                int id = Integer.parseInt(idStr);
                postCommentDAO.delete(id);
                response.sendRedirect("/detail-blog?id=" + blogid);
            } catch (Exception e) {
                e.printStackTrace();
            }
        } else {
            response.sendRedirect("/detail-blog?id=" + blogid);
        }
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("text/html");

        // Hello
        PrintWriter out = response.getWriter();
        out.println("<html><body>");
        out.println("<h1>" + message + "</h1>");
        out.println("</body></html>");
    }

    public void destroy() {
    }
}