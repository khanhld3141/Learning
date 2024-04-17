package controller.DepositController;

import dal.DepositDAO;
import dal.StatusDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Deposit;
import model.Status;

import java.io.IOException;

@WebServlet(name = "CreateCategoryServlet", value = "/create-deposit")
public class CreateDeposit extends HttpServlet {
    private String message;
    private DepositDAO depositDAO;
    public void init() {
        message = "Hello World!";
        depositDAO=new DepositDAO();
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        request.getRequestDispatcher("Banner/create-category.jsp").forward(request, response);
    }
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String userId=request.getParameter("userid");
        String amountOfMoney=request.getParameter("amountofmoney");


        depositDAO.create(new Deposit(
                Integer.parseInt(userId),
                Integer.parseInt(amountOfMoney),
                1
        ));

        request.setAttribute("message","Add new deposit successfully");
        response.sendRedirect("/deposits");

    }

    public void destroy() {
    }
}