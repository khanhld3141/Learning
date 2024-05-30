package controller.Admin.CourseController;

import java.io.*;

import controller.Ulti.FileUploadUtil;
import dal.CourseDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.Course;

@WebServlet(name = "DeleteCourseServlet", value = "/dashboard/delete-course")
public class DeleteCourse extends HttpServlet {
    private String message;
    private CourseDAO courseDAO;

    public void init() {
        message = "Hello World!";
        courseDAO = new CourseDAO();
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        if (request.getParameter(("id")) != null) {
            String idStr = request.getParameter(("id"));
            try {
                int id = Integer.parseInt(idStr);
                Course course = courseDAO.get(id);
                if(course==null){
                    request.getRequestDispatcher("/404notfound/index.jsp").forward(request, response);
                }else {
                    String realPath = request.getServletContext().getRealPath("/images");
                    FileUploadUtil.deleteFile(realPath, course.getImage());
                    courseDAO.delete(id);
                    HttpSession session=request.getSession();
                    session.setAttribute("success","Delete Course successfully");
                    response.sendRedirect("/dashboard/courses");
                }
            } catch (Exception e) {
                request.getRequestDispatcher("/404notfound/index.jsp").forward(request, response);
                e.printStackTrace();
            }
        }else{
            request.getRequestDispatcher("/404notfound/index.jsp").forward(request, response);
        }
    }

    public void destroy() {
    }
}