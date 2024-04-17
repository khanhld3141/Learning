package controller.VoucherController;

import dal.StatusDAO;
import dal.VoucherDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Status;
import model.Voucher;

import java.io.IOException;

@WebServlet(name = "CreateVoucherServlet", value = "/create-voucher")
public class CreateVoucher extends HttpServlet {
    private String message;
    private VoucherDAO VoucherDAO;
    public void init() {
        message = "Hello World!";
        VoucherDAO =new VoucherDAO();
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        request.getRequestDispatcher("Banner/create-voucher.jsp").forward(request, response);
    }
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String code = request.getParameter("code");
        String quantity=request.getParameter("quantity");
        String discount=request.getParameter("discount");
        String startDay=request.getParameter("startday");
        String starts[]=startDay.split("T");
        String endDay=request.getParameter("endday");
        String ends[]=endDay.split("T");

        VoucherDAO.create(new Voucher(
                code,
                starts[0]+" "+starts[1],
                ends[0]+" "+ends[1],
                Integer.parseInt(quantity),
                0,
                Integer.parseInt(discount)
        ));

        request.setAttribute("message","Add new Voucher successfully");
        response.sendRedirect("/vouchers");

    }

    public void destroy() {
    }
}