package controller.Admin.PostController;

import java.io.*;

import dal.PostDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

@WebServlet(name = "DeletePostServlet", value = "/dashboard/delete-post")
public class DeletePost extends HttpServlet {
    private String message;
    private PostDAO postDAO;
    public void init() {
        message = "Hello World!";
        postDAO=new PostDAO();
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        if (request.getParameter(("id")) != null) {
            String idStr = request.getParameter(("id"));
            HttpSession session = request.getSession();
            try {
                int id = Integer.parseInt(idStr);
                postDAO.delete(id);
              session.setAttribute("success","Delete Post successfully");
            } catch (Exception e) {
                session.setAttribute("error","Error while deleting Post");
            }
            response.sendRedirect("/dashboard/posts");
        } else {
            request.getRequestDispatcher("/404notfound/index.jsp").forward(request, response);
        }
    }

    public void destroy() {
    }
}