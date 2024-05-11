package controller.Admin.PostController;

import java.io.*;
import java.util.List;

import controller.Ulti.FileUploadUtil;
import dal.HashtagDAO;
import dal.PostDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.Hashtag;
import model.Post;
import model.Status;

@MultipartConfig
@WebServlet(name = "UpdatePostServlet", value = "/dashboard/update-post")
public class UpdatePost extends HttpServlet {
    private String message;
    private PostDAO postDAO;
    private HashtagDAO hashtagDAO;

    public void init() {
        message = "Hello World!";
        postDAO = new PostDAO();
        hashtagDAO = new HashtagDAO();
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        if (request.getParameter("id") != null) {
            String idStr = request.getParameter("id");
            try {
                int id = Integer.parseInt(idStr);
                Post post = postDAO.get(id);
                List<Hashtag> hashtags = hashtagDAO.getAllHashTagOfPost(id);
                request.setAttribute("hashtags", hashtags);
                request.setAttribute("post", post);
                request.getRequestDispatcher("/dashboard_post/update-post.jsp").forward(request, response);
            } catch (Exception e) {
                request.getRequestDispatcher("/404notfound/index.jsp").forward(request, response);
                e.printStackTrace();
            }


        }else{
            request.getRequestDispatcher("/404notfound/index.jsp").forward(request, response);
        }
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String content = request.getParameter("Content");
        String comment = request.getParameter("comment");
        String title = request.getParameter("title");
        Part image = request.getPart("image");
        String id = request.getParameter("id");
        String author = request.getParameter("author");
        String authors[] = author.split("-");
        String realPath = request.getServletContext().getRealPath("/images");
        String filename = FileUploadUtil.uploadFile(image, realPath);
        Post post = postDAO.get(Integer.parseInt(id));
        hashtagDAO.deleteAllOfPost(post.getId());
        String[] hashtags = request.getParameterValues("hashtag[]");
        for (String hashtag : hashtags) {
            if(!hashtag.isEmpty()){
                hashtagDAO.create(new Hashtag(
                        post.getId(),
                        hashtag
                ));
            }
        }
        try {
            postDAO.update(new Post(title, content, comment, filename, Integer.parseInt(id),
                    Integer.parseInt(authors[0])));
            response.sendRedirect("/dashboard/posts");
        } catch (Exception e) {
            request.getRequestDispatcher("/404notfound/index.jsp").forward(request, response);
            e.printStackTrace();
        }
    }

    public void destroy() {
    }
}