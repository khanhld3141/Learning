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
import java.util.List;

@WebServlet(name = "IndexStatusServlet", value = "/deposits")
public class GetDeposit extends HttpServlet {
    private String message;
    private DepositDAO depositDAO;

    public void init() {
        message = "Hello World!";
        depositDAO = new DepositDAO();
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        List<Deposit> lists = depositDAO.getAllDeposits();
        request.setAttribute("deposits", lists);
        request.getRequestDispatcher("Deposit/index.jsp").forward(request, response);
    }

    public void destroy() {
    }
}