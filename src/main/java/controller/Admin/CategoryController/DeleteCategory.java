package controller.Admin.CategoryController;

import controller.Ulti.FileUploadUtil;
import dal.CategoryDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Category;

import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "DeleteCategoryServlet", value = "/dashboard/delete-category")
public class DeleteCategory extends HttpServlet {
    private String message;
    private CategoryDAO CategoryDAO;

    public void init() {
        message = "Hello World!";
        CategoryDAO = new CategoryDAO();
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        if (request.getParameter(("id")) != null) {
            String idStr = request.getParameter(("id"));
            HttpSession session=request.getSession();


            try {
                int id = Integer.parseInt(idStr);
                Category category = CategoryDAO.get(id);
                String realPath = request.getServletContext().getRealPath("/images");
                FileUploadUtil.deleteFile(realPath, category.getImage());
                CategoryDAO.delete(id);
                session.setAttribute("success","Delete Category successfully");
            } catch (Exception e) {
                session.setAttribute("error","Error while deleting Category");
            }
            response.sendRedirect("/dashboard/categories");
        } else {
            request.getRequestDispatcher("/404notfound/index.jsp").forward(request,response);
        }
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("text/html");

        // Hello
        PrintWriter out = response.getWriter();
        out.println("<html><body>");
        out.println("<h1>" + message + "</h1>");
        out.println("</body></html>");
    }

    public void destroy() {
    }
}