package controller.Student.LoginController;

import java.io.*;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

@WebServlet(name = "ConfirmCodeServlet", value = "/confirm-code")
public class ConfirmCode extends HttpServlet {
    private String message;

    public void init() {
        message = "Hello World!";
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
       request.getRequestDispatcher("/Forgot-password/enter-code.jsp").forward(request, response);
    }
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String code[]=request.getParameterValues("code[]");
        String code1="";

        for(String i:code){
            code1+=i;
        }
        HttpSession session=request.getSession();
        int codeS=(int)session.getAttribute("code");

        if(code1.equals(Integer.toString(codeS))){
            response.sendRedirect("/confirm-password");
        }else{
            session.setAttribute("error","Code is incorrect");
            response.sendRedirect("/confirm-code");
        }
    }

    public void destroy() {
    }
}