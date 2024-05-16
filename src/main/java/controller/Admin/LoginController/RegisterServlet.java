package controller.Admin.LoginController;

import java.io.*;

import controller.Ulti.SendMail;
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
        if(loginDAO.getByEmail(email) != null){
            request.setAttribute("error", "Email already exists");
            request.getRequestDispatcher("/register").forward(request, response);
        }

        SendMail.Send(email,name,username,password);

        response.sendRedirect("/home");
    }

    public void destroy() {
    }
}