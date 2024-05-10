package controller.Admin.CategoryController;

import dal.CategoryDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Category;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "GetCategory", value = "/dashboard/categories")
public class GetCategory extends HttpServlet {
    private String message;
    private CategoryDAO categoryDAO;

    public void init() {
        message = "Hello World!";
        categoryDAO = new CategoryDAO();
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        int page=1;
        if(request.getParameter("page") != null){
            try{
                page=Integer.parseInt(request.getParameter("page"));
            }catch(Exception e){
                e.printStackTrace();
            }
        }
        List<Category> lists = categoryDAO.getAllCategoryPaging(page,10);
        request.setAttribute("categories", lists);

        request.getRequestDispatcher("/dashboard-category/index.jsp").forward(request, response);
    }

    public void destroy() {
    }
}