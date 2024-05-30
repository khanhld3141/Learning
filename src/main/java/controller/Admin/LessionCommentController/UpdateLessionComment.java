package controller.Admin.LessionCommentController;

import dal.CourseCommentDAO;
import dal.LessionCommentDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.CourseComment;
import model.LessionComment;

import java.io.IOException;

@WebServlet(name = "UpdateCourseCommentServlet", value = "/update-lession-comment")
public class UpdateLessionComment extends HttpServlet {
    private String message;
    private LessionCommentDAO lessionCommentDAO;

    public void init() {
        message = "Hello World!";
        lessionCommentDAO = new LessionCommentDAO();
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        if(request.getParameter("id")!=null){
            String idStr=request.getParameter("id");
            try{
                int id=Integer.parseInt(idStr);
                LessionComment lessionComment = lessionCommentDAO.get(id);

                request.setAttribute("lessioncomment", lessionComment);
                request.getRequestDispatcher("Status/update-status.jsp").forward(request, response);
            }catch (Exception e){
                e.printStackTrace();
            }


        }
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String id= request.getParameter("id");
        String lessionId = request.getParameter("lessionid");
        String authorId = request.getParameter("authorid");
        String parentId=request.getParameter("parentid");
        String content = request.getParameter("content");
        HttpSession session=request.getSession();
        try{

            lessionCommentDAO.update(
                    new LessionComment(
                            Integer.parseInt(id),
                            Integer.parseInt(lessionId),
                            Integer.parseInt(authorId),
                            Integer.parseInt(parentId),
                            content
                    )
            );

            session.setAttribute("success","Update comment successfully");
        }catch (Exception e){
            session.setAttribute("error","Error while updating comment");
        }
        response.sendRedirect("/comments-lession");

    }

    public void destroy() {
    }
}