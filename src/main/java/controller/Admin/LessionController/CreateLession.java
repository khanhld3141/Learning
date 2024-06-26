package controller.Admin.LessionController;

import java.io.*;

import controller.Ulti.FileUploadUtil;
import dal.LessionDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.Lession;
@MultipartConfig
@WebServlet(name = "CreateLessionServlet", value = "/dashboard/create-lession")
public class CreateLession extends HttpServlet {
    private String message;
    private LessionDAO lessionDAO;

    public void init() {
        message = "Hello World!";
        lessionDAO = new LessionDAO();
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        if (request.getParameter("chapterid") != null) {
            request.setAttribute("chapterid", request.getParameter("chapterid"));
            request.getRequestDispatcher("").forward(request, response);
        } else {
            request.setAttribute("error", "Please enter chapter id");
            request.getRequestDispatcher("/404notfound/index.jsp").forward(request, response);
        }
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String chapterId = request.getParameter("chapterid");
        String name = request.getParameter("name");
        String description = request.getParameter("description");
        Part video = request.getPart("video");
        String realPath = request.getServletContext().getRealPath("/images");
        String filename = FileUploadUtil.uploadFile(video, realPath);
        HttpSession session=request.getSession();
        try{
            lessionDAO.create(new Lession(
                    Integer.parseInt(chapterId),
                    name,
                    description,
                    filename
            ));
           session.setAttribute("success","Add new Lesson successfully");
        }catch(Exception e){
            session.setAttribute("error","Error while creating Lesson");
        }
        response.sendRedirect("/dashboard/lessions?chapterid="+chapterId);
    }


    public void destroy() {
    }
}