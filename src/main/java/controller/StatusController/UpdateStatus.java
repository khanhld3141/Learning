package controller.StatusController;

import dal.CategoryDAO;
import dal.StatusDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Category;
import model.Status;

import java.io.IOException;

@WebServlet(name = "UpdateStatusServlet", value = "/update-status")
public class UpdateStatus extends HttpServlet {
    private String message;
    private StatusDAO statusDAO;

    public void init() {
        message = "Hello World!";
        statusDAO = new StatusDAO();
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        if(request.getParameter("id")!=null){
            String idStr=request.getParameter("id");
            try{
                int id=Integer.parseInt(idStr);
                Status status= statusDAO.get(id);

                request.setAttribute("status", status);
                request.getRequestDispatcher("Status/update-status.jsp").forward(request, response);
            }catch (Exception e){
                e.printStackTrace();
            }


        }
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String id= request.getParameter("id");
        String name = request.getParameter("name");

        statusDAO.update(new Status(Integer.parseInt(id),name));

        request.setAttribute("message", "Update category successfully");
        response.sendRedirect("/categories");

    }

    public void destroy() {
    }
}