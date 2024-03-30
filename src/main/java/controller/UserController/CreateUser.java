package controller.UserController;

import dal.UsersDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Users;

import java.io.IOException;

@WebServlet(name = "CreateUserServlet", value = "/create-user")
public class CreateUser extends HttpServlet {
    private String message;
    private UsersDAO usersDao;

    public void init() {
        usersDao = new UsersDAO();
        message = "Hello World!";
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        request.getRequestDispatcher("Home/add-user.jsp").forward(request, response);
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String name = request.getParameter("name");
        String uni = request.getParameter("university");
        String clas = request.getParameter("class");
        String gradeStr = request.getParameter("grade");

        try {
            double grade = Double.parseDouble(gradeStr);
            Users user = new Users(name, uni, clas, grade);
            usersDao.create(user);
            response.sendRedirect("/users");
        } catch (Exception e) {
            e.printStackTrace();
        }


    }

    public void destroy() {
    }
}