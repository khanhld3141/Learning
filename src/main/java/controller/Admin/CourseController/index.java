package controller.Admin.CourseController;

import java.io.*;
import java.util.ArrayList;
import java.util.List;

import dal.CourseDAO;
import dal.UserDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.Course;
import model.User;

@WebServlet(name = "courseIndexServler", value = "/dashboard/courses")
public class index extends HttpServlet {
    private String message;
    private CourseDAO courseDAO;
    private UserDAO userDAO;

    public void init() {
        message = "Hello World!";
        courseDAO = new CourseDAO();
        userDAO=new UserDAO();
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        int currentPage = 1;
        if (request.getParameter("page") != null) {
            try{
                currentPage = Integer.parseInt(request.getParameter("page"));
            }catch (Exception e){
                request.getRequestDispatcher("/404notfound/index.jsp").forward(request, response);
            }
        }
        String query = "";
        if(request.getParameter("query") != null){
            query=request.getParameter("query");
        }
        HttpSession session=request.getSession();
        User user=(User)session.getAttribute("user");
        List<Course> courses=new ArrayList<Course>();
        if(user.getRole().equals("R2")){
            courses=courseDAO.searchByNameOfTeacher(user.getId(),currentPage,10,query);
        }else{
            courses = courseDAO.searchByName(currentPage,10,query);
        }

        request.setAttribute("courses", courses);
        List<User> users=userDAO.getAllStudent();
        request.setAttribute("students",users);
        request.getRequestDispatcher("/dashboard_courses/index.jsp").forward(request, response);
    }

    public void destroy() {
    }
}