package controller.Student.LoginController;

import java.io.*;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

@WebServlet(name = "ForgotpasswordServlet", value = "/forgot-password")
public class Forgotpassword extends HttpServlet {
    private String message;

    public void init() {
        message = "Hello World!";
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        request.getRequestDispatcher("/Forgot-password/index.jsp").forward(request, response);
    }
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String email = request.getParameter("email");
        int code=SendCode.Send(email);
        HttpSession session=request.getSession();
        session.setAttribute("code",code);
        session.setAttribute("email",email);
        response.sendRedirect("/confirm-code");

    }

    public void destroy() {
    }
}