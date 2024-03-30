package controller.UserController;

import dal.UsersDAO;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name = "DeleteUserServlet", value = "/delete-user")
public class DeleteUser extends HttpServlet {
    private String message;
    private UsersDAO usersDAO;
    public void init() {
        message = "Hello World!";
        usersDAO = new UsersDAO();
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        if(request.getParameter(("id"))!=null){
            String idStr=request.getParameter(("id"));

            try{
                int id = Integer.parseInt(idStr);
                usersDAO.delete(id);
                response.sendRedirect("/users");
            }catch (Exception e){
                e.printStackTrace();
            }
        }else{

        }
    }

    public void destroy() {
    }
}