package controller.Admin.StatusController;

import dal.CategoryDAO;
import dal.StatusDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Category;
import model.Status;

import java.io.IOException;

@WebServlet(name = "CreateStatusServlet", value = "/create-status")
public class CreateStatus extends HttpServlet {
    private String message;
    private StatusDAO statusDAO;
    public void init() {
        message = "Hello World!";
        statusDAO=new StatusDAO();
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        request.getRequestDispatcher("Banner/create-category.jsp").forward(request, response);
    }
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String name = request.getParameter("name");

        statusDAO.create(new Status(name));

        request.setAttribute("message","Add new status successfully");
        response.sendRedirect("/statuss");

    }

    public void destroy() {
    }
}