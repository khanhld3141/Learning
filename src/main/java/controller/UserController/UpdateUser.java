package controller.UserController;

import dal.UsersDAO;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Users;

import java.io.IOException;

@WebServlet(name = "UpdateUserServlet", value = "/update-user")
public class UpdateUser extends HttpServlet {
    private String message;
    private UsersDAO usersDAO;
    public void init() {
        message = "Hello World!";
        usersDAO=new UsersDAO();
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        if(request.getParameter("id")!=null){
            String idStr=request.getParameter("id");
            try{
                int id=Integer.parseInt(idStr);
                Users user=usersDAO.get(id);

                request.setAttribute("user", user);
                request.getRequestDispatcher("Home/update-user.jsp").forward(request,response);
            }catch (Exception e){
                e.printStackTrace();
            }


        }
    }
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String idStr=request.getParameter("id");
        String name = request.getParameter("name");
        String uni = request.getParameter("university");
        String clas = request.getParameter("class");
        String gradeStr = request.getParameter("grade");

        try {
            int id=Integer.parseInt(idStr);
            double grade = Double.parseDouble(gradeStr);
            Users user = new Users(id,name, uni, clas, grade);
            usersDAO.update(user);
            response.sendRedirect("/users");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void destroy() {
    }
}