package controller.Admin.LoginController;

import java.io.*;

import dal.LoginDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.User;

@WebServlet(name = "RegisterServletServlet", value = "/register")
public class RegisterServlet extends HttpServlet {
    private String message;
    private LoginDAO loginDAO;

    public void init() {
        message = "Hello World!";
        loginDAO = new LoginDAO();
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        request.getRequestDispatcher("Sing_up/index.jsp").forward(request, response);
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String name = request.getParameter("Name");
        String username = request.getParameter("Username");
        String email = request.getParameter("Email");
        String password = request.getParameter("Password");

        if(loginDAO.getByUserName(username) != null){
            request.setAttribute("error", "Username already exists");
            request.getRequestDispatcher("/register").forward(request, response);
        }


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