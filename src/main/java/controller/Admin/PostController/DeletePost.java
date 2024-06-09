package controller.Admin.PostController;

import java.io.*;
import java.util.List;

import dal.HashtagDAO;
import dal.PostDAO;
import dal.PostHashtagDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.PostHashtag;

@WebServlet(name = "DeletePostServlet", value = "/dashboard/delete-post")
public class DeletePost extends HttpServlet {
    private String message;
    private PostDAO postDAO;
    private PostHashtagDAO postHashtagDAO;
    private HashtagDAO hashtagDAO;
    public void init() {
        message = "Hello World!";
        postDAO=new PostDAO();
        postHashtagDAO=new PostHashtagDAO();
        hashtagDAO=new HashtagDAO();
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        if (request.getParameter(("id")) != null) {
            String idStr = request.getParameter(("id"));
            HttpSession session = request.getSession();
            try {
                int id = Integer.parseInt(idStr);
                List<PostHashtag> postHashtags=postHashtagDAO.get(id);
                postHashtagDAO.deleteHashtagOfPost(id);
                for(PostHashtag postHashtag : postHashtags){
                    if(postHashtagDAO.getByTagId(postHashtag.getHashtagId()).size() == 0){
                        hashtagDAO.delete(postHashtag.getHashtagId());
                    }
                }
                postDAO.delete(id);

              session.setAttribute("success","Delete Post successfully");
            } catch (Exception e) {
                session.setAttribute("error","Error while deleting Post");
            }
            response.sendRedirect("/dashboard/posts");
        } else {
            request.getRequestDispatcher("/404notfound/index.jsp").forward(request, response);
        }
    }

    public void destroy() {
    }
}