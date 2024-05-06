package controller.Student.CourseController;

import java.io.*;
import java.util.List;

import dal.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.*;

@WebServlet(name = "DetailCourseServlet", value = "/detail-course")
public class DetailCourse extends HttpServlet {
    private String message;
    private CourseDAO courseDAO;
    private CourseCommentDAO courseCommentDAO;
    private CategoryDAO categoryDAO;
    private ChapterDAO chapterDAO;
    private LessionDAO lessionDAO;

    public void init() {
        message = "Hello World!";
        courseDAO = new CourseDAO();
        courseCommentDAO=new CourseCommentDAO();
        categoryDAO = new CategoryDAO();
        chapterDAO=new ChapterDAO();
        lessionDAO=new LessionDAO();
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        if(request.getParameter("id")!=null){
            try{
                int id=Integer.parseInt(request.getParameter("id"));
                Course course=courseDAO.get(id);

                List<Chapter> chapters=chapterDAO.getAllChapters(id);

                for(int i=0;i<chapters.size();i++){
                    List<Lession> lessions=lessionDAO.getAllLessions(chapters.get(i).getId());
                    chapters.get(i).setLessions(lessions);
                }
                course.setChapters(chapters);
                request.setAttribute("course",course);

                List<CourseComment> comments=courseCommentDAO.getAllCourseComments(id);
                request.setAttribute("comments", comments);

                List<Course> courses=courseDAO.getAllCourses(1,3);
                request.setAttribute("courses", courses);

                List<Category> categories=categoryDAO.getWithNumberOfCourses();
                request.setAttribute("categories", categories);



                request.getRequestDispatcher("/Courses_details/index.jsp").forward(request, response);
            }catch(Exception e){
                e.printStackTrace();
            }



        }
    }

    public void destroy() {
    }
}