package controller.Admin.ChapterController;

import java.io.*;

import dal.ChapterDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

@WebServlet(name = "DeleteChapterServlet", value = "/dashboard/delete-chapter")
public class DeleteChapter extends HttpServlet {
    private String message;
    private ChapterDAO chapterDAO;
    public void init() {
        message = "Hello World!";
        chapterDAO=new ChapterDAO();
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {

        if(request.getParameter("id")!=null && request.getParameter("courseid")!=null){
            String id=request.getParameter("id");
            String courseId=request.getParameter("courseid");
            HttpSession session=request.getSession();
            chapterDAO.delete(Integer.parseInt(id));
            session.setAttribute("success","Delete Chapter successfully");
            response.sendRedirect("/dashboard/chapter?courseid="+courseId);
        }else{
            request.getRequestDispatcher("/404notfound/index.jsp").forward(request, response);
        }
    }

    public void destroy() {
    }
}