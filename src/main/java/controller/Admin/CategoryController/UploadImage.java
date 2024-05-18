package controller.Admin.CategoryController;

import java.io.*;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.UUID;

import com.google.gson.Gson;
import controller.Ulti.FileUploadUtil;
import dal.CategoryDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.Category;
import model.User;

@MultipartConfig
@WebServlet(name = "UploadImageServlet", value = "/upload-category")
public class UploadImage extends HttpServlet {
    private String message;
    private CategoryDAO categoryDAO;

    public void init() {
        message = "Hello World!";
        categoryDAO = new CategoryDAO();
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("text/html");

        // Hello
        PrintWriter out = response.getWriter();
        out.println("<html><body>");
        out.println("<h1>" + message + "</h1>");
        out.println("</body></html>");
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String realPath = request.getServletContext().getRealPath("/images");
            String categoryId = request.getParameter("id");
            //create
            Part photo = request.getPart("image");
            String filename = FileUploadUtil.uploadFile(photo, realPath);

            Category category = categoryDAO.get(Integer.parseInt(categoryId));
            category.setImage(filename);
            categoryDAO.update(category);
            Gson gson = new Gson();
            String jsonfile = gson.toJson(filename);
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            PrintWriter out = response.getWriter();
            out.print(jsonfile  );
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void destroy() {
    }
}