package controller.Admin.DepositController;

import dal.DepositDAO;
import dal.StatusDAO;
import dal.UserDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Deposit;
import model.Status;
import model.User;

import java.io.IOException;

@WebServlet(name = "CreateDepositServlet", value = "/dashboard/create-deposit")
public class CreateDeposit extends HttpServlet {
    private String message;
    private DepositDAO depositDAO;
    private UserDAO userDAO;
    public void init() {
        message = "Hello World!";
        depositDAO=new DepositDAO();
        userDAO=new UserDAO();
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        request.getRequestDispatcher("Banner/create-category.jsp").forward(request, response);
    }
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        HttpSession session=request.getSession();
        try {

            String userid = request.getParameter("userid");
            String amountOfMoney = request.getParameter("amountofmoney");

            depositDAO.create(new Deposit(
                    Integer.parseInt(userid),
                    Integer.parseInt(amountOfMoney),
                    "Successfully"
            ));

                User user=userDAO.get(Integer.parseInt(userid));
                user.setBalance(user.getBalance()+Integer.parseInt(amountOfMoney));
                userDAO.deposit(user);

            session.setAttribute("success","ADD new Deposit successfully ");


        }catch (Exception e){
            session.setAttribute("error","Error while creating Deposit");
            e.printStackTrace();
        }
        response.sendRedirect("/dashboard/deposits");

    }

    public void destroy() {
    }
}