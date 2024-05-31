package controller.Student.My;

import java.io.*;

import dal.UserDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import lib.AESUtil;
import model.User;

@WebServlet(name = "ChangePasswordServlet", value = "/change-password")
public class ChangePassword extends HttpServlet {
    private String message;
    private UserDAO userDAO;
    public void init() {
        message = "Hello World!";
        userDAO = new UserDAO();
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        request.getRequestDispatcher("/my/change-password.jsp").forward(request, response);
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
       try{
           String oldPassword = request.getParameter("oldpassword");
           String newPassword = request.getParameter("newpassword");
           HttpSession session = request.getSession();
           User us = (User)session.getAttribute("user");
           User user = userDAO.get(us.getId());
           boolean check= oldPassword.equals(user.getPassword());

           if(!check){
               session.setAttribute("error","Password is incorrect");
           }else{
               userDAO.changePassword(newPassword,user.getId());
               session.setAttribute("success","Change password successfully");

           }
           response.sendRedirect("/change-password");

       }catch (Exception e){
           request.getRequestDispatcher("/404notfound/index.jsp").forward(request, response);
           e.printStackTrace();
       }



    }

    public void destroy() {
    }
}