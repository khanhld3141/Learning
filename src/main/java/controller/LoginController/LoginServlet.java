package controller.LoginController;

import dal.LoginDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import model.User;

import java.io.IOException;

@WebServlet(name = "LoginServletServlet", value = "/login")
public class LoginServlet extends HttpServlet {
    private String message;

    public void init() {
        message = "Hello World!";
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        request.getRequestDispatcher("Login/index.jsp").forward(request, response);
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String remember = request.getParameter("remember");

        HttpSession session = request.getSession();
        LoginDAO loginDAO = new LoginDAO();
        User user = loginDAO.check(username, password);
        if (user == null) {
            request.setAttribute("error", "username or password invalid");
            request.getRequestDispatcher("Login/index.jsp").forward(request, response);
        } else {
           /* //tạo session
            session.setAttribute("user", user);
            //tạo 3 cookie : username,password,remember
            String sessionId = UUID.randomUUID().toString();

            // Mã hóa mã thông báo phiên
            String encodedSessionId = Base64.encodeBase64String(sessionId.getBytes());

            // Lưu trữ mã thông báo phiên và thông tin người dùng vào cookie
            Cookie cookie = new Cookie("sessionId", encodedSessionId);
            cookie.setMaxAge(-1); // Cookie tồn tại cho đến khi trình duyệt được đóng
            response.addCookie(cookie);*/

            // Lưu trữ thông tin người dùng vào HttpSession
//            HttpSession session = request.getSession();
            session.setAttribute("user", user);
            Cookie cookieU = new Cookie("username", username);
            Cookie cookieP = new Cookie("password", password);
            Cookie cookieR = new Cookie("remember", remember);
            if (remember != null) {
                cookieU.setMaxAge(7 * 24 * 60 * 60);
                cookieP.setMaxAge(7 * 24 * 60 * 60);
                cookieR.setMaxAge(7 * 24 * 60 * 60);
            } else {
                cookieU.setMaxAge(0);
                cookieP.setMaxAge(0);
                cookieR.setMaxAge(0);
            }
            response.addCookie(cookieU);
            response.addCookie(cookieP);
            response.addCookie(cookieR);
            if (user.getRole().equals("Administrator")) {
                request.getRequestDispatcher("Login/admin.jsp").forward(request, response);
            } else {

                request.getRequestDispatcher("Login/welcome.jsp").forward(request, response);
            }
        }
    }

    public void destroy() {
    }
}