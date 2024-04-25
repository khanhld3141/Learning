package controller.UserController;

import dal.UserDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.User;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "UserControllerServlet", value = "/dashboard/users")
public class index extends HttpServlet {
    private String message;
    private UserDAO userDao;

    public void init() {
        message = "Hello World!";
        userDao = new UserDAO();
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        int currentPage = 1;
        if (request.getParameter("page") != null) {
            currentPage = Integer.parseInt(request.getParameter("page"));
        }
        List<User> list = userDao.getAll(currentPage,10);
        request.setAttribute("users", list);

        request.getRequestDispatcher("/dashboard_user/index.jsp").forward(request, response);
    }
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {

    }



    public void destroy() {
    }
}