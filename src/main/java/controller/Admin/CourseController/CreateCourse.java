package controller.Admin.CourseController;

import java.io.*;
import java.util.List;

import controller.Ulti.FileUploadUtil;
import dal.CategoryDAO;
import dal.CourseDAO;
import dal.UserDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import model.Category;
import model.Course;
import model.User;
@MultipartConfig()
@WebServlet(name = "CreateCourseServlet", value = "/dashboard/create-course")
public class CreateCourse extends HttpServlet {
    private String message;
    private CourseDAO courseDAO;
    private CategoryDAO categoryDAO;
    private UserDAO userDAO;

    public void init() {
        message = "Hello World!";
        courseDAO = new CourseDAO();
        categoryDAO = new CategoryDAO();
        userDAO = new UserDAO();
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        List<Category> categories = categoryDAO.getAllCategorys();
        List<User> teachers = userDAO.getAllTeacher();
        request.setAttribute("teachers", teachers);
        request.setAttribute("categories", categories);
        request.getRequestDispatcher("/dashboard_courses/add-courses.jsp").forward(request, response);
    }
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String name = request.getParameter("Name");
        String teacher=request.getParameter("TeacherId");
        String category = request.getParameter("CateId");
        String introduce=request.getParameter("Introduce");
        String overview=request.getParameter("Overview");
        String result=request.getParameter("Result");
        String price=request.getParameter("Price");

        Part image=request.getPart("Image");
        String realPath = request.getServletContext().getRealPath("/images");
        String filename= FileUploadUtil.uploadFile(image,realPath);
        HttpSession session=request.getSession();
        try{
            Course course=new Course(
                    Integer.parseInt(teacher),
                    Integer.parseInt(price),
                    Integer.parseInt(category),
                    name,
                    introduce,
                    filename,
                    overview,
                    result
            );
            courseDAO.create(course);
            session.setAttribute("success","Add new Course successfully");

       }catch (Exception e){
            e.printStackTrace();
           session.setAttribute("error","Error while creating new Course");
       }
        response.sendRedirect("/dashboard/courses");
    }
    public void destroy() {
    }
}