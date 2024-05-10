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
           boolean check= AESUtil.encrypt(oldPassword).equals(user.getPassword());
           if(!check){
               request.setAttribute("message", "Password incorrect");
               request.getRequestDispatcher("/my/change-password.jsp").forward(request, response);
           }else{
               userDAO.changePassword(newPassword,user.getId());
               response.sendRedirect("/change-password");
           }


       }catch (Exception e){
           e.printStackTrace();
       }



    }

    public void destroy() {
    }
}