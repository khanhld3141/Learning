package controller.Student.LoginController;

import java.io.*;

import dal.UserDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

@WebServlet(name = "ForgotpasswordServlet", value = "/forgot-password")
public class Forgotpassword extends HttpServlet {
    private String message;
    private UserDAO userDAO;
    public void init() {
        message = "Hello World!";
        userDAO=new UserDAO();
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        request.getRequestDispatcher("/Forgot-password/index.jsp").forward(request, response);
    }
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String email = request.getParameter("email");
        HttpSession session=request.getSession();
        if(userDAO.getByEmail(email)!=null){
            int code=SendCode.Send(email);

            session.setAttribute("code",code);
            session.setAttribute("email",email);
            response.sendRedirect("/confirm-code");
        }else{
            session.setAttribute("error","Email is invalid");
            response.sendRedirect("/forgot-password");
        }

    }

    public void destroy() {
    }
}