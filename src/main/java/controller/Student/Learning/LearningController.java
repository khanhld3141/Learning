package controller.Student.Learning;

import java.io.*;
import java.util.List;

import dal.ChapterDAO;
import dal.CourseDAO;
import dal.LessionDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.Chapter;
import model.Course;
import model.Lession;

@WebServlet(name = "LearningControllerServlet", value = "/learning")
public class LearningController extends HttpServlet {
    private String message;
    private CourseDAO courseDAO;
    private ChapterDAO chapterDAO;
    private LessionDAO lessionDAO;

    public void init() {
        message = "Hello World!";
        courseDAO = new CourseDAO();
        chapterDAO = new ChapterDAO();
        lessionDAO = new LessionDAO();
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        if (request.getParameter("courseid") != null) {
            int id = Integer.parseInt(request.getParameter("courseid"));
            Course course = courseDAO.get(id);

            List<Chapter> chapters = chapterDAO.getAllChapters(id);
            for (int i = 0; i < chapters.size(); i++) {
                List<Lession> lessions = lessionDAO.getAllLessions(chapters.get(i).getId());
                chapters.get(i).setLessions(lessions);
            }
            course.setChapters(chapters);
            request.setAttribute("course", course);

            request.getRequestDispatcher("/study/index.jsp").forward(request, response);
        }
    }

    public void destroy() {
    }
}