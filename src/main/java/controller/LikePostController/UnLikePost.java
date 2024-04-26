package controller.LikePostController;

import java.io.*;

import dal.LikePostDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.LikePost;

@WebServlet(name = "UnLikePostServlet", value = "/unlike-post")
public class UnLikePost extends HttpServlet {
    private String message;

    private LikePostDAO likePostDAO;
    public void init() {
        message = "Hello World!";
        likePostDAO=new LikePostDAO();
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
        String idUser=request.getParameter("iduser");
        String idPost=request.getParameter("idpost");
        String id=request.getParameter("id");
        try{
            likePostDAO.delete(new LikePost(
                    Integer.parseInt(id),
                    Integer.parseInt(idUser),
                    Integer.parseInt(idPost)
            ));
            response.sendRedirect("");
        }catch(Exception e){
            request.setAttribute("error", "Please enter a course ID");
            request.getRequestDispatcher("/dashboard/courses").forward(request, response);
        }
    }

    public void destroy() {
    }
}