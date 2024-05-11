package controller.Admin.VoucherController;

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

@WebServlet(name = "CreateVoucherServlet", value = "/dashboard/create-voucher")
public class CreateVoucher extends HttpServlet {
    private String message;
    private VoucherDAO VoucherDAO;

    public void init() {
        message = "Hello World!";
        VoucherDAO = new VoucherDAO();
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        request.getRequestDispatcher("/dashboard_voucher/add-voucher.jsp").forward(request, response);
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        try {

            String code = request.getParameter("Code");
            String quantity = request.getParameter("Quantity");
            String discount = request.getParameter("Discount");
            String startDay = request.getParameter("Startday");
            String starts[] = startDay.split("T");
            String endDay = request.getParameter("Endday");
            String ends[] = endDay.split("T");

            VoucherDAO.create(new Voucher(
                    code,
                    starts[0] + " " + starts[1],
                    ends[0] + " " + ends[1],
                    Integer.parseInt(quantity),
                    0,
                    Integer.parseInt(discount)
            ));

            request.setAttribute("message", "Add new Voucher successfully");
            response.sendRedirect("/dashboard/vouchers");
        } catch (Exception e) {
            request.getRequestDispatcher("/404notfound/index.jsp").forward(request, response);
        }

    }

    public void destroy() {
    }
}