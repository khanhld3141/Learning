package controller.Student.Learning;

import java.io.*;

import com.google.gson.Gson;
import dal.LessionDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.Lession;
@MultipartConfig
@WebServlet(name = "GetLessonServlet", value = "/get-lesson")
public class GetLesson extends HttpServlet {
    private String message;
    private LessionDAO lessionDAO;

    public void init() {
        message = "Hello World!";
        lessionDAO=new LessionDAO();
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {

    }
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        try{
            if(request.getParameter("id")!=null && request.getParameter("courseid")!=null){
                String id=request.getParameter("id");
                Lession lession=lessionDAO.get(Integer.parseInt(id));

                Gson gson = new Gson();
                String less = gson.toJson(lession);
                System.out.println(less);
                response.setContentType("application/json");
                response.setCharacterEncoding("UTF-8");
                PrintWriter out = response.getWriter();
                out.print(less);
                out.flush();
            }else{
                request.getRequestDispatcher("/404notfound/index.jsp").forward(request, response);
            }
        }catch (Exception e){
            request.getRequestDispatcher("/404notfound/index.jsp").forward(request, response);
        }
    }

    public void destroy() {
    }
}