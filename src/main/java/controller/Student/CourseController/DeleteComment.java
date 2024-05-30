package controller.Student.CourseController;

import dal.CourseCommentDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "DeleteCommentOfCourseServlet", value = "/delete-comment-of-course")
public class DeleteComment extends HttpServlet {
    private String message;
    private CourseCommentDAO courseCommentDAO;

    public void init() {
        message = "Hello World!";
        courseCommentDAO = new CourseCommentDAO();
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String idStr = request.getParameter(("id"));
        String courseId = request.getParameter(("courseid"));
        if (request.getParameter(("id")) != null) {
            HttpSession session=request.getSession();
            try {
                int id = Integer.parseInt(idStr);
                courseCommentDAO.delete(id);
                session.setAttribute("success","Delete comment successfully");
            } catch (Exception e) {
               session.setAttribute("error","Error while deleting comment");
            }
            response.sendRedirect("/detail-course?id=" + courseId);
        } else {
            request.getRequestDispatcher("/404notfound/index.jsp").forward(request,response);
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