package controller.VoucherController;

import dal.StatusDAO;
import dal.VoucherDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "DeleteVoucherServlet", value = "/dashboard/delete-voucher")
public class DeleteVoucher extends HttpServlet {
    private String message;
    private VoucherDAO voucherDAO;

    public void init() {
        message = "Hello World!";
        voucherDAO = new VoucherDAO();
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        if (request.getParameter(("id")) != null) {
            String idStr = request.getParameter(("id"));

            try {
                int id = Integer.parseInt(idStr);
                voucherDAO.delete(id);
                response.sendRedirect("/dashboard/vouchers");
            } catch (Exception e) {
                e.printStackTrace();
            }
        } else {
            request.setAttribute("message", "Missing parameter id");
            request.getRequestDispatcher("/dashboard/vouchers").forward(request, response);
        }
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("text/html");

        // Hello
        PrintWriter out = response.getWriter();
        out.println("<html><body>");
        out.println("<h1>" + message + "</h1>");
        out.println("</body></html>");
    }

    public void destroy() {
    }
}