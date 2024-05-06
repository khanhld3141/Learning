package controller.Admin.LessionController;

import java.io.*;
import java.util.List;

import dal.ChapterDAO;
import dal.LessionDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.Chapter;
import model.Lession;

@WebServlet(name = "GetLessionServlet", value = "/dashboard/lessions")
public class GetLession extends HttpServlet {
    private String message;
    private LessionDAO lessionDAO;
    private ChapterDAO chapterDAO;
    public void init() {
        message = "Hello World!";
        lessionDAO=new LessionDAO();
        chapterDAO=new ChapterDAO();
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        if(request.getParameter("chapterid")!=null){
            String chapterid = request.getParameter("chapterid");
            try {
                int chapterId=Integer.parseInt(chapterid);
                List<Lession> lessions=lessionDAO.getAllLessions(chapterId);
                request.setAttribute("lessions", lessions);
                Chapter chapter = chapterDAO.get(chapterId);
                request.setAttribute("chapter", chapter);
                request.getRequestDispatcher("/dashboard_lesson/index.jsp").forward(request,response);
            }catch (Exception e) {
                request.setAttribute("error", "Please enter a course ID");
                request.getRequestDispatcher("/dashboard/courses").forward(request, response);
            }
        }
    }

    public void destroy() {
    }
}