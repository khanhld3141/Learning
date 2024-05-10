package controller.Admin.OverviewController;

import java.io.*;
import java.util.List;

import dal.CategoryDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.Category;

@WebServlet(name = "GetOverviewServlet", value = "/dashboard")
public class GetOverview extends HttpServlet {
    private String message;
    private CategoryDAO categoryDAO;

    public void init() {
        message = "Hello World!";
        categoryDAO=new CategoryDAO();
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {


        List<Category> categories=categoryDAO.getWithNumberOfCourses();

        request.setAttribute("categories",categories);

        request.getRequestDispatcher("/dashboard/index.jsp").forward(request,response);
    }

    public void destroy() {
    }
}