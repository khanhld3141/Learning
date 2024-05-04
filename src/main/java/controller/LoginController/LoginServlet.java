package controller.LoginController;

import dal.LoginDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import lib.AESUtil;
import model.User;

import java.io.IOException;

@WebServlet(name = "LoginServletServlet", value = "/login")
public class LoginServlet extends HttpServlet {
    private String message;

    public void init() {
        message = "Hello World!";
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        request.getRequestDispatcher("Login/Login.jsp").forward(request, response);
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String username = request.getParameter("Username");
        String password = request.getParameter("Password");
        String remember = request.getParameter("Remember");

        HttpSession session = request.getSession();
        LoginDAO loginDAO = new LoginDAO();
        User user = loginDAO.login(username);
        if (user == null) {
            request.setAttribute("error", "username invalid");
            request.getRequestDispatcher("Login/Login.jsp").forward(request, response);
        } else {
            String pass = "";
            try {
                pass = AESUtil.decrypt(user.getPassword());
            } catch (Exception e) {
                throw new RuntimeException(e);
            }
            if (!pass.equals(password)) {
                request.setAttribute("error", "password incorrect");
                request.getRequestDispatcher("Login/index.jsp").forward(request, response);
            } else {
                session.setAttribute("user", user);
                response.sendRedirect("/home");
            }
        }
    }

    public void destroy() {
    }
}