package controller.CategoryController;

import dal.CategoryDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Banner;
import model.Category;

import java.io.IOException;

@WebServlet(name = "UpdateCategoryServlet", value = "/update-category")
public class UpdateCategory extends HttpServlet {
    private String message;
    private CategoryDAO categoryDAO;

    public void init() {
        message = "Hello World!";
        categoryDAO = new CategoryDAO();
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        if(request.getParameter("id")!=null){
            String idStr=request.getParameter("id");
            try{
                int id=Integer.parseInt(idStr);
                Category category= categoryDAO.get(id);

                request.setAttribute("category", category);
                request.getRequestDispatcher("Category/create-category.jsp").forward(request, response);
            }catch (Exception e){
                e.printStackTrace();
            }


        }
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String id= request.getParameter("id");
        String name = request.getParameter("name");
        String image = request.getParameter("image");
        categoryDAO.update(new Category(Integer.parseInt(id),name,image));

        request.setAttribute("message", "Update category successfully");
        response.sendRedirect("/categories");

    }

    public void destroy() {
    }
}