package controller.CategoryController;

import controller.Ulti.FileUploadUtil;
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

@WebServlet(name = "UpdateCategoryServlet", value = "/dashboard/update-category")
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
        Part image = request.getPart("image");
        String realPath = request.getServletContext().getRealPath("/images");
        String filename = FileUploadUtil.uploadFile(image, realPath);

        try{
            Category category =categoryDAO.get(Integer.parseInt(id));
//            FileUploadUtil.deleteFile(realPath, category.getImage());
            categoryDAO.update(new Category(Integer.parseInt(id),name,filename));

            request.setAttribute("message", "Update category successfully");
            response.sendRedirect("/dashboard/categories");
        }catch(Exception e){

        }

    }

    public void destroy() {
    }
}