package controller.StatusController;

import dal.CategoryDAO;
import dal.StatusDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "DeleteStatusServlet", value = "/delete-status")
public class DeleteStatus extends HttpServlet {
    private String message;
    private StatusDAO statusDAO;

    public void init() {
        message = "Hello World!";
        statusDAO = new StatusDAO();
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        if (request.getParameter(("id")) != null) {
            String idStr = request.getParameter(("id"));

            try {
                int id = Integer.parseInt(idStr);
                statusDAO.delete(id);
                response.sendRedirect("/statuss");
            } catch (Exception e) {
                e.printStackTrace();
            }
        } else {
            request.setAttribute("message", "Missing parameter id");
            request.getRequestDispatcher("/statuss").forward(request, response);
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