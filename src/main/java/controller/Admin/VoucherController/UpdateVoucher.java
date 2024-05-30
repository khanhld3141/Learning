package controller.Admin.VoucherController;

import dal.StatusDAO;
import dal.VoucherDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Category;
import model.Status;
import model.Voucher;

import java.io.IOException;

@WebServlet(name = "UpdateVoucherServlet", value = "/dashboard/update-voucher")
public class UpdateVoucher extends HttpServlet {
    private String message;
    private VoucherDAO voucherDAO;

    public void init() {
        message = "Hello World!";
        voucherDAO = new VoucherDAO();
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        if(request.getParameter("id")!=null){
            String idStr=request.getParameter("id");
            HttpSession session=request.getSession();
            try{
                int id=Integer.parseInt(idStr);
                Voucher voucher= voucherDAO.get(id);

                request.setAttribute("voucher", voucher);
                request.getRequestDispatcher("/dashboard_voucher/update-voucher.jsp").forward(request, response);
            }catch (Exception e){
                session.setAttribute("error","Error while updating voucher");
                response.sendRedirect("/dashboard/vouchers");
            }


        }else{
            request.getRequestDispatcher("/404notfound/index.jsp").forward(request, response);
        }
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        HttpSession session=request.getSession();
        try {

            String id = request.getParameter("Id");
            String code = request.getParameter("Code");
            String quantity = request.getParameter("Quantity");
            String discount = request.getParameter("Discount");
            String startDay = request.getParameter("Startday");
            String used = request.getParameter("Used");
            String starts[] = startDay.split("T");
            String endDay = request.getParameter("Endday");
            String ends[] = endDay.split("T");

            voucherDAO.update(new Voucher(
                    code,
                    starts[0] + " " + starts[1],
                    ends[0] + " " + ends[1],
                    Integer.parseInt(id),
                    Integer.parseInt(quantity),
                    Integer.parseInt(used),
                    Integer.parseInt(discount)
            ));
           session.setAttribute("success","Updated Voucher successfully");

        }catch (Exception e){
            session.setAttribute("error","Error while updating voucher");
        }
        response.sendRedirect("/dashboard/vouchers");

    }

    public void destroy() {
    }
}