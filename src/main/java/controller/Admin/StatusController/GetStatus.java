package controller.Admin.StatusController;

import dal.StatusDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Status;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "IndexStatusServlet", value = "/statuss")
public class GetStatus extends HttpServlet {
    private String message;
    private StatusDAO statusDAO;

    public void init() {
        message = "Hello World!";
        statusDAO = new StatusDAO();
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        List<Status> lists = statusDAO.getAllStatuss();
        request.setAttribute("statuss", lists);
        request.getRequestDispatcher("Status/index.jsp").forward(request, response);
    }

    public void destroy() {
    }
}