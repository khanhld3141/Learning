package controller.Admin.LessionCommentController;

import dal.CourseCommentDAO;
import dal.LessionCommentDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "DeleteCourseCommentServlet", value = "/delete-lession-comment")
public class DeleteLessionComment extends HttpServlet {
    private String message;
    private LessionCommentDAO lessionCommentDAO;

    public void init() {
        message = "Hello World!";
        lessionCommentDAO = new LessionCommentDAO();
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        if (request.getParameter(("id")) != null) {
            String idStr = request.getParameter(("id"));

            try {
                int id = Integer.parseInt(idStr);
                lessionCommentDAO.delete(id);
                response.sendRedirect("/comments-lession");
            } catch (Exception e) {
                e.printStackTrace();
            }
        } else {
            request.setAttribute("message", "Missing parameter id");
            request.getRequestDispatcher("/comments-lession").forward(request, response);
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