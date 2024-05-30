package controller.Admin.LessionController;

import java.io.*;

import controller.Ulti.FileUploadUtil;
import dal.LessionDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.Course;
import model.Lession;

@WebServlet(name = "DeleteLessionServlet", value = "/dashboard/delete-lession")
public class DeleteLession extends HttpServlet {
    private String message;
    private LessionDAO lessionDAO;

    public void init() {
        message = "Hello World!";
        lessionDAO=new LessionDAO();
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        if (request.getParameter(("id")) != null && request.getParameter(("chapterid")) != null) {
            String idStr = request.getParameter(("id"));
            HttpSession session = request.getSession();
            String chapterid=request.getParameter(("chapterid"));
            try {
                int id = Integer.parseInt(idStr);
                Lession lession = lessionDAO.get(id);
                String realPath = request.getServletContext().getRealPath("/images");
                FileUploadUtil.deleteFile(realPath,lession.getLink());
                lessionDAO.delete(id);
                session.setAttribute("success","Delete Lesson successfully");
            } catch (Exception e) {
               session.setAttribute("error","Error while deleting Lesson");
            }
            response.sendRedirect("/dashboard/lessions?chapterid=" + chapterid);
        }else{
            request.getRequestDispatcher("/404notfound/index.jsp").forward(request, response);
        }
    }

    public void destroy() {
    }
}