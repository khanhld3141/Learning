package controller.Admin.UserController;

import dal.UserDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.User;

import java.io.IOException;

@WebServlet(name = "UpdateUserServlet", value = "/dashboard/update-user")
public class UpdateUser extends HttpServlet {
    private String message;
    private UserDAO userDAO;
    public void init() {
        message = "Hello World!";
        userDAO =new UserDAO();
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        if(request.getParameter("id")!=""){
            String idStr=request.getParameter("id");
            try{
                int id=Integer.parseInt(idStr);
                User user= userDAO.get(id);
                request.setAttribute("user", user);
                request.getRequestDispatcher("/dashboard_user/update-user.jsp").forward(request,response);
            }catch (Exception e){
                request.getRequestDispatcher("/404notfound/index.jsp").forward(request, response);
                e.printStackTrace();
            }


        }else{
            request.getRequestDispatcher("/404notfound/index.jsp").forward(request, response);
        }
    }
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String id = request.getParameter("Id");
        String name = request.getParameter("Name");
        String username = request.getParameter("Username");
        String phone = request.getParameter("Phone");
        String role = request.getParameter("Role");
        String email = request.getParameter("Email");
        String password = request.getParameter("Password");
        String balance = request.getParameter("Balance");

        try {
            User user = new User(Integer.parseInt(id),Integer.parseInt(balance), name, username, phone, role, email,
                    password);
            userDAO.update(user);
            response.sendRedirect("/dashboard/users");
        } catch (Exception e) {
            request.getRequestDispatcher("/404notfound/index.jsp").forward(request, response);
            e.printStackTrace();
        }

    }

    public void destroy() {
    }
}