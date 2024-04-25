package controller.ChapterController;

import java.io.*;
import java.util.List;

import dal.ChapterDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.Chapter;
import model.Course;

@WebServlet(name = "GetChapterServlet", value = "/dashboard/chapter")
public class GetChapter extends HttpServlet {
    private String message;
    private ChapterDAO chapterDAO;
    public void init() {
        message = "Hello World!";
        chapterDAO=new ChapterDAO();
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        if(request.getParameter("courseid")!=null){
            String courseid = request.getParameter("courseid");
            try {
                int course=Integer.parseInt(courseid);
                List<Chapter> chapters=chapterDAO.getAllChapters(course);
                request.setAttribute("chapters", chapters);
                request.getRequestDispatcher("/dashboard_chapter/index.jsp").forward(request,response);
            }catch (Exception e) {
                request.setAttribute("error", "Please enter a course ID");
                request.getRequestDispatcher("/dashboard/courses").forward(request, response);
            }
        }
    }

    public void destroy() {
    }
}