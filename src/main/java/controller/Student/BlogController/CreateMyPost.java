package controller.Student.BlogController;

import java.io.*;

import controller.Ulti.FileUploadUtil;
import dal.HashtagDAO;
import dal.PostDAO;
import dal.PostHashtagDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.Hashtag;
import model.Post;
import model.PostHashtag;
import model.User;

@MultipartConfig
@WebServlet(name = "CreateMyPostServlet", value = "/create-my-post")
public class CreateMyPost extends HttpServlet {
    private String message;
    private PostDAO postDAO;
    private HashtagDAO hashtagDAO;
    private PostHashtagDAO postHashtagDAO;

    public void init() {
        message = "Hello World!";
        postDAO = new PostDAO();
        hashtagDAO = new HashtagDAO();
        postHashtagDAO = new PostHashtagDAO();
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        request.getRequestDispatcher("/Manage-users-blog/add-post.jsp").forward(request, response);
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String content = request.getParameter("content");
        String comment = request.getParameter("comment");
        String title = request.getParameter("title");
        Part image = request.getPart("image");
        String realPath = request.getServletContext().getRealPath("/images");
        String filename = FileUploadUtil.uploadFile(image, realPath);
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        String[] hashtags = request.getParameterValues("hashtag[]");

        try {
            int postid = postDAO.create(new Post(title, content, comment, filename, user.getId()));
            if (hashtags != null && postid != -1) {
                for (String hashtag : hashtags) {
                    if (!hashtag.isEmpty()) {
                        Hashtag hashtag1 = hashtagDAO.getByHashtag(hashtag.toLowerCase());
                        if (hashtag1 != null) {
                            postHashtagDAO.create(new PostHashtag(
                                    postid,
                                    hashtag1.getId()
                            ));
                        } else {
                           int hashtagid= hashtagDAO.create(new Hashtag(postid,hashtag));
                            postHashtagDAO.create(new PostHashtag(
                                    postid,
                                    hashtagid
                            ));
                        }
                    }
                }
            }
            session.setAttribute("success", "Add new post successfully");
        } catch (Exception e) {
            session.setAttribute("error", "Error while add new post");
        }
        response.sendRedirect("/my-posts");
    }

    public void destroy() {
    }
}