package controller.Admin.ChapterController;

import java.io.*;

import dal.ChapterDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.Chapter;
import model.Hashtag;

@WebServlet(name = "UpdateChapterServlet", value = "/dashboard/update-chapter")
public class UpdateChapter extends HttpServlet {
    private String message;
    private ChapterDAO chapterDAO;

    public void init() {
        message = "Hello World!";
        chapterDAO = new ChapterDAO();
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        if (request.getParameter("id") != null) {
            String id = request.getParameter("id");
            Chapter chapter = chapterDAO.get(Integer.parseInt(id));
            request.setAttribute("chapter", chapter);
            request.getRequestDispatcher("").forward(request, response);
        } else {
            request.setAttribute("error", "Please enter a post id");
            request.getRequestDispatcher("/404notfound/index.jsp").forward(request, response);
        }
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String id = request.getParameter("id");
        String courseId=request.getParameter("courseid");
        String name=request.getParameter("name");
        HttpSession session=request.getSession();

        try{
            Chapter chapter=chapterDAO.get(Integer.parseInt(id));
            if(chapter==null){
                request.getRequestDispatcher("/404notfound/index.jsp").forward(request, response);
            }else {
                chapterDAO.update(new Chapter(
                        Integer.parseInt(id),
                        Integer.parseInt(courseId),
                        name
                ));
                session.setAttribute("success","Update Chapter successfully");
                response.sendRedirect("/dashboard/chapter?courseid=" + courseId);
            }
        } catch (Exception e) {
            response.sendRedirect("/dashboard/chapter?courseid=" + courseId);
            session.setAttribute("error","Error while updating Chapter");
        }
    }

    public void destroy() {
    }
}