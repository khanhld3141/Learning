package controller.CategoryController;

import dal.BannerDAO;
import dal.CategoryDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Banner;
import model.Category;

import java.io.IOException;

@WebServlet(name = "CreateCategoryServlet", value = "/create-category")
public class CreateCategory extends HttpServlet {
    private String message;
    private CategoryDAO categoryDAO;
    public void init() {
        message = "Hello World!";
        categoryDAO=new CategoryDAO();
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        request.getRequestDispatcher("Banner/create-category.jsp").forward(request, response);
    }
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String name = request.getParameter("name");
        String image = request.getParameter("image");
        categoryDAO.create(new Category(name,image));

        request.setAttribute("message","Add new category successfully");
        response.sendRedirect("/categories");

    }

    public void destroy() {
    }
}