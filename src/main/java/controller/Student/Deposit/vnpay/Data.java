package controller.Student.Deposit.vnpay;

import java.io.*;

import dal.DepositDAO;
import dal.UserDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.Deposit;
import model.User;

@WebServlet(name = "DataServlet", value = "/deposits")
public class Data extends HttpServlet {
    private String message;
    private DepositDAO depositDAO;
    private UserDAO userDAO;

    public void init() {
        message = "Hello World!";
        depositDAO = new DepositDAO();
        userDAO=new UserDAO();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/payment/index.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String amount = request.getParameter("amountofmoney");
            HttpSession session = request.getSession();
            User user = (User) session.getAttribute("user");
            depositDAO.create(new Deposit(
                    user.getId(),
                    Integer.parseInt(amount),
                    "Successfully"
            ));
            User user1 = userDAO.get(user.getId());
            user1.setPassword("");
            session.setAttribute("user", user1);
            request.setAttribute("message", "Add new deposit successfully");
            response.sendRedirect("/home");
        } catch (Exception e) {
            request.getRequestDispatcher("/404notfound/index.jsp").forward(request, response);
        }
    }

    public void destroy() {
    }
}