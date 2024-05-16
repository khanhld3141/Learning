package controller.Admin.LoginController;

import java.io.*;

import dal.LoginDAO;
import dal.UserDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.User;

@WebServlet(name = "ConfirmEmailServlet", value = "/confirm-email")
public class ConfirmEmail extends HttpServlet {
    private String message;
    private LoginDAO loginDAO;

    public void init() {
        message = "Hello World!";
        loginDAO=new LoginDAO();
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String name = request.getParameter("name");
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        User user = new User(0, name, username, null, "R3", email, password);
        System.out.println(user.getUsername() + " " + user.getName() + " " + user.getEmail() + " " + user.getPassword());
        if (loginDAO.register(user)) {
            request.setAttribute("success", "Register successful");
            request.getRequestDispatcher("/login").forward(request, response);
            System.out.println("Successfully logged in"+user.getName());
        } else {
            request.setAttribute("error", "Error registering");
            request.getRequestDispatcher("/register").forward(request, response);
            System.out.println("failed to register"+user.getName());
        }
    }

    public void destroy() {
    }
}