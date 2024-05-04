package controller.DepositController;

import dal.DepositDAO;
import dal.StatusDAO;
import dal.UserDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Deposit;
import model.Status;
import model.User;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "GetDepositServlet", value = "/dashboard/deposits")
public class GetDeposit extends HttpServlet {
    private String message;
    private DepositDAO depositDAO;
    private StatusDAO statusDAO;
    private UserDAO userDAO;
    public void init() {
        message = "Hello World!";
        depositDAO = new DepositDAO();
        statusDAO=new StatusDAO();
        userDAO=new UserDAO();
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        List<Deposit> lists = depositDAO.getAllDeposits();
        List<Status> statuses=statusDAO.getAllStatuss();
        List<User> users=userDAO.getAllUser();
        request.setAttribute("users",users);
        request.setAttribute("statuss",statuses);
        request.setAttribute("deposits", lists);
        request.getRequestDispatcher("/dashboard_deposit/index.jsp").forward(request, response);
    }

    public void destroy() {
    }
}