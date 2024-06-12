package controller.Student.LoginController;

import java.io.*;

import dal.UserDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.User;

@WebServlet(name = "ConfirmPasswordServlet", value = "/confirm-password")
public class ConfirmPassword extends HttpServlet {
    private String message;
    private UserDAO userDAO;

    public void init() {
        message = "Hello World!";
        userDAO=new UserDAO();
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        request.getRequestDispatcher("/Forgot-password/confirm-password.jsp").forward(request, response);
    }
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String password = request.getParameter("password");
        HttpSession session = request.getSession();

        String email=(String) session.getAttribute("email");
        User user=userDAO.getByEmail(email);
        userDAO.changePassword(password,user.getId());
        response.sendRedirect("/login");
    }

    public void destroy() {
    }
}