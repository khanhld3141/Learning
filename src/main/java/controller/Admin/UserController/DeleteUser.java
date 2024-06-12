package controller.Admin.UserController;

import dal.UserDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet(name = "DeleteUserServlet", value = "/dashboard/delete-user")
public class DeleteUser extends HttpServlet {
    private String message;
    private UserDAO userDAO;

    public void init() {
        message = "Hello World!";
        userDAO = new UserDAO();
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        if(request.getParameter(("id"))!=null){
            String idStr=request.getParameter(("id"));
            HttpSession session=request.getSession();
            try{
                int id = Integer.parseInt(idStr);
                userDAO.delete(id);
                session.setAttribute("success","Delete User successfully");
            }catch (Exception e){
                session.setAttribute("error","Error while deleting user");
            }
            response.sendRedirect("/dashboard/users");
        }else{
            request.getRequestDispatcher("/404notfound/index.jsp").forward(request, response);
        }
    }

    public void destroy() {
    }
}