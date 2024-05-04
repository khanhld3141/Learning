package controller.PostController;

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
            try {
                int id = Integer.parseInt(idStr);
                postDAO.delete(id);
                response.sendRedirect("/dashboard/posts");
            } catch (Exception e) {
                e.printStackTrace();
            }
        } else {
            request.setAttribute("message", "Missing parameter id");
            request.getRequestDispatcher("/statuss").forward(request, response);
        }
    }

    public void destroy() {
    }
}