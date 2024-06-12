package controller.Admin.CategoryController;

import controller.Ulti.FileUploadUtil;
import dal.CategoryDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import model.Category;

import java.io.IOException;
@MultipartConfig()
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
        String filename = FileUploadUtil.uploadFile(image, realPath);
        HttpSession session=request.getSession();

        try{
            categoryDAO.create(new Category(name,filename));
            session.setAttribute("success","Add new Category successfully");

        }catch(Exception e){
            session.setAttribute("error","Error while creating new Category");
        }
        response.sendRedirect("/dashboard/categories");


    }

    public void destroy() {
    }
}