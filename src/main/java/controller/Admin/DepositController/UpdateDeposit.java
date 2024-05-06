package controller.Admin.DepositController;

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

@WebServlet(name = "UpdateDepositServlet", value = "/dashboard/update-deposit")
public class UpdateDeposit extends HttpServlet {
    private String message;
    private DepositDAO depositDAO;

    public void init() {
        message = "Hello World!";
        depositDAO = new DepositDAO();
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        if (request.getParameter("id") != null) {
            String idStr = request.getParameter("id");
            try {
                int id = Integer.parseInt(idStr);
                Deposit deposit = depositDAO.get(id);

                request.setAttribute("deposit", deposit);
                request.getRequestDispatcher("Deposit/update-status.jsp").forward(request, response);
            } catch (Exception e) {
                e.printStackTrace();
            }


        }
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String id = request.getParameter("id");
        String userId = request.getParameter("userid");
        String amountOfMoney = request.getParameter("amountofmoney");
        String status = request.getParameter("status");
        String statuss[] = status.split("-");

        depositDAO.update(new Deposit(
                Integer.parseInt(id),
                Integer.parseInt(userId),
                Integer.parseInt(amountOfMoney),
                Integer.parseInt(statuss[0])
        ));

        request.setAttribute("message", "Update category successfully");
        response.sendRedirect("/dashboard/deposits");

    }

    public void destroy() {
    }
}