package controller.Admin.UserController;

import dal.UserDAO;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name = "DeleteUserServlet", value = "/dashboard/delete-user")
public class DeleteUser extends HttpServlet {
    private String message;
    private UserDAO userDAO;
    public void init() {
        message = "Hello World!";
        userDAO = new UserDAO();
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        if(request.getParameter(("id"))!=null){
            String idStr=request.getParameter(("id"));
            try{
                int id = Integer.parseInt(idStr);
                userDAO.delete(id);
                response.sendRedirect("/dashboard/users");
            }catch (Exception e){
                e.printStackTrace();
            }
        }
    }

    public void destroy() {
    }
}