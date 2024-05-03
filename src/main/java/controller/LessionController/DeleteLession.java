package controller.LessionController;

import java.io.*;

import controller.Ulti.FileUploadUtil;
import dal.LessionDAO;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.Course;
import model.Lession;

@WebServlet(name = "DeleteLessionServlet", value = "/DeleteLession-servlet")
public class DeleteLession extends HttpServlet {
    private String message;
    private LessionDAO lessionDAO;

    public void init() {
        message = "Hello World!";
        lessionDAO=new LessionDAO();
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        if (request.getParameter(("id")) != null) {
            String idStr = request.getParameter(("id"));
            try {
                int id = Integer.parseInt(idStr);
                Lession lession = lessionDAO.get(id);
                String realPath = request.getServletContext().getRealPath("/images");
                FileUploadUtil.deleteFile(realPath,lession.getLink());
                lessionDAO.delete(id);
                response.sendRedirect("");
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }

    public void destroy() {
    }
}