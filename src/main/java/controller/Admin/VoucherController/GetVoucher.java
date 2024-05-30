package controller.Admin.VoucherController;

import dal.VoucherDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Voucher;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "IndexVoucherServlet", value = "/dashboard/vouchers")
public class GetVoucher extends HttpServlet {
    private String message;
    private VoucherDAO voucherDAO;

    public void init() {
        message = "Hello World!";
        voucherDAO = new VoucherDAO();
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        int page=1;
        if(request.getParameter("page") != null){
            try{
                page=Integer.parseInt(request.getParameter("page"));
            }catch (Exception e){
                request.getRequestDispatcher("/404notfound/index.jsp").forward(request, response);
            }
        }
        String query = "";
        if(request.getParameter("query") != null){
            query=request.getParameter("query");
        }
        List<Voucher> lists = voucherDAO.searchByName(page,10,query);
        request.setAttribute("vouchers", lists);
        request.getRequestDispatcher("/dashboard_voucher/index.jsp").forward(request, response);
    }

    public void destroy() {
    }
}