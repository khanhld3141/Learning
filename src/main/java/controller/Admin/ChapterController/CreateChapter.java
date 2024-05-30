package controller.Admin.ChapterController;

import java.io.*;

import dal.ChapterDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.Chapter;

@WebServlet(name = "CreateChapterServlet", value = "/dashboard/create-chapter")
public class CreateChapter extends HttpServlet {
    private String message;
    private ChapterDAO chapterDAO;
    public void init() {
        message = "Hello World!";
        chapterDAO = new ChapterDAO();
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {

    }
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String courseId=request.getParameter("courseid");
        String name=request.getParameter("name");
        String ordinal=request.getParameter("ordinal");
        HttpSession session=request.getSession();
        try{
            chapterDAO.create(new Chapter(
                    Integer.parseInt(courseId),
                    name,
                    Integer.parseInt(ordinal)
            ));
            session.setAttribute("success","Add new Chapter successfully");
            response.sendRedirect("/dashboard/chapter?courseid="+courseId);
        }catch (Exception e){
            session.setAttribute("error","Error while creating new Chapter");
            response.sendRedirect("/dashboard/chapter?courseid="+courseId);
        }

    }
    public void destroy() {
    }
}