package controller.UserController;

import dal.UsersDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Users;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "UserControllerServlet", value = "/users")
public class index extends HttpServlet {
    private String message;
    private UsersDAO usersDao;

    public void init() {
        message = "Hello World!";
        usersDao = new UsersDAO();
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        List<Users> list = usersDao.getAll();
        request.setAttribute("users", list);
        request.getRequestDispatcher("Home/user.jsp").forward(request, response);
    }
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {

    }



    public void destroy() {
    }
}