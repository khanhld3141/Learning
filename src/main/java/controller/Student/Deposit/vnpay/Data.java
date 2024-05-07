package controller.Student.Deposit.vnpay;

import java.io.*;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

@WebServlet(name = "DataServlet", value = "/data")
public class Data extends HttpServlet {
    private String message;

    public void init() {
        message = "Hello World!";
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Lấy các tham số từ URL
        String vnpAmount = request.getParameter("vnp_Amount");
        String vnpBankCode = request.getParameter("vnp_BankCode");
        String vnpCommand = request.getParameter("vnp_Command");
        // Lấy các thông tin khác tùy theo nhu cầu của bạn

        // Xử lý các tham số nhận được
        // Ví dụ: In các thông tin ra console
        System.out.println("Amount: " + vnpAmount);
        System.out.println("Bank Code: " + vnpBankCode);
        System.out.println("Command: " + vnpCommand);

        // Kiểm tra xác thực hash (nếu có)

        // Xử lý kết quả thanh toán và phản hồi lại VNPAY
        // Ví dụ: Trả về một trang HTML thông báo kết quả thanh toán cho người dùng
        String htmlResponse = "<html><body><h2>Thanh toán thành công!</h2></body></html>";
        response.setContentType("text/html");
        response.getWriter().write(htmlResponse);
    }

    public void destroy() {
    }
}