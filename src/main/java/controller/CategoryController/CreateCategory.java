package controller.CategoryController;

import controller.Ulti.FileUploadUtil;
import dal.BannerDAO;
import dal.CategoryDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import model.Banner;
import model.Category;

import java.io.IOException;

@WebServlet(name = "CreateCategoryServlet", value = "/dashboard/create-category")
public class CreateCategory extends HttpServlet {
    private String message;
    private CategoryDAO categoryDAO;
    public void init() {
        message = "Hello World!";
        categoryDAO=new CategoryDAO();
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        request.getRequestDispatcher("/create-category.jsp").forward(request, response);
    }
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String name = request.getParameter("Name");
        Part image = request.getPart("Image");
        String realPath = request.getServletContext().getRealPath("/images");
        System.out.println(name + ": " + image);
        String filename = FileUploadUtil.uploadFile(image, realPath);

        try{
            categoryDAO.create(new Category(name,filename));
            request.setAttribute("message","Add new category successfully");
            response.sendRedirect("/dashboard/categories");
        }catch(Exception e){
            request.setAttribute("error", "Please enter chapter id");
            request.getRequestDispatcher("").forward(request, response);
        }


    }

    public void destroy() {
    }
}