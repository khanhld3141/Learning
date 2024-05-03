package controller.PostController;

import java.io.*;
import java.util.List;

import dal.ChapterDAO;
import dal.CourseDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.Chapter;

@WebServlet(name = "GetPostServlet", value = "/dashboard/posts")
public class GetPost extends HttpServlet {
    private String message;
    private ChapterDAO chapterDAO;
    public void init() {
        message = "Hello World!";
        chapterDAO = new ChapterDAO();
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        if(request.getParameter("id")!=null){
            String id=request.getParameter("id");
            try{
                List<Chapter> chapters=chapterDAO.getAllChapters(Integer.parseInt(id));
                request.setAttribute("chapters", chapters);
                request.getRequestDispatcher("/dashboard_chapter/index.jsp").forward(request,response);
            }catch(Exception e){
                request.setAttribute("error","Please enter a valid id");
                request.getRequestDispatcher("/dashboard_chapter/index.jsp").forward(request,response);
            }
        }
    }

    public void destroy() {
    }
}