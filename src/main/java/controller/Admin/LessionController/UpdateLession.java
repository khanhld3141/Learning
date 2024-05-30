package controller.Admin.LessionController;

import java.io.*;
import java.util.List;

import controller.Ulti.FileUploadUtil;
import dal.LessionDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.Category;
import model.Course;
import model.Lession;
import model.User;

@MultipartConfig
@WebServlet(name = "UpdateLessionServlet12424124", value = "/dashboard/update-lession")
public class UpdateLession extends HttpServlet {
    private String message;
    private LessionDAO lessionDAO;

    public void init() {
        message = "Hello World!";
        lessionDAO = new LessionDAO();
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        if (request.getParameter("id") != "") {
            String idStr = request.getParameter("id");
            try {
                Lession lession = lessionDAO.get(Integer.parseInt(idStr));
                request.setAttribute("lession", lession);
                request.getRequestDispatcher("").forward(request, response);
            } catch (Exception e) {
                e.printStackTrace();
            }


        }else{
            request.getRequestDispatcher("/404notfound/index.jsp").forward(request, response);
        }
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String chapterId = request.getParameter("chapterid");
        String name = request.getParameter("name");
        String description = request.getParameter("description");
        String id = request.getParameter("id");
        Part video = request.getPart("video");
        String realPath = request.getServletContext().getRealPath("/images");
        String filename = FileUploadUtil.uploadFile(video, realPath);
        Lession lession = lessionDAO.get(Integer.parseInt(id));
        HttpSession session=request.getSession();
        try {
            FileUploadUtil.deleteFile(realPath, lession.getLink());
            lessionDAO.update(new Lession(
                    Integer.parseInt(id),
                    Integer.parseInt(chapterId),
                    name,
                    description,
                    filename
            ));
            session.setAttribute("success","Update Lesson successfully");
        } catch (Exception e) {
            session.setAttribute("error","Error while updating Lesson");
        }
        response.sendRedirect("/dashboard/lessions?chapterid=" + chapterId);
    }

    public void destroy() {
    }
}