package controller.Student.My;

import java.io.*;
import java.util.List;

import dal.DepositDAO;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.Deposit;
import model.User;

@WebServlet(name = "MyDepositsServlet", value = "/my-deposits")
public class MyDeposits extends HttpServlet {
    private String message;
    private DepositDAO depositDAO;

    public void init() {
        message = "Hello World!";
        depositDAO=new DepositDAO();
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        HttpSession session=request.getSession();
        User user = (User) session.getAttribute("user");

        try{
            List<Deposit> deposits=depositDAO.getAllMyDeposits(user.getId());
            request.setAttribute("deposits",deposits);

            request.getRequestDispatcher("/my/my-deposit.jsp").forward(request,response);

        }catch (Exception e){
            e.printStackTrace();
        }

    }

    public void destroy() {
    }
}