package controller.Student.BlogController;

import dal.CourseCommentDAO;
import dal.PostCommentDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.CourseComment;
import model.PostComment;
import model.User;

import java.io.IOException;

@WebServlet(name = "UpdatePostCommentOfServlet", value = "/update-comment-of-post")
public class UpdateComment extends HttpServlet {
    private String message;
    private PostCommentDAO postCommentDAO;

    public void init() {
        message = "Hello World!";
        postCommentDAO = new PostCommentDAO();
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        if(request.getParameter("id")!=null){
            String idStr=request.getParameter("id");
            HttpSession session=request.getSession();
            try{
                int id=Integer.parseInt(idStr);
                PostComment postComment = postCommentDAO.get(id);

                request.setAttribute("postcomments", postComment);
                request.getRequestDispatcher("Status/update-status.jsp").forward(request, response);
            }catch (Exception e){
                e.printStackTrace();
            }


        }else{
            request.getRequestDispatcher("/404notfound/index.jsp").forward(request, response);
        }
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String id= request.getParameter("id");
        String postid = request.getParameter("postid");
        String content = request.getParameter("comment");
        HttpSession session=request.getSession();
        User user=(User)session.getAttribute("user");
       try{
           postCommentDAO.update(
                   new PostComment(
                           Integer.parseInt(id),
                           user.getId(),
                           Integer.parseInt(postid),
                           0,
                           content
                   )
           );

           session.setAttribute("success","Update comment successfully");

       }catch (Exception e){
           session.setAttribute("error","Error while updating comment");
       }
        response.sendRedirect("/detail-blog?id=" + postid);
    }

    public void destroy() {
    }
}