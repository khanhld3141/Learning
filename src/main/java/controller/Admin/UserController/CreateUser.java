package controller.Admin.UserController;

import dal.UserDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.User;

import java.io.IOException;

@WebServlet(name = "CreateUserServlet", value = "/dashboard/create-user")
public class CreateUser extends HttpServlet {
    private String message;
    private UserDAO userDao;

    public void init() {
        userDao = new UserDAO();
        message = "Hello World!";
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        request.getRequestDispatcher("/dashboard_user/add-user.jsp").forward(request, response);
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String name = request.getParameter("Name");
        String username = request.getParameter("Username");
        String phone = request.getParameter("Phone");
        String role = request.getParameter("Role");
        String email = request.getParameter("Email");
        String password = request.getParameter("Password");
        String balanceStr = request.getParameter("Balance");
        User userExisted = userDao.getByUserName(username);
        if (userExisted != null) {
            response.sendRedirect("/dashboard/users?error=Username&already&exist");
        } else {

            try {
                User user = new User(Integer.parseInt(balanceStr), name, username, phone, role, email, password);
                userDao.create(user);
                response.sendRedirect("/dashboard/users");
            } catch (Exception e) {
                request.getRequestDispatcher("/404notfound/index.jsp").forward(request, response);
                e.printStackTrace();
            }
        }


    }

    public void destroy() {
    }
}