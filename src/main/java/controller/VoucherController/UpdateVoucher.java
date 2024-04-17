package controller.VoucherController;

import dal.StatusDAO;
import dal.VoucherDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Category;
import model.Status;
import model.Voucher;

import java.io.IOException;

@WebServlet(name = "UpdateVoucherServlet", value = "/update-voucher")
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
            try{
                int id=Integer.parseInt(idStr);
                Voucher voucher= voucherDAO.get(id);

                request.setAttribute("voucher", voucher);
                request.getRequestDispatcher("Status/update-status.jsp").forward(request, response);
            }catch (Exception e){
                e.printStackTrace();
            }


        }
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String id= request.getParameter("id");
        String code = request.getParameter("code");
        String quantity=request.getParameter("quantity");
        String discount=request.getParameter("discount");
        String startDay=request.getParameter("startday");
        String starts[]=startDay.split("T");
        String endDay=request.getParameter("endday");
        String ends[]=endDay.split("T");

        voucherDAO.update(new Voucher(
                code,
                starts[0]+" "+starts[1],
                ends[0]+" "+ends[1],
                Integer.parseInt(id),
                Integer.parseInt(quantity),
                0,
                Integer.parseInt(discount)
        ));

        request.setAttribute("message", "Update category successfully");
        response.sendRedirect("/categories");

    }

    public void destroy() {
    }
}