package controller.PostController;

import java.io.*;

import controller.Ulti.FileUploadUtil;
import dal.PostDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.Post;
import model.Status;

@MultipartConfig
@WebServlet(name = "UpdatePostServlet", value = "/dashboard/update-post")
public class UpdatePost extends HttpServlet {
    private String message;
    private PostDAO postDAO;

    public void init() {
        message = "Hello World!";
        postDAO = new PostDAO();
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        if (request.getParameter("id") != null) {
            String idStr = request.getParameter("id");
            try {
                int id = Integer.parseInt(idStr);
                Post post = postDAO.get(id);

                request.setAttribute("post", post);
                request.getRequestDispatcher("/dashboard_post/update-post.jsp").forward(request, response);
            } catch (Exception e) {
                e.printStackTrace();
            }


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
        try {
            FileUploadUtil.deleteFile(post.getImage(), realPath);
            postDAO.create(new Post(title, content, comment, filename,Integer.parseInt(id),
                    Integer.parseInt(authors[0])));
            response.sendRedirect("/dashboard/posts");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void destroy() {
    }
}