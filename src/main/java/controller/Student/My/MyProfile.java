package controller.Student.My;

import java.io.*;

import dal.UserDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.User;

@WebServlet(name = "MyProfileServlet", value = "/my-profile")
public class MyProfile extends HttpServlet {
    private String message;
    private UserDAO userDAO;

    public void init() {
        message = "Hello World!";
        userDAO = new UserDAO();
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        HttpSession session =request.getSession();
        User us=(User)session.getAttribute("user");
        User user =userDAO.get(us.getId());
        request.setAttribute("user",user);

        request.getRequestDispatcher("/my/index.jsp").forward(request, response);
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        HttpSession session =request.getSession();
        User us=(User)session.getAttribute("user");
        User user =userDAO.get(us.getId());

        String name=request.getParameter("name");
        String phone =request.getParameter("phone");
        String email =request.getParameter("email");

        user.setName(name);
        user.setPhone(phone);
        user.setEmail(email);

        userDAO.update(user);
        response.sendRedirect("/my-profile");
    }

    public void destroy() {
    }
}