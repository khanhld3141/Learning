package controller.Student.StaticView;

import java.io.*;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

@WebServlet(name = "TermAndConditionsServlet", value = "/term-and-conditions")
public class TermAndConditions extends HttpServlet {
    private String message;

    public void init() {
        message = "Hello World!";
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        request.getRequestDispatcher("/Terms_Conditions/index.jsp").forward(request,response);
    }

    public void destroy() {
    }
}