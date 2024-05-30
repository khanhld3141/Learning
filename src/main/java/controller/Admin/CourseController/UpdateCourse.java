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

@MultipartConfig
@WebServlet(name = "UpdateCourseServlet", value = "/dashboard/update-course")
public class UpdateCourse extends HttpServlet {
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
        if (request.getParameter("id") != "") {
            String idStr = request.getParameter("id");
            try {
                List<Category> categories = categoryDAO.getAllCategorys();
                List<User> teachers = userDAO.getAllTeacher();
                request.setAttribute("teachers", teachers);
                request.setAttribute("categories", categories);
                int id = Integer.parseInt(idStr);
                Course course = courseDAO.get(id);
                request.setAttribute("course", course);
                request.getRequestDispatcher("/dashboard_courses/update-courses.jsp").forward(request, response);
            } catch (Exception e) {
                request.getRequestDispatcher("/404notfound/index.jsp").forward(request, response);
                e.printStackTrace();
            }


        }else{
            request.getRequestDispatcher("/404notfound/index.jsp").forward(request, response);
        }
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String name = request.getParameter("Name");
        String teacher=request.getParameter("TeacherId");
        String category = request.getParameter("CateId");
        String id = request.getParameter("Id");
        String introduce = request.getParameter("Introduce");
        String overview = request.getParameter("Overview");
        String result = request.getParameter("Result");
        String price = request.getParameter("Price");


        Course course = courseDAO.get(Integer.parseInt(id));
        HttpSession session=request.getSession();
        try {
            course.setName(name);
            course.setPrice(Integer.parseInt(price));
            course.setIntroduce(introduce);
            course.setOverview(overview);
            course.setResult(result);
            course.setTeacherId(Integer.parseInt(teacher));
            course.setCateId(Integer.parseInt(category));

            courseDAO.update(course);
            session.setAttribute("success","Update Course successfully");

        } catch (Exception e) {
            session.setAttribute("error","Error while updating Course");
            e.printStackTrace();
        }
        response.sendRedirect("/dashboard/courses");
    }

    public void destroy() {
    }
}