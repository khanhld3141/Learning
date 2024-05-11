package controller.Student.Learning;

import java.io.*;
import java.util.List;

import com.google.gson.Gson;
import dal.LessionCommentDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.LessionComment;
@MultipartConfig
@WebServlet(name = "GetCommentOfLessonServlet", value = "/get-comment")
public class GetCommentOfLesson extends HttpServlet {
    private String message;
    private LessionCommentDAO lessionCommentDAO;
    public void init() {
        message = "Hello World!";
        lessionCommentDAO=new LessionCommentDAO();
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("text/html");

        // Hello
        PrintWriter out = response.getWriter();
        out.println("<html><body>");
        out.println("<h1>" + message + "</h1>");
        out.println("</body></html>");
    }
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        System.out.println(123);
        String id=request.getParameter("id");
        try{
            List<LessionComment> comments=lessionCommentDAO.getAllLessionCommentsById(Integer.parseInt(id));
            request.setAttribute("comments",comments);

            for (LessionComment comment : comments){
                System.out.println(comment.getContent());
            }
            Gson gson = new Gson();
                String jsonComments = gson.toJson(comments);
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            PrintWriter out = response.getWriter();
            out.print(jsonComments);
            out.flush();
        }catch(Exception e){
            request.getRequestDispatcher("/404notfound/index.jsp").forward(request, response);
            e.printStackTrace();
        }
    }
    public void destroy() {
    }
}